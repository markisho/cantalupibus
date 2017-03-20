using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Presupuestos : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["SesionAdmin"]; //defino una variable cookie de la sesion admin para buscarla

        if (cookie == null) // si no existe la cookie de admin
        {
            Response.Redirect("Login.aspx"); //redirijo a menu login
        }

        if(!IsPostBack)
            Conexion.LlenarGrilla("EXEC traerPresupuesto", gvPresupuestos); //lleno la grilla con el datatable

    }


    //AL PONER REGISTRO (FILA) EN MODO EDICION
    protected void gvPresupuestos_RowEditing(object sender, GridViewEditEventArgs e)
    {
        txtBuscar.Text = ""; //quito cualquier filtro de la caja de busqueda
        gvPresupuestos.EditIndex = e.NewEditIndex; //activar edicion
        Conexion.LlenarGrilla("EXEC traerPresupuesto", gvPresupuestos); //actualizo la grilla
    }


    //AL CANCELAR MODO EDICION DE REGISTRO (FILA)
    protected void gvPresupuestos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvPresupuestos.EditIndex = -1; //sacar edicion
        Conexion.LlenarGrilla("EXEC traerPresupuesto", gvPresupuestos); //actualizo la grilla
    }


    //AL ACTUALIZAR LA EDICIÓN DEL REGISTRO (FILA)
    protected void gvPresupuestos_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox dni = (TextBox)gvPresupuestos.Rows[e.RowIndex].FindControl("txtDNISolicitante");
        TextBox nombre = (TextBox)gvPresupuestos.Rows[e.RowIndex].FindControl("txtNombreSolicitante");
        TextBox apellido = (TextBox)gvPresupuestos.Rows[e.RowIndex].FindControl("txtApellidoSolicitante");
        TextBox email = (TextBox)gvPresupuestos.Rows[e.RowIndex].FindControl("txtEmailContacto");
        TextBox telefono = (TextBox)gvPresupuestos.Rows[e.RowIndex].FindControl("txtTelefono");
        DropDownList origen = (DropDownList)gvPresupuestos.Rows[e.RowIndex].FindControl("ddlOrigen");
        DropDownList destino = (DropDownList)gvPresupuestos.Rows[e.RowIndex].FindControl("ddlDestino");
        TextBox comentarios = (TextBox)gvPresupuestos.Rows[e.RowIndex].FindControl("txtComentarios");

        SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros

        comando.Parameters.AddWithValue("@codPresupuesto", gvPresupuestos.DataKeys[e.RowIndex].Value);
        comando.Parameters.AddWithValue("@dniP", dni.Text);
        comando.Parameters.AddWithValue("@NombreCliente", nombre.Text);
        comando.Parameters.AddWithValue("@ApellidoCliente", apellido.Text);
        comando.Parameters.AddWithValue("@emailCliente", email.Text);
        comando.Parameters.AddWithValue("@TelefonoCliente", telefono.Text);
        comando.Parameters.AddWithValue("@lugarOrigen", origen.Text);
        comando.Parameters.AddWithValue("@LugarDestino", destino.Text);
        comando.Parameters.AddWithValue("@Comentarios", comentarios.Text);

        Conexion.EjecutarConsulta("ModificarPresupuesto", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

        gvPresupuestos.EditIndex = -1; //sacar modo edicion
        Conexion.LlenarGrilla("EXEC traerPresupuesto", gvPresupuestos); //actualizo la grilla con los nuevos datos
    }

    protected void gvPresupuestos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AgregarNuevo")) //si se cliquea en imagebutton para agregar nuevo registro...
        {

            //defino los valores de los campos en variables textbox del footer para luego pasarlos como parametros
            TextBox dni = (TextBox)gvPresupuestos.FooterRow.FindControl("txtNuevoDNISolicitante");
            TextBox nombre = (TextBox)gvPresupuestos.FooterRow.FindControl("txtNuevoNombreSolicitante");
            TextBox apellido = (TextBox)gvPresupuestos.FooterRow.FindControl("txtNuevoApellidoSolicitante");
            TextBox email = (TextBox)gvPresupuestos.FooterRow.FindControl("txtNuevoEmailContacto");
            TextBox telefono = (TextBox)gvPresupuestos.FooterRow.FindControl("txtNuevoTelefono");
            DropDownList origen = (DropDownList)gvPresupuestos.FooterRow.FindControl("ddlNuevoOrigen");
            DropDownList destino = (DropDownList)gvPresupuestos.FooterRow.FindControl("ddlNuevoDestino");
            TextBox comentarios = (TextBox)gvPresupuestos.FooterRow.FindControl("txtNuevoComentarios");

            SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros

            comando.Parameters.AddWithValue("@dniP", dni.Text);
            comando.Parameters.AddWithValue("@NombreCliente", nombre.Text);
            comando.Parameters.AddWithValue("@ApellidoCliente", apellido.Text);
            comando.Parameters.AddWithValue("@emailCliente", email.Text);
            comando.Parameters.AddWithValue("@TelefonoCliente", telefono.Text);
            comando.Parameters.AddWithValue("@lugarOrigen", origen.Text);
            comando.Parameters.AddWithValue("@LugarDestino", destino.Text);
            comando.Parameters.AddWithValue("@Comentarios", comentarios.Text);

            Conexion.EjecutarConsulta("altaPresupuesto", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

            Conexion.LlenarGrilla("EXEC traerPresupuesto", gvPresupuestos); //actualizo la grilla con los nuevos datos
        }
    }
}