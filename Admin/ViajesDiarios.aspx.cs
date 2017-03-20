using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_ViajesDiarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["SesionAdmin"]; //defino una variable cookie de la sesion admin para buscarla

        if (cookie == null) // si no existe la cookie de admin
        {
            Response.Redirect("Login.aspx"); //redirijo a menu login
        }

        if (!IsPostBack)
            Conexion.LlenarGrilla("EXEC traerViajesDiarios", gvViajesDiarios); //lleno la grilla con el datatable
    }


    protected void gvViajesDiarios_RowEditing(object sender, GridViewEditEventArgs e)
    {
        txtBuscar.Text = ""; //quito cualquier filtro de la caja de busqueda
        gvViajesDiarios.EditIndex = e.NewEditIndex; //activar edicion
        Conexion.LlenarGrilla("EXEC traerViajesDiarios", gvViajesDiarios); //actualizo la grilla
    }


    protected void gvViajesDiarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvViajesDiarios.EditIndex = -1; //sacar edicion
        Conexion.LlenarGrilla("EXEC traerViajesDiarios", gvViajesDiarios); //actualizo la grilla
    }
    protected void gvViajesDiarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //defino los valores de los campos en variables textbox del footer para luego pasarlos como parametros
        DropDownList origen = (DropDownList)gvViajesDiarios.Rows[e.RowIndex].FindControl("ddlOrigen");
        DropDownList destino = (DropDownList)gvViajesDiarios.Rows[e.RowIndex].FindControl("ddlDestino");
        DropDownList idminibus = (DropDownList)gvViajesDiarios.Rows[e.RowIndex].FindControl("ddlMiniBus");
        DropDownList legajochofer = (DropDownList)gvViajesDiarios.Rows[e.RowIndex].FindControl("ddlChofer");
        TextBox cantsocios = (TextBox)gvViajesDiarios.Rows[e.RowIndex].FindControl("txtCantSocios");
        TextBox observaciones = (TextBox)gvViajesDiarios.Rows[e.RowIndex].FindControl("txtObservaciones");

        SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros

        comando.Parameters.AddWithValue("@CodViaje", gvViajesDiarios.DataKeys[e.RowIndex].Value); //agrego al comando el parametro clave dni que esta como datakey en la gridview
        comando.Parameters.AddWithValue("@origen", origen.SelectedItem.Value);
        comando.Parameters.AddWithValue("@destino", destino.SelectedItem.Value);
        comando.Parameters.AddWithValue("@IdMiniBusAsignado", idminibus.SelectedItem.Value);
        comando.Parameters.AddWithValue("@LegajoChofer", legajochofer.SelectedItem.Value);
        comando.Parameters.AddWithValue("@CantPasajerosDiarios", cantsocios.Text);
        comando.Parameters.AddWithValue("@Observaciones", observaciones.Text);

        Conexion.EjecutarConsulta("modificarViajeDiario", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

        gvViajesDiarios.EditIndex = -1; //sacar modo edicion
        Conexion.LlenarGrilla("EXEC traerViajesDiarios", gvViajesDiarios); //actualizo la grilla con los nuevos datos
 
    }

    protected void gvViajesDiarios_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AgregarNuevo")) //si se cliquea en imagebutton para agregar nuevo registro...
        {
            //defino los valores de los campos en variables textbox del footer para luego pasarlos como parametros
            TextBox fecha = (TextBox)gvViajesDiarios.FooterRow.FindControl("txtNuevaFecha");
            DropDownList turno = (DropDownList)gvViajesDiarios.FooterRow.FindControl("ddlNuevoTurno");
            DropDownList origen = (DropDownList)gvViajesDiarios.FooterRow.FindControl("ddlNuevoOrigen");
            DropDownList destino = (DropDownList)gvViajesDiarios.FooterRow.FindControl("ddlNuevoDestino");
            DropDownList idminibus = (DropDownList)gvViajesDiarios.FooterRow.FindControl("ddlNuevoMiniBusAsignado");
            DropDownList legajochofer = (DropDownList)gvViajesDiarios.FooterRow.FindControl("ddlNuevoChofer");
            TextBox cantsocios = (TextBox)gvViajesDiarios.FooterRow.FindControl("txtNuevaCantSocios");
            TextBox observaciones = (TextBox)gvViajesDiarios.FooterRow.FindControl("txtNuevasObservaciones");

            SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros

            comando.Parameters.AddWithValue("@fechaViajeDiario", Convert.ToDateTime(fecha.Text));
            comando.Parameters.AddWithValue("@turno", turno.SelectedItem.Value);
            comando.Parameters.AddWithValue("@origen", origen.SelectedItem.Value);
            comando.Parameters.AddWithValue("@destino", destino.SelectedItem.Value);
            comando.Parameters.AddWithValue("@IdMiniBusAsignado", idminibus.SelectedItem.Value);
            comando.Parameters.AddWithValue("@LegajoChofer", legajochofer.SelectedItem.Value);
            comando.Parameters.AddWithValue("@CantPasajerosDiarios", cantsocios.Text);
            comando.Parameters.AddWithValue("@Observaciones", observaciones.Text);

            Conexion.EjecutarConsulta("altaViajesDiarios", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

            gvViajesDiarios.EditIndex = -1; //sacar modo edicion
            Conexion.LlenarGrilla("EXEC traerViajesDiarios", gvViajesDiarios); //actualizo la grilla con los nuevos datos

        }
    }
}