---******************************************************
-- Creamos la base de datos si no existe.
-- *****************************************************
 
IF NOT EXISTS (SELECT * from sys.databases where name = 'cantalupibus2015')
BEGIN
	CREATE DATABASE cantalupibus2015;
END
go 
-- Establecemos la  base de datos predeterminada

USE CANTALUPIBUS2015
GO

--*********************************************
--******  TABLAS DE LA BASE DE DATOS  *********
--*********************************************        

--***** CLIENTES *******************
create table Clientes
(
  Dni varchar(20),
  Nombre varchar(50),
  Apellido varchar(50),
  FechaNacimiento date,
  FechaAlta date,
  Telefono varchar(20),
  calle varchar(50), 
  numero nchar(5),
  piso nchar(5),
  departamento nchar(5),
  Localidad varchar(30),
  CodigoPostal nchar(5),
  CorreoElectronico varchar (30),
  TipoUsuario bit,
  ClienteActivo bit,
  CONSTRAINT PK_Clientes PRIMARY KEY(dni)
 );
go

 --****** LUGARES ***********************
create table Lugares
(
 IdLugar int identity(1,1),
 Lugar nvarchar(50)
 
 CONSTRAINT PK_Lugares PRIMARY KEY(IdLugar)
 );  
go
 
 --****** VIAJES DIARIOS ***********************
create table ViajesDiarios
(
 CodViaje int identity(1,1),
 fechaViajeDiario date,
 Turno varchar(20),
 Origen varchar(50),
 Destino varchar(50),
 IdMInibusAsignado int ,
 LegajoChofer int,
 CantPasajerosDiarios int,
 Observaciones varchar(60),
 
 CONSTRAINT PK_ViajesDiarios PRIMARY KEY(CodViaje)
 );  
go

--****** MINI BUSES***********************
create table MiniBuses
(
 IdMiniBus int identity(1,1),
 IdModeloBus int,
 CodPrestacionBus int,
 color varchar(20),
 patente varchar(10),
 BusActivo bit,
 CONSTRAINT PK_MiniBuses PRIMARY KEY(IdMiniBus)
 );  
go

--****** MODELOS ***********************
create table Modelos
(
 IdModelo int identity(1,1),
 Modelo varchar(50),
 FechaFabricacion date,
 Pais varchar(20),
 CapAsientos int,
 ImgUrl nvarchar(100),
 
 CONSTRAINT PK_Modelos PRIMARY KEY(IdModelo)
 );  
go
 
--****** EMPLEADOS ***********************
create table Empleados
(
 Legajo int identity(1,1),
 CodSectorEmpleado int,
 Nombre varchar(50),
 Apellido varchar(50),
 clave varchar(5),
 empleadoActivo bit,
 CONSTRAINT PK_Empleados PRIMARY KEY(Legajo)
 );  
go 


--****** EVENTOS CASUALES***********************
create table EventosCasuales
(
 CodEvento int identity(1,1),
 IdminiBusEvento int,
 LegajoChoferEvento int,
 codPresupuesto int,
 cantPasajeros int,
 Importe float,
 FechaPedido date,
 FechaViaje date,
 HoraViaje time
 CONSTRAINT PK_EventosCasuales PRIMARY KEY(codEvento)
 );  
go 

--****** PRESTACIONES ***********************
create table Prestaciones
(
 codPrestacion int identity(1,1),
 Elemento varchar(50),
 CONSTRAINT PK_Prestaciones PRIMARY KEY(codPrestacion)
 );  
go 

--****** SECTOR***********************
create table Sector
(
 codSector varchar(3),
 Descripcion varchar(50),
 CONSTRAINT PK_Sector PRIMARY KEY(codSector)
 );  
go 

--******** PRESUPUESTO *********
create table Presupuesto
(
 codPresupuesto int identity(1000,1),
 dniP varchar(20),
 NombreCLiente nvarchar(50),
 ApellidoCliente nvarchar(40),
 EmailCliente nchar (100),
 TelefonocCliente nchar(15),
 lugarOrigen nvarchar(50),
 LugarDestino nvarchar(50),
 Comentarios nvarchar(500),
 Asignado bit,
 CONSTRAINT PK_Presupuesto PRIMARY KEY(codPresupuesto)
);
go



--*****************************************************************
--**********  CARGA DE DATOS EN LAS TABLAS   **********************
--*****************************************************************

--********  cargando datos en la tabla Presupuesto  ***************/
INSERT INTO Presupuesto (dnip,NombreCliente, ApellidoCliente, EmailCliente, TelefonocCliente, lugarOrigen, LugarDestino, Comentarios, Asignado) 
select '14522365','Tito', 'Pecho', 'tito@gandolfi.com', '12347-9100', 'Campana', 'Pacheco', '20 personas', 1 union
select '18965129','Nidia', 'Casanova', 'juancito15@gmail.com', null, 'José C. Paz', 'La Plata', 'Recital', 1 union
select '20188623','Lucrecia', 'Roccattagliatta', 'lucreciamr@hotmail.com', '47456-5221', 'Laferrere', 'Lanús', null, 1 union
select '21588412','José', 'Sosa', 'jose@yahoo.com.ar', null, 'General Pacheco', 'Luján', 'Partido', 1 union
select '53266951','Arnold', 'Bernardth', 'terminator@gmail.com', null, 'Garín', 'Grand Bourg', null, 0 union
select '16167852','Sergio', 'Buchini', 'sergio@gmail.com', null, 'Campana', 'Retiro', '2 personas', 0 union
select '33698741','Luciano', 'Gonzalez', 'gonzalez@msn.com', null, 'Ezeiza', 'General Pacheco', 'Casamiento', 0 union
select '21475321','Nicolás', 'Falcón', 'nico@yahoo.com', null, 'Los Troncos', 'Don Torcuato', null, 0
go

--******* cargando datos en tabla Eventos Casuales ***********
 INSERT INTO EventosCasuales (IdminiBusEvento,LegajoChoferEvento,codPresupuesto,cantPasajeros,Importe,FechaPedido,FechaViaje,HoraViaje) 
select 26,2,1000,30,300,'2014/12/11','2014/12/22','17:00' union
select 12,3,1002,20,200,'2014/12/12','2014/12/22','14:00' union
select 6,2,1003,15,150,'2015/03/01','2015/03/10','10:00' union
select 9,2,1005,36,800,'2015/12/15', '2015/12/25','10:00'
go  

--*******  cargando datos en viajes diarios  ************
INSERT ViajesDiarios (fechaViajeDiario, Turno, Origen, Destino, IdMiniBusAsignado, LegajoChofer, CantPasajerosDiarios, Observaciones) 
select '2015/12/12', 'Tarde', 'General Pacheco', 'Retiro', '21', '9', 15, 'Se desmayó una anciana' union
select '2015/12/13', 'Mañana', 'Retiro', 'General Pacheco', '10', '8', 20, null union
select '2015/12/13', 'Tarde', 'Campana', 'Pablo Nogués', '25', '8', 15, 'Hubo un corte' union
select '2015/12/14', 'Mañana', 'Retiro', 'General Pacheco', '19', '7', 30, null union
select '2015/12/14', 'Tarde', 'San Miguel', 'Grand Bourg', '19', '6', 15, null union
select '2015/12/15', 'Mañana', 'Los Polvorines', 'Los Troncos', '3', '1', 15,'Socio abandonó el minibus' union
select '2015/12/15', 'Tarde', 'San Miguel', 'Grand Bourg', '10', '4', 10, null union
select '2015/12/16', 'Mañana', 'Saavedra', 'Pablo Nogués', '6', '3', 15,'Muerte en la carretera' union
select '2015/12/16', 'Tarde', 'Lanús', 'Garín', '3', '7', 15,'Retraso de 1 hora' union
select '2015/12/17', 'Mañana', 'Ezeiza', 'General Pacheco', '19', '5', 12, null union
select '2015/12/17', 'Tarde', 'Los Troncos', 'Lanús', '21', '3', 15,'Hubo un corte' union
select '2015/12/19', 'Mañana', 'El Talar', 'Saavedra', '19', '3', 30,'Piquetes' union
select '2015/12/19', 'Tarde', 'Pablo Nogués', 'Campana', '19', '2', 40, null union
select '2015/12/20', 'Mañana', 'José C. Paz', 'San Miguel', '19', '8', 30,'Se desmayó un señor'
go  



--********  cargando datos en la tabla Clientes  ***************/
INSERT INTO Clientes (dni,Nombre,Apellido,FechaNacimiento,FechaAlta,Telefono,calle ,numero ,piso ,departamento ,Localidad ,CodigoPostal,CorreoElectronico ,TipoUsuario ,ClienteActivo ) 
select '12345678','Nazarena','Velez','1992/04/11','05/05/2005','4663-4086','Velez Sarsfield','3225','3','C','Moreno','2333','naza@terra.com.ar',1,1 union
select '22211112','Eugenia','Vidal','1991/01/01','06/06/2005','4762-3480','Las Dalias','225','7','F','San Miguel','333','limbo@purgatorio.com',1,1 union
select '38765234','Marcos','Beltrán','1990/11/05','05/03/2005','4231-1597','Cochabamba','1614',null,null,'La Plata','1611','markisho@gmail.com',1,1 union
select '14552336','Jhasmani','Campos','1950/06/05','05/03/2006','4536-1857','Carabobo','123',null,null,'El Talar','1611','jhasmanicampos@gmail.com',1,1 union
select '15632221','Mauricio','Macri','1930/04/01','05/03/2008','8251-1123','Combate de los Pozos','782',null,null,'Los Troncos','1611','combatedelospozos@gmail.com',1,1 union
select '35855212','Cristina','Kirchner','1925/04/01','05/03/2009','4221-1557','Hipólito Yrigoyen','1325','2','H','Pacheco','1611','kirchner@casarosada.com',1,1 union
select '12321547','Raúl','Quintanita','1977/06/03','05/03/2009','4740-1869','Piedra','8752','3','J','Lanús','1611','rquintanita@gmail.com',1,1 union
select '12354112','Juan','Gandolfi','1986/08/01','05/03/2009','5418-1571','Falsa','123',null,null,'Merlo','1611','juan@gandolfi.com',1,1 union
select '32514412','Pedro','Piedranueva','1933/03/08','05/03/2010','8712-8795','Salvador','2221','2','K','Grand Bourg','1611','pedro@hotmailcom',1,1 union
select '95321121','Mauro','Rodriguez','1949/08/10','05/03/2010','5412-6541','Zepeda','4872','8','L','Los Polvorines','1611',null,1,1 union
select '41121445','Juan','Trululu','1983/01/11','05/03/2011','4523-2222','Kennedy','154',null,null,'José C. Paz','1611','trululu@yahoo.com',1,1 union
select '16213317','Magalí','Perez','1983/02/11','05/03/2012','4244-4685','San Martín','521','1','H2O','Pablo Nogués','1611','magali@gmail.com',1,1 union
select '22351874','Rosa','Fernández','1985/03/12','05/03/2013','4612-7846','Fray Luis','5613',null,null,'Grand Bourg','1611',null,1,1 union
select '23321544','Zinedine','Zidane','1993/04/04','05/03/2015','5910-0097','Salvador','5641',null,null, 'Merlo','1611','zizu@fmail.com',1,1 union
select '17852311','Luciana','Aimar','1918/04/01','05/03/2015','4455-5637','Lavalleja','541',null,null,'Pacheco','1611',null,1,1 union

select '14522365','Tito', 'Pecho', null, null, '12347-9100', null, null, null, null, null, null, 'tito@gandolfi.com',0,1 union
select '18965129','Nidia', 'Casanova', null, null, null, null, null, null, null, null, null, 'juancito15@gmail.com', 0,1 union
select '20188623','Lucrecia', 'Roccattagliatta', null, null, '47456-5221', null, null, null, null, null, null,'lucreciamr@hotmail.com' ,0,1 union
select '21588412','José', 'Sosa', null, null, null, null, null, null, null, null, null, 'jose@yahoo.com.ar', 0,1 union
select '53266951','Arnold', 'Bernardth', null, null, null, null, null, null, null, null, null, 'terminator@gmail.com', 0,1 union
select '16167852','Sergio', 'Buchini', null, null, null, null, null, null, null, null, null, 'sergio@gmail.com' ,0,1 union
select '33698741','Luciano', 'Gonzalez', null, null, null, null, null, null, null, null, null, 'gonzalez@msn.com',0,1 union
select '21475321','Nicolás', 'Falcón', null, null, null, null, null, null, null, null, null, 'nico@yahoo.com' ,0,1 
go

--*******  cargando datos en Sector  ************
INSERT INTO Sector  (codSector, Descripcion) 
select 1, 'Administrador' union
select 2, 'Chofer'
go

--*******  cargando datos en Lugares  ************
INSERT INTO Lugares (Lugar) 
select 'General Pacheco' union
select 'José C. Paz' union
select 'Pablo Nogués' union
select 'Grand Bourg' union
select 'Los Polvorines' union
select 'El Talar' union
select 'Retiro' union
select 'Saavedra' union
select 'Lanús' union
select 'Campana' union
select 'Los Troncos' union
select 'Ezeiza' union
select 'Garín'
go

--******** cargando datos en la tabla empleados ***************
INSERT INTO Empleados (CodSectorEmpleado,Nombre,Apellido,clave,empleadoActivo) 
select 1,'Rodolfo','Barilli','9999',1 union
select 1,'Karina','Jelinek','1234',1 union
select 2,'José','Fontanela',null,1 union
select 2,'Juan','Fontana',null,1 union
select 2,'Héctor','Pérez',null,1 union
select 2,'Diego','Caretta',null,1 union
select 2,'Rómulo','Santavequia',null,1 union
select 2,'Santo','Biasati',null,1 union
select 2,'Esteban','Reintintín',null,1
go

--********* cargando datos en la tabla Modelos **************
--IdModelo int identity(1,1),IdMarcaModelo int,Modelo varchar(50),FechaFabricacion date,Pais varchar(20),CapAsientos int,
INSERT INTO Modelos (Modelo,FechaFabricacion,Pais,CapAsientos, ImgUrl ) 
select 'Sprinter Combi','2014/02/01','Brasil',25, 'Combis/01.jpg' union
select 'Fiat Ducato','2014/03/01','Argentina',30, 'Combis/02.jpg' union
select 'Super Jhiasmani','2015/05/05','Perú',40, 'Combis/03.jpg' union
select 'Carufatti A3500','2005/12/01','Alemania',20, 'Combis/04.jpg' union
select 'RapMaster 2000','2016/11/16','Colombia',45, 'Combis/05.jpg' union
select 'AHU HUB','2001/07/06','Argentina',15, 'Combis/06.jpg' union
select 'Satellite 88.8','1995/05/03','Brasil',10, 'Combis/07.jpg' union
select 'Over J4','2013/06/05','Argentina',30, 'Combis/08.jpg' union
select 'Fiat F12','2015/04/17','Argentina',35, 'Combis/09.jpg'
go

--******** cargando datos en la tabla Prestaciones ***************
--codPrestacion int identity(1,1),Elemento varchar(50),
INSERT INTO Prestaciones (Elemento ) 
select 'Aire Acondicionado ' union
select 'Led Tv' union
select 'Plataforma Discapacitados'
go

--******** cargando datos en la tabla MiniBuses ***************
--IdMiniBus int identity(1,1),IdMarcaBus int,IdModeloBus int,CodPrestacionBus int,color varchar(20),patente varchar(10),BusActivo bit,
INSERT INTO MiniBuses (IdModeloBus,CodPrestacionBus,color,patente ,BusActivo ) 
select 1,1,'#FF0000','LDS 234',1 union
select 2,2,'#FFFF00','LIS 345',1 union
select 4,3,'#FFFF00','LED 234',1 union
select 5,1,'#0101DF','RCA 722',1 union
select 9,2,'#FF0000','VGA 312',1 union
select 8,3,'#FFFF00','CRI 684',1 union
select 5,1,'#0101DF','CRY 531',1 union
select 2,2,'#0101DF','OPS 984',1 union
select 3,3,'#0101DF','CUL 312',1 union
select 4,1,'#000000','SDS 233',1 union
select 6,2,'#000000','FFD 988',1 union
select 6,3,'#FFFF00','FAS 875',1 union
select 8,1,'#00FF40','DSX 999',1 union
select 7,2,'#FF0000','EWS 668',1 union
select 4,3,'#848484','QWD 777',1 union
select 4,1,'#FFFF00','QWF 987',1 union
select 1,2,'#848484','GGG 322',1 union
select 2,3,'#0101DF','UJH 312',1 union
select 8,1,'#000000','LFK 848',1 union
select 9,2,'#848484','JFY 561',1 union
select 1,3,'#848484','BGF 864',1 union
select 1,1,'#FFFF00','NGH 894',1 union
select 2,2,'#00FF40','IKK 654',1 union
select 3,3,'#FFFF00','FGB 963',1 union
select 5,1,'#0101DF','KIO 321',1 union
select 5,2,'#0101DF','YUN 987',1 union
select 7,3,'#FF0000','LFF 855',1
go 


--*************************************************
--********     PROCEDIMIENTOS         *************
--*************************************************

--*******  Procedimiento Traer Clientes **********
Create Procedure traerClientes
as
select dni,
Nombre,
Apellido,
FechaNacimiento,
FechaAlta,
Telefono,
calle,
numero,
piso,
departamento,
Localidad,
CodigoPostal,
CorreoElectronico,
TipoUsuario
from Clientes
where ClienteActivo=1
ORDER BY FechaAlta DESC
go

--***** procedimiento altaCliente *********
create procedure AltaCliente
@dni varchar(20),
@Nombre varchar(50) ,
@Apellido varchar(50),
@FechaNacimiento date ,
@FechAlta date,
@Telefono varchar(20),
@calle varchar(50),
@numero nchar (5),
@piso nchar(5),
@depto nchar(5),
@localidad varchar(30),
@codigoPostal nchar(5),
@CorreoElectronico varchar(30),
@tipoUsurio bit
As
Insert Into Clientes 
(Dni ,
Nombre  ,
Apellido ,
FechaNacimiento,
FechaAlta ,
Telefono,
calle,
numero,
piso,
departamento,
Localidad,
CodigoPostal,
CorreoElectronico,
TipoUsuario, 
ClienteActivo 
)
Values
	(@dni ,
@Nombre ,
@Apellido,
@FechaNacimiento,
@FechAlta,
@Telefono  ,
@calle ,
@numero,
@piso,
@depto,
@localidad,
@codigoPostal,
@CorreoElectronico,
@tipoUsurio, 
1 
)
Go 

--*********** procedimiento Modificar cliente **********

create procedure ModificarCliente
@dni varchar(20),
@Nombre varchar(50) ,
@Apellido varchar(50),
@FechaNacimiento date ,
@FechAlta date,
@Telefono varchar(20),
@calle varchar(50),
@numero nchar (5),
@piso nchar(5),
@depto nchar(5),
@localidad varchar(30),
@codigoPostal nchar(5),
@CorreoElectronico varchar(30),
@tipoUsurio bit
as
Update Clientes    Set
dni=@dni,
nombre=@Nombre ,
Apellido=@Apellido,
fechaNacimiento=@FechaNacimiento  ,
FechaAlta=@FechAlta,
telefono=@Telefono,
calle=@calle,
numero=@numero,
piso=@piso,
departamento=@depto,
localidad=@localidad,
codigoPostal=@codigoPostal,
correoElectronico=@CorreoElectronico ,
tipoUsuario=@tipoUsurio
Where Dni = @dni  
go 

--*********** procedimiento Modificar Presupuesto **********

create procedure ModificarPresupuesto
@codPresupuesto int,
@dniP varchar(20),
@NombreCliente nvarchar(50),
@ApellidoCliente nvarchar(40),
@EmailCliente nchar(40),
@TelefonoCliente nchar(15),
@lugarOrigen nvarchar(50),
@LugarDestino nvarchar(50),
@Comentarios nvarchar(500)
as
Update Presupuesto    Set
dniP = @dniP,
NombreCliente = @NombreCliente,
ApellidoCliente = @ApellidoCliente,
EmailCliente = @EmailCliente,
TelefonocCliente = @TelefonoCliente,
lugarOrigen = @lugarOrigen,
LugarDestino = @LugarDestino,
Comentarios = @Comentarios
Where codPresupuesto = @codPresupuesto  
go 

--******* procedimiento eliminar Cliente ***********
CREATE procedure [dbo].[eliminarCliente]
@dni varchar(20)
as
update Clientes   set 
       ClienteActivo=0 
       where Dni =@dni  
go

--procedimiento validar empleado existente
create procedure validarEmpleado
@legajo int,
@clave varchar(5)
as
select legajo
From Empleados 
Where Empleados.Legajo = @legajo  And Empleados.Clave = @clave
AND Empleados.CodSectorEmpleado = 1
AND Empleados.empleadoActivo = 1
go

--procedimiento traer nombre de empleado
CREATE procedure traerNombreEmpleado
@legajo int

AS
SELECT Empleados.Apellido + ', ' + Empleados.nombre 
FROM Empleados
WHERE legajo=@legajo
go


--*************************************
--*********  MINIBUSES  ***************
--*************************************
 
 --****** Traer Minibuses ************
 create procedure traerMinibuses
 as
 select
 idminibus,
 Modelos.Modelo AS 'idmodelobus',
 patente,
 color,
 Prestaciones.Elemento as 'CodPrestacionBus'

 from MiniBuses
 inner join Modelos on Modelos.IdModelo = MiniBuses.IdModeloBus
 inner join Prestaciones on Prestaciones.codPrestacion = MiniBuses.CodPrestacionBus
 WHERE BusActivo=1
 go
 
 --****** altaMinibuses ***********
 create procedure AltaBuses
@IdModeloBus int ,
@CodPrestacionBus int,
@color varchar(20) ,
@patente varchar(10)
As
Insert Into MiniBuses 
(IdModeloBus ,
CodPrestacionBus ,
color,
patente ,
BusActivo 
)
Values
	(@IdModeloBus ,
@CodPrestacionBus,
@color,
@patente,
1
)
Go 

--*********** procedimiento Modificar minibus **********

create procedure ModificarMinibus
@idminibus int,
@color varchar(20),
@codprestacionbus int

as
Update MiniBuses    Set
color = @color,
CodPrestacionBus = @codprestacionbus
Where IdMiniBus = @idminibus 
go 
 
--******* eliminar Minibuses *********
create procedure eliminarMinibuses
@IdMiniBus int
as
update MiniBuses   set 
       BusActivo=0
       where IdMiniBus =@IdMiniBus    
go 

--*************************************
--********* EVENTOS CASUALES **********
--*************************************

--******* traer Eventos Casuales ******
create procedure traerEventosCasuales
as
select
CodEvento,
codPresupuesto,
Modelos.Modelo AS 'IdminiBusEvento',
Empleados.Nombre + ' ' + Empleados.Apellido AS 'LegajoChoferEvento',
cantPasajeros,
FechaPedido,
FechaViaje,
cast(HoraViaje as datetime) AS 'HoraViaje',
Importe

from EventosCasuales

INNER JOIN MiniBuses ON MiniBuses.IdMiniBus = EventosCasuales.IdminiBusEvento
INNER JOIN Modelos ON Modelos.IdModelo = MiniBuses.IdModeloBus
INNER JOIN Empleados ON Empleados.Legajo = EventosCasuales.LegajoChoferEvento
go

--****** alta Eventos Casuales ********
create procedure altaEventosCasuales
@IdminiBusEvento int,
@LegajoChoferEvento int,
@codPresupuesto int,
@cantPasajeros int,
@Importe float,
@FechaPedido date,
@FechaViaje date,
@HoraViaje time
As
Insert Into EventosCasuales 

(idminibusevento ,
legajoChoferEvento ,
codPresupuesto,
cantPasajeros ,
importe,
fechapedido,
fechaViaje,
horaViaje
)
Values
	(@IdminiBusEvento ,
@LegajoChoferEvento ,
@codPresupuesto,
@cantPasajeros,
@Importe ,
getdate(),
@FechaViaje,
@HoraViaje
)
go 

--******** modificar evento casual *****
create procedure modificarEventosCasuales
@codEvento int,
@IdminiBusEvento int ,
@LegajoChoferEvento int,
@codPresupuesto int,
@cantPasajeros int,
@Importe float,
@FechaPedido date,
@FechaViaje date,
@HoraViaje time
as
update EventosCasuales   set 
IdMiniBusEvento = @IdMiniBusEvento,
LegajoChoferEvento = @LegajoChoferEvento,
codPresupuesto=@codPresupuesto,
cantPasajeros=@cantPasajeros,
importe=@Importe,
fechaPedido=@fechaPedido,
fechaViaje=@FechaViaje,
horaviaje=@HoraViaje
       
       where CodEvento =@codEvento    
go 

--*************************************
--******** PRESUPUESTOS ***************
--*************************************

--******* Procedimiento     ***********
--******  traerPresupuesto  **********
CREATE procedure traerPresupuesto
as
select
dniP,
codPresupuesto,
NombreCliente,
ApellidoCliente,
EmailCliente,
TelefonocCliente,
lugarOrigen,
LugarDestino,
Comentarios
from Presupuesto
WHERE Presupuesto.Asignado=0
ORDER BY codPresupuesto DESC
go

--*******  procedimiento     **********
--*******  AltaPresupuesto   ********** 
create procedure altaPresupuesto
@dniP varchar(20),
@NombreCliente nvarchar(50) ,
@ApellidoCliente nvarchar (50) ,
@emailCliente nchar(100),
@TelefonoCliente nchar(15),
@lugarOrigen nvarchar(50),
@LugarDestino nvarchar(50),
@Comentarios nvarchar(500)
As
Insert Into Presupuesto
(
dniP,
NombreCLiente,
ApellidoCliente,
EmailCliente,
TelefonocCliente,
lugarOrigen,
LugarDestino,
Comentarios,
Asignado
)
Values
	(
@dniP,
@NombreCliente ,
@ApellidoCliente,
@emailCliente,
@TelefonoCliente,
@lugarOrigen ,
@LugarDestino ,
@Comentarios,
0
)
go

--********   procedimiento     ***********
--********   Busqueda de Presupuesto *****
create procedure BusquedaPresupuesto
@codPresupuesto int
as
select * from Presupuesto where codPresupuesto=@codPresupuesto
go

--*************************************
--*******   VIAJES DIARIOS  ***********
--*************************************

--****** procedimiento    *********
--****** alta de viajes diarios *** 
 create procedure altaViajesDiarios
 @fechaViajeDiario date,
 @turno varchar(20),
 @origen varchar(50),
 @destino varchar(50),
 @IdminibusAsignado int,
 @legajoChofer int,
 @cantPasajerosDiarios int,
 @observaciones varchar(60)
 as
 Insert Into ViajesDiarios
( 
fechaViajeDiario,
Turno ,
Origen,
Destino,
IdMInibusAsignado ,
LegajoChofer,
CantPasajerosDiarios,
Observaciones
)
Values
	(
@fechaViajeDiario,	
@turno ,
@origen,
@destino,
@IdminibusAsignado,
@legajoChofer,
@cantPasajerosDiarios,
@observaciones
)
go
 
--****** procedimientos    ******
--****** traer Viajes diarios ***
 create procedure traerViajesDiarios
 as
 select CodViaje,
 fechaViajeDiario,
 Turno,
 Origen,
 Destino,
 Modelos.Modelo AS 'IdMInibusAsignado',
 Empleados.Nombre + ' ' + Empleados.Apellido AS 'LegajoChofer',
 CantPasajerosDiarios,
 Observaciones
 from ViajesDiarios
INNER JOIN MiniBuses ON MiniBuses.IdMiniBus = ViajesDiarios.IdMInibusAsignado
INNER JOIN Modelos ON Modelos.IdModelo = MiniBuses.IdModeloBus
INNER JOIN Empleados ON Empleados.Legajo = ViajesDiarios.LegajoChofer
 go

--******* procedimiento      *******
--******* buscarViajeDiario  *******
create procedure buscarViajeDiario
@fechaViaje date
as
select * from ViajesDiarios where fechaViajeDiario =@fechaViaje
go

--******  procedimiento     *********
--******  ModificarViajeDiario  *****
create procedure modificarViajeDiario
@codViaje int,
@origen varchar(50),
@destino varchar(50),
@idminibusAsignado int,
@legajoChofer int,
@cantPasajerosDiarios int,
@observaciones varchar(60)
as
update ViajesDiarios   set 
Origen=@origen,
Destino=@destino,
IdMInibusAsignado=@idminibusAsignado,
LegajoChofer=@legajoChofer,
CantPasajerosDiarios=@cantPasajerosDiarios,
Observaciones=@observaciones
       where CodViaje=@codViaje    
go 




--******  procedimiento     *********
--******  traerUltimoCodigoPresupuesto  *****
Create Procedure traerUltimoCodPresupuesto
as
SELECT TOP 1 codPresupuesto FROM Presupuesto
ORDER BY codPresupuesto DESC 
go



--******  procedimiento     *********
--******  traerModelos  *****
Create Procedure traerModelos
as
SELECT * from Modelos
go      



--******  procedimiento     *********
--******  cancelarEventoCasual  *****
CREATE procedure cancelarEventoCasual
@CodEvento int
as
DELETE FROM EventosCasuales
where CodEvento=@CodEvento  
go


--******  procedimiento     *********
--******  traerRecTotalEventosCasuales  *****
CREATE procedure traerRecTotalEventosCasuales
AS
SELECT SUM(EventosCasuales.Importe)
FROM EventosCasuales
go

--******  procedimiento     *********
--******  traerCantViajesDiarios  *****
CREATE procedure traerCantViajesDiarios
AS
SELECT COUNT(*)
FROM ViajesDiarios
go

--******  procedimiento     *********
--******  traerCantEventosCasuales  *****
CREATE procedure traerCantEventosCasuales
AS
SELECT COUNT(*)
FROM EventosCasuales
go


--*************************************
--*********  TRIGGERS  ****************
--*************************************

--******  Trigger          **********
--******  Alta de Clientes **********
--cuando se carga un nuevo presupuesto los
--datos del solicitante se guardan en la tabla clientes

create trigger nuevoClienteTr
  on presupuesto
  for insert
 as 
   BEGIN
SET NOCOUNT ON;
Declare @dniPresupuesto varchar(20);  --Declaramos las variables dniPresupuesto
Select @dniPresupuesto = (Select dnip From Inserted ); --Obtenemos el dni del cliente recien 
                                                        --insertado en presupuesto
 if exists(select dni from clientes where dni=@dniPresupuesto)  --si existe no hace nada
   return 
else
  begin                                --si no existe entonces insertamos ese cliente 
									    --en la tabla clientes
     INSERT INTO clientes
     (dni,nombre,apellido,telefono,TipoUsuario,clienteActivo)
     SELECT dnip,nombreCliente,apellidoCliente,telefonocCliente,0,1
     FROM INSERTED
end;
END
go




--******  Trigger          **********
--******  Asignar Presupuesto**********
--cuando se carga un nuevo evento el estado de presupuesto
--pasa a ser asignado a ese nuevo evento

create trigger asignarPresup
  on EventosCasuales
  for insert
 as 
   BEGIN
SET NOCOUNT ON;
Declare @codPresupuesto int;  --Declaramos la variable codPresupuesto
Select @codPresupuesto = (Select codPresupuesto From Inserted ); --Obtenemos el codigo de presupuesto que se selecciono al insertar

  begin                                
     UPDATE Presupuesto SET
     asignado=1
     WHERE codPresupuesto=@codPresupuesto
end;
END
go
