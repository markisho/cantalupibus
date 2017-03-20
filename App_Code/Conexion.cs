using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Descripción breve de Conexion
/// </summary>
public class Conexion
{
    static string rutaSQL = "Data Source=localhost\\sqlexpress;Initial Catalog=cantalupibus2015;Integrated Security=True";
    static SqlConnection con = new SqlConnection(rutaSQL);

    public static void Abrir()
    {
        con.Close();
        con.Open();
    }

    public static void Cerrar()
    {
        con.Close();
    }


    static public void LlenarGrilla(string consulta, GridView grilla)
    {
        DataTable dt = new DataTable();
        SqlDataAdapter adaptador = new SqlDataAdapter(consulta, con);
        Abrir();
        adaptador.Fill(dt);
        Cerrar();
        grilla.DataSource = dt;
        grilla.DataBind();
    }

    static public void LlenarLista(string consulta, ListView lista)
    {
        Abrir();
        SqlCommand comando = new SqlCommand(consulta, con);
        SqlDataReader datos = comando.ExecuteReader();
        lista.DataSource = datos;
        lista.DataBind();
        Cerrar();
    }

    public static void EjecutarConsulta(string nombreProcedimiento, SqlCommand comando)
    {
        Abrir();
        comando.Connection = con;
        comando.CommandType = CommandType.StoredProcedure;
        comando.CommandText = nombreProcedimiento;
        comando.ExecuteNonQuery();
        Cerrar();
    }


    public static object EjecutarConsultaScalar(string nombreProcedimiento, SqlCommand comando)
    {
        object resultado = 0;

        try
        {
            Abrir();
            comando.Connection = con;
            comando.CommandType = CommandType.StoredProcedure;
            comando.CommandText = nombreProcedimiento;
            resultado = (object)comando.ExecuteScalar();
            Cerrar();
            return resultado;
        }

        catch
        {
            Cerrar();
            return 0;
        }
    }

	public Conexion()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}