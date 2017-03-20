using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Descripción breve de Socios
/// </summary>
public class Clientes
{

    private
    int dni;
    string nombreCliente;
    string apellidoCliente;
    DateTime fechaAlta;
    string telefonoCliente;
    string calleCliente;
    int nroCalle;
    string piCliente;     //piso 
    string depto;
    string localidadCliente;
    string codPostal;
    string correoElectronico;
    bool tipoCliente;   // si es cliente socio o cliente eventual
    DateTime fechaNacimiento;

    public int dni_cliente   // the Name property
    {
        get
        {
            return dni ;
        }
        set
        {
            dni  = value;
        }
    }

    public string  nombre_Cliente   // the Name property
    {
        get
        {
            return nombreCliente ;
        }
        set
        {
            nombreCliente  = value;
        }
    }

    public string apellido_Cliente   // the Name property
    {
        get
        {
            return apellidoCliente ;
        }
        set
        {
            apellidoCliente  = value;
        }
    }

    public DateTime  fecha_Alta   // the Name property
    {
        get
        {
            return fechaAlta ;
        }
        set
        {
            fechaAlta  = value;
        }
    }
    public DateTime fecha_Nacimiento   // the Name property
    {
        get
        {
            return fechaNacimiento ;
        }
        set
        {
            fechaNacimiento  = value;
        }
    }

    public string telefono_Cliente   // the Name property
    {
        get
        {
            return telefonoCliente;
        }
        set
        {
            telefonoCliente = value;
        }
    }
    public string calle_Cliente   // the Name property
    {
        get
        {
            return calleCliente;
        }
        set
        {
            calleCliente = value;
        }
    }
    public int nro_calle  // the Name property
    {
        get
        {
            return nroCalle  ;
        }
        set
        {
            nroCalle  = value;
        }
    }
    public string piso_Cliente  // the Name property
    {
        get
        {
            return piCliente  ;
        }
        set
        {
            piCliente  = value;
        }
    }
    public string depto_Socio   // the Name property
    {
        get
        {
            return depto ;
        }
        set
        {
            depto  = value;
        }
    }
    public string localidad_Cliente   // the Name property
    {
        get
        {
            return localidadCliente ;
        }
        set
        {
            localidadCliente  = value;
        }
    }
    public string codigo_Postal   // the Name property
    {
        get
        {
            return codPostal ;
        }
        set
        {
            codPostal  = value;
        }
    }
    public string correo_Electronico   // the Name property
    {
        get
        {
            return correoElectronico  ;
        }
        set
        {
            correoElectronico  = value;
        }
    }

    public bool  tipo_Cliente   // the Name property
    {
        get
        {
            return tipoCliente ;
        }
        set
        {
            tipoCliente  = value;
        }
    }
   
    public Clientes()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

     ~Clientes()  // destructor
    {
        ((IDisposable)this).Dispose();

    }




}
