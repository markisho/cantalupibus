using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Descripción breve de Empleados
/// </summary>
public class Empleados
{
    private
    int legajo;
    string nombre;
    string apellido;
    int codSector;
    bool empleadoActivo;
    

    public Empleados()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public int  Legajo_Empleado   // the Name property
    {
        get
        {
            return legajo ;
        }
        set
        {
            legajo  = value;
        }
    }
    public string nombre_Empleado    // the Name property
    {
        get
        {
            return nombre;
        }
        set
        {
            nombre = value;
        }
    }

    public string apellido_Empleado    // the Name property
    {
        get
        {
            return apellido ;
        }
        set
        {
            apellido  = value;
        }
    }

    public int codigo_Sector   // the Name property
    {
        get
        {
            return codSector ;
        }
        set
        {
            codSector  = value;
        }
    }

    public bool  Empleado_Activo   // the Name property
    {
        get
        {
            return empleadoActivo ;
        }
        set
        {
            empleadoActivo  = value;
        }
    }


    public static int verificarEmpleado(int legajo, string clave)
    {
        SqlCommand comando = new SqlCommand();

        comando.Parameters.Add("@legajo", SqlDbType.Int).Value = legajo;
        comando.Parameters.Add("@clave", SqlDbType.VarChar, 5).Value = clave;

        return Convert.ToInt32(Conexion.EjecutarConsultaScalar("validarEmpleado", comando));
    }

    public static string conseguirNombre(int legajo)
    {
        SqlCommand comando = new SqlCommand();
        comando.Parameters.Add("@legajo", SqlDbType.Int).Value = legajo;

        return Conexion.EjecutarConsultaScalar("traerNombreEmpleado", comando).ToString();
    }

    
        ~Empleados()  // destructor
        {
            ((IDisposable)this).Dispose();// cleanup statements...
        }

}