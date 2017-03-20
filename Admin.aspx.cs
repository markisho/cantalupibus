using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.ControlVolver.Visible = false; //oculto linkbutton "volver" que se encuentra en la masterpage (innecesario en login y menu principal)



        HttpCookie cookie = Request.Cookies["SesionAdmin"];

        if (cookie == null) // si no existe la cookie de admin
        {
            Response.Redirect("Admin/Login.aspx"); //redirije a menu login
        }

        else // si efectivamente eiste una sesion
            Master.ControlLabelSesion.Text = cookie.Value; // seteo el label de la masterpage con el nombre de usuario que esta logueado (value de la cookie)
    }

    protected void lintkButtonSalir_Click(object sender, EventArgs e)
    {
        //ELIMINAR SESION A TRAVÉS DE COOKiE
        HttpCookie cookie = Response.Cookies["SesionAdmin"];
        cookie.Expires = DateTime.Now.AddDays(-1d);

        Response.Redirect("Admin/Login.aspx"); //redirije a menu de administracion                                                                    
    }
    protected void btnCerrarSesion_Click(object sender, EventArgs e)
    {
        //ELIMINAR SESION A TRAVÉS DE COOKiE
        HttpCookie cookie = Response.Cookies["SesionAdmin"];
        cookie.Expires = DateTime.Now.AddDays(-1d);

        Response.Redirect("Admin/Login.aspx"); //redirije a menu de administracion
    }
}