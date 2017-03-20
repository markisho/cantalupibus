using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Presupuesto : System.Web.UI.Page
{
    //********* metodo page load  ******************
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //******* metodo click del boton enviar  *******
    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        //validacion de destinos diferentes
        if (ddlLugarOrigen.SelectedItem.Text == ddlLugarDestino.SelectedItem.Text)
        {
            MessageBox.Show("Origen y Destino iguales, elija distintos valores", this.Page, this);
            return;
        }

        // ejecutamos la conexion a la base de datos

        SqlCommand comando = new SqlCommand(); //variable comando para agregarle parametros
        SqlCommand comandoCod = new SqlCommand(); //variable comando para codPresupuesto
        string codPresupuestoGenerado;

        comando.Parameters.AddWithValue("@dniP", txtDNI.Text);
        comando.Parameters.AddWithValue("@NombreCliente", txtNombre.Text);
        comando.Parameters.AddWithValue("@ApellidoCliente", txtApellido.Text);
        comando.Parameters.AddWithValue("@emailCliente", txtEmail.Text);
        comando.Parameters.AddWithValue("@TelefonoCliente", txtTelefono.Text);
        comando.Parameters.AddWithValue("@lugarOrigen", ddlLugarOrigen.Text);
        comando.Parameters.AddWithValue("@LugarDestino", ddlLugarDestino.Text);
        comando.Parameters.AddWithValue("@Comentarios", txtComentario.Text);

        Conexion.EjecutarConsulta("altaPresupuesto", comando); //guardo el presupuesto generado
        codPresupuestoGenerado = Conexion.EjecutarConsultaScalar("traerUltimoCodPresupuesto", comandoCod).ToString(); //muestro el cod de presupuesto

        // mostramos en una etiqueta el codPresupuesto y nro. de contacto   
        lblConfirmacion.Text = "Su código de Presupuesto es:\n" +
                codPresupuestoGenerado +
                ". GUÁRDELO y llámenos por teléfono al 4740-5040\n" +
            "para confirmar y concretar el pago.";

        MessageBox.Show(lblConfirmacion.Text, this.Page, this);
    }

}