using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_MiniBuses : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["SesionAdmin"]; //defino una variable cookie de la sesion admin para buscarla

        if (cookie == null) // si no existe la cookie de admin
        {
            Response.Redirect("Login.aspx"); //redirijo a menu login
        }

        if (!IsPostBack)
            Conexion.LlenarGrilla("EXEC traerMinibuses", gvMiniBuses); //lleno la grilla con el datatable
           
    }


    protected void gvMiniBuses_RowEditing(object sender, GridViewEditEventArgs e)
    {
        txtBuscar.Text = ""; //quito cualquier filtro de la caja de busqueda
        gvMiniBuses.EditIndex = e.NewEditIndex; //activar edicion
        Conexion.LlenarGrilla("EXEC traerMinibuses", gvMiniBuses); //actualizo la grilla
    }


    protected void gvMiniBuses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvMiniBuses.EditIndex = -1; //sacar edicion
        Conexion.LlenarGrilla("EXEC traerMinibuses", gvMiniBuses); //actualizo la grilla
    }


    protected void gvMiniBuses_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //defino los valores de los campos en variables textbox para luego pasarlos como parametros
        TextBox color = (TextBox)gvMiniBuses.Rows[e.RowIndex].FindControl("txtEditaColor");
        DropDownList prestacion = (DropDownList)gvMiniBuses.Rows[e.RowIndex].FindControl("ddlPrestacion");


        SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros

        comando.Parameters.AddWithValue("@idminibus", gvMiniBuses.DataKeys[e.RowIndex].Value);
        comando.Parameters.AddWithValue("@color", color.Text);
        comando.Parameters.AddWithValue("@codprestacionbus", prestacion.SelectedItem.Value);

        Conexion.EjecutarConsulta("ModificarMinibus", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

        gvMiniBuses.EditIndex = -1; //sacar modo edicion
        Conexion.LlenarGrilla("EXEC traerMiniBuses", gvMiniBuses); //actualizo la grilla con los nuevos datos
    }
    protected void gvMiniBuses_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        txtBuscar.Text = ""; //quito cualquier filtro de la caja de busqueda

        SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros
        comando.Parameters.AddWithValue("@idminibus", gvMiniBuses.DataKeys[e.RowIndex].Value); //agrego al comando el parametro clave dni que esta como datakey en la gridview
        Conexion.EjecutarConsulta("eliminarMiniBuses", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

        Conexion.LlenarGrilla("EXEC traerMiniBuses", gvMiniBuses); //actualizo la grilla con los nuevos datos
    
    }
    protected void gvMiniBuses_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName.Equals("AgregarNuevo")) //si se cliquea en imagebutton para agregar nuevo registro...
        {

            //defino los valores de los campos en variables textbox del footer para luego pasarlos como parametros
            DropDownList modelo = (DropDownList)gvMiniBuses.FooterRow.FindControl("ddlNuevoModelo");
            TextBox patente = (TextBox)gvMiniBuses.FooterRow.FindControl("txtNuevaPatente");
            TextBox color = (TextBox)gvMiniBuses.FooterRow.FindControl("txtNuevoColor");
            DropDownList codprestacionbus = (DropDownList)gvMiniBuses.FooterRow.FindControl("ddlNuevaPrestacion");

            SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros

            comando.Parameters.AddWithValue("@idmodelobus", modelo.SelectedItem.Value);
            comando.Parameters.AddWithValue("@codprestacionbus", codprestacionbus.SelectedItem.Value);
            comando.Parameters.AddWithValue("@color", color.Text);
            comando.Parameters.AddWithValue("@patente", patente.Text);


            Conexion.EjecutarConsulta("AltaBuses", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

            Conexion.LlenarGrilla("EXEC traerMiniBuses", gvMiniBuses); //actualizo la grilla con los nuevos datos
        }

    }
}