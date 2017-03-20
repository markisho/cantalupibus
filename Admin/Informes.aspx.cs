using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Informes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie cookie = Request.Cookies["SesionAdmin"]; //defino una variable cookie de la sesion admin para buscarla

        if (cookie == null) // si no existe la cookie de admin
        {
            Response.Redirect("Login.aspx"); //redirijo a menu login
        }

        SqlCommand comando = new SqlCommand();

        lblRecTotalEventos.Text +=  Conexion.EjecutarConsultaScalar("traerRecTotalEventosCasuales", comando);
        lblCantViajesDiarios.Text += "<br/>" + Conexion.EjecutarConsultaScalar("traerCantViajesDiarios", comando);
        lblCantEventos.Text += "<br/>" + Conexion.EjecutarConsultaScalar("traerCantEventosCasuales", comando);
    }
}