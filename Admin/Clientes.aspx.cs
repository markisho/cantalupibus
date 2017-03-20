using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Clientes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["SesionAdmin"]; //defino una variable cookie de la sesion admin para buscarla

        if (cookie == null) // si no existe la cookie de admin
        {
            Response.Redirect("Login.aspx"); //redirijo a menu login
        }

        if(!IsPostBack)
            Conexion.LlenarGrilla("EXEC traerClientes", gvClientes); //lleno la grilla con el datatable por 1ra vez
    }


    //AL PONER REGISTRO (FILA) EN MODO EDICION
    protected void gvClientes_RowEditing(object sender, GridViewEditEventArgs e)
    {
        txtBuscar.Text = ""; //quito cualquier filtro de la caja de busqueda
        gvClientes.EditIndex = e.NewEditIndex; //activar edicion
        Conexion.LlenarGrilla("EXEC traerClientes", gvClientes); //actualizo la grilla
    }


    //AL CANCELAR MODO EDICION DE REGISTRO (FILA)
    protected void gvClientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvClientes.EditIndex = -1; //sacar edicion
        Conexion.LlenarGrilla("EXEC traerClientes", gvClientes); //actualizo la grilla
    }


    //AL ACTUALIZAR LA EDICIÓN DEL REGISTRO (FILA)
    protected void gvClientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //defino los valores de los campos en variables textbox para luego pasarlos como parametros
        TextBox nombre = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtNombre");
        TextBox apellido = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtApellido");
        TextBox fechaNac = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtFechaNacimiento");
        TextBox fechaAlta = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtFechaAlta");
        TextBox telefono = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtTelefono");
        TextBox calle = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtCalle");
        TextBox numero = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtNro");
        TextBox piso = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtPiso");
        TextBox departamento = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtDepto");
        TextBox localidad = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtLocalidad");
        TextBox codigoPostal = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtCP");
        TextBox correoElectronico = (TextBox)gvClientes.Rows[e.RowIndex].FindControl("txtEmail");
        CheckBox tipoUsuario = (CheckBox)gvClientes.Rows[e.RowIndex].FindControl("chkTipoCliente");

        SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros

        comando.Parameters.AddWithValue("@Dni", gvClientes.DataKeys[e.RowIndex].Value);
        comando.Parameters.AddWithValue("@Nombre", nombre.Text);
        comando.Parameters.AddWithValue("@Apellido", apellido.Text);
        comando.Parameters.AddWithValue("@FechaNacimiento", Convert.ToDateTime(fechaNac.Text));
        comando.Parameters.AddWithValue("@FechAlta", Convert.ToDateTime(fechaAlta.Text));
        comando.Parameters.AddWithValue("@Telefono", telefono.Text);
        comando.Parameters.AddWithValue("@calle", calle.Text);
        comando.Parameters.AddWithValue("@numero", numero.Text);
        comando.Parameters.AddWithValue("@piso", piso.Text);
        comando.Parameters.AddWithValue("@depto", departamento.Text);
        comando.Parameters.AddWithValue("@localidad", localidad.Text);
        comando.Parameters.AddWithValue("@codigoPostal", codigoPostal.Text);
        comando.Parameters.AddWithValue("@CorreoElectronico", correoElectronico.Text);
        comando.Parameters.AddWithValue("@tipoUsurio", tipoUsuario.Checked);

        Conexion.EjecutarConsulta("ModificarCliente", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

        gvClientes.EditIndex = -1; //sacar modo edicion
        Conexion.LlenarGrilla("EXEC traerClientes", gvClientes); //actualizo la grilla con los nuevos datos
    }


    //ELIMINAR REGISTRO (FILA) DIRECTAMENTE DE LA BASE DE DATOS
    protected void gvClientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        txtBuscar.Text = ""; //quito cualquier filtro de la caja de busqueda

        SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros
        comando.Parameters.AddWithValue("@Dni", gvClientes.DataKeys[e.RowIndex].Value); //agrego al comando el parametro clave dni que esta como datakey en la gridview
        Conexion.EjecutarConsulta("eliminarCliente", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

        Conexion.LlenarGrilla("EXEC traerClientes", gvClientes); //actualizo la grilla con los nuevos datos
    }


    //AL DETECTAR NUEVO ROWCOMMAND
    protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName.Equals("AgregarNuevo")) //si se cliquea en imagebutton para agregar nuevo registro...
        {

            //defino los valores de los campos en variables textbox del footer para luego pasarlos como parametros
            TextBox dni = (TextBox)gvClientes.FooterRow.FindControl("txtNuevoDNI");
            TextBox nombre = (TextBox)gvClientes.FooterRow.FindControl("txtNuevoNombre");
            TextBox apellido = (TextBox)gvClientes.FooterRow.FindControl("txtNuevoApellido");
            TextBox fechaNac = (TextBox)gvClientes.FooterRow.FindControl("txtNuevaFechaNacimiento");
            Label fechaAlta = (Label)gvClientes.FooterRow.FindControl("lblNuevaFechaAlta");
            TextBox telefono = (TextBox)gvClientes.FooterRow.FindControl("txtNuevoTelefono");
            TextBox calle = (TextBox)gvClientes.FooterRow.FindControl("txtNuevaCalle");
            TextBox numero = (TextBox)gvClientes.FooterRow.FindControl("txtNuevoNro");
            TextBox piso = (TextBox)gvClientes.FooterRow.FindControl("txtNuevoPiso");
            TextBox departamento = (TextBox)gvClientes.FooterRow.FindControl("txtNuevoDepto");
            TextBox localidad = (TextBox)gvClientes.FooterRow.FindControl("txtNuevaLocalidad");
            TextBox codigoPostal = (TextBox)gvClientes.FooterRow.FindControl("txtNuevoCP");
            TextBox correoElectronico = (TextBox)gvClientes.FooterRow.FindControl("txtNuevoEmail");
            bool tipoUsuario=true; //por logica el nuevo cliente de alta es siempre socio

            SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros

            comando.Parameters.AddWithValue("@Dni", dni.Text);
            comando.Parameters.AddWithValue("@Nombre", nombre.Text);
            comando.Parameters.AddWithValue("@Apellido", apellido.Text);
            comando.Parameters.AddWithValue("@FechaNacimiento", Convert.ToDateTime(fechaNac.Text));
            comando.Parameters.AddWithValue("@FechAlta", Convert.ToDateTime(fechaAlta.Text));
            comando.Parameters.AddWithValue("@Telefono", telefono.Text);
            comando.Parameters.AddWithValue("@calle", calle.Text);
            comando.Parameters.AddWithValue("@numero", numero.Text);
            comando.Parameters.AddWithValue("@piso", piso.Text);
            comando.Parameters.AddWithValue("@depto", departamento.Text);
            comando.Parameters.AddWithValue("@localidad", localidad.Text);
            comando.Parameters.AddWithValue("@codigoPostal", codigoPostal.Text);
            comando.Parameters.AddWithValue("@CorreoElectronico", correoElectronico.Text);
            comando.Parameters.AddWithValue("@tipoUsurio", tipoUsuario);

            Conexion.EjecutarConsulta("AltaCliente", comando); //ejecuto el procedimiento almacenado con el comando y sus parametros

            Conexion.LlenarGrilla("EXEC traerClientes", gvClientes); //actualizo la grilla con los nuevos datos
        }
    }


}