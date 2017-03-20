using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_EventosCasuales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["SesionAdmin"]; //defino una variable cookie de la sesion admin para buscarla

        if (cookie == null) // si no existe la cookie de admin
        {
            Response.Redirect("Login.aspx"); //redirijo a menu login
        }

        if (!IsPostBack)
            Conexion.LlenarGrilla("EXEC traerEventosCasuales", gvEventosCasuales); //lleno la grilla con el datatable

    }


    //AL PONER REGISTRO (FILA) EN MODO EDICION
    protected void gvEventosCasuales_RowEditing(object sender, GridViewEditEventArgs e)
    {
        txtBuscar.Text = ""; //quito cualquier filtro de la caja de busqueda
        gvEventosCasuales.EditIndex = e.NewEditIndex; //activar edicion
        Conexion.LlenarGrilla("EXEC traerEventosCasuales", gvEventosCasuales); //actualizo la grilla
    }


    //AL CANCELAR MODO EDICION DE REGISTRO (FILA)
    protected void gvEventosCasuales_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvEventosCasuales.EditIndex = -1; //sacar edicion
        Conexion.LlenarGrilla("EXEC traerEventosCasuales", gvEventosCasuales); //actualizo la grilla
    }

    protected void gvEventosCasuales_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //defino los valores de los campos en variables textbox del footer para luego pasarlos como parametros
        Label codPresup = (Label)gvEventosCasuales.Rows[e.RowIndex].FindControl("lblCodPresupuesto");
        DropDownList minibus = (DropDownList)gvEventosCasuales.Rows[e.RowIndex].FindControl("ddlMiniBus");
        DropDownList chofer = (DropDownList)gvEventosCasuales.Rows[e.RowIndex].FindControl("ddlChofer");
        TextBox cantpasajeros = (TextBox)gvEventosCasuales.Rows[e.RowIndex].FindControl("txtCantPasajeros");
        TextBox fechapedido = (TextBox)gvEventosCasuales.Rows[e.RowIndex].FindControl("txtFechaPedido");
        TextBox fechaevento = (TextBox)gvEventosCasuales.Rows[e.RowIndex].FindControl("txtFechaEvento");
        TextBox horaviaje = (TextBox)gvEventosCasuales.Rows[e.RowIndex].FindControl("txtHora");
        TextBox importe = (TextBox)gvEventosCasuales.Rows[e.RowIndex].FindControl("txtImporte");

        SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros

        comando.Parameters.AddWithValue("@CodEvento", gvEventosCasuales.DataKeys[e.RowIndex].Value); //agrego al comando el parametro clave dni que esta como datakey en la gridview
        comando.Parameters.AddWithValue("@IdminiBusEvento", minibus.SelectedItem.Value);
        comando.Parameters.AddWithValue("@LegajoChoferEvento", chofer.SelectedItem.Value);
        comando.Parameters.AddWithValue("@codPresupuesto", codPresup.Text);
        comando.Parameters.AddWithValue("@cantPasajeros", cantpasajeros.Text);
        comando.Parameters.AddWithValue("@Importe", importe.Text);
        comando.Parameters.AddWithValue("@FechaPedido", Convert.ToDateTime(fechapedido.Text));
        comando.Parameters.AddWithValue("@FechaViaje", Convert.ToDateTime(fechaevento.Text));
        comando.Parameters.AddWithValue("@HoraViaje", horaviaje.Text);

        Conexion.EjecutarConsulta("modificarEventosCasuales", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

        gvEventosCasuales.EditIndex = -1; //sacar modo edicion
        Conexion.LlenarGrilla("EXEC traerEventosCasuales", gvEventosCasuales); //actualizo la grilla con los nuevos datos
 
}

    protected void gvEventosCasuales_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        txtBuscar.Text = ""; //quito cualquier filtro de la caja de busqueda

        SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros
        comando.Parameters.AddWithValue("@CodEvento", gvEventosCasuales.DataKeys[e.RowIndex].Value); //agrego al comando el parametro clave dni que esta como datakey en la gridview
        Conexion.EjecutarConsulta("cancelarEventoCasual", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

        Conexion.LlenarGrilla("EXEC traerEventosCasuales", gvEventosCasuales); //actualizo la grilla con los nuevos datos
    }

    protected void gvEventosCasuales_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AgregarNuevo")) //si se cliquea en imagebutton para agregar nuevo registro...
        {
            //defino los valores de los campos en variables textbox del footer para luego pasarlos como parametros
            DropDownList codPresup = (DropDownList)gvEventosCasuales.FooterRow.FindControl("ddlNuevoCodPresupuesto");
            DropDownList minibus = (DropDownList)gvEventosCasuales.FooterRow.FindControl("ddlNuevoMiniBus");
            DropDownList chofer = (DropDownList)gvEventosCasuales.FooterRow.FindControl("ddlNuevoChofer");
            TextBox cantpasajeros = (TextBox)gvEventosCasuales.FooterRow.FindControl("txtNuevaCantPasajeros");
            Label fechapedido = (Label)gvEventosCasuales.FooterRow.FindControl("lblNuevaFechaPedido");
            TextBox fechaevento = (TextBox)gvEventosCasuales.FooterRow.FindControl("txtNuevaFechaEvento");
            TextBox horaviaje = (TextBox)gvEventosCasuales.FooterRow.FindControl("txtNuevaHora");
            TextBox importe = (TextBox)gvEventosCasuales.FooterRow.FindControl("txtNuevoImporte");

            SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros

            comando.Parameters.AddWithValue("@IdminiBusEvento", minibus.SelectedItem.Value);
            comando.Parameters.AddWithValue("@LegajoChoferEvento", chofer.SelectedItem.Value);
            comando.Parameters.AddWithValue("@codPresupuesto", codPresup.SelectedItem.Value);
            comando.Parameters.AddWithValue("@cantPasajeros", cantpasajeros.Text);
            comando.Parameters.AddWithValue("@Importe", importe.Text);
            comando.Parameters.AddWithValue("@FechaPedido", Convert.ToDateTime(fechapedido.Text));
            comando.Parameters.AddWithValue("@FechaViaje", Convert.ToDateTime(fechaevento.Text));
            comando.Parameters.AddWithValue("@HoraViaje", horaviaje.Text);

            Conexion.EjecutarConsulta("altaEventosCasuales", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

            Conexion.LlenarGrilla("EXEC traerEventosCasuales", gvEventosCasuales); //actualizo la grilla con los nuevos datos
        }

    }

}