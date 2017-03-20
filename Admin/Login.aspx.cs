using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Master.ControlVolver.Visible = false; //oculto linkbutton "volver" que se encuentra en la masterpage (innecesario en login y menu principal)


       HttpCookie cookie = Request.Cookies["SesionAdmin"];

       if(cookie != null) // si existe la cookie de admin
       {
           Response.Redirect("../Admin.aspx"); //redirije a menu de administracion
       }
    }


    protected void btnEntrar_Click(object sender, EventArgs e)
    {
        //VALIDACION SI EMPLEADO EXISTE Y TIENE PRIVILIEGIOS
        if (Empleados.verificarEmpleado(Convert.ToInt32(txtLegajo.Text), txtPass.Text) == 0)
        {
            lblUserInvalido.Text = "ERROR. El usuario no existe o no tiene los privilegios necesarios.";
            return;
        }


        //CREAR COOKIE DE 8 HORAS SOLO PARA SESION EN DIRECTORIO DE ADMIN
        HttpCookie cookie = Response.Cookies["SesionAdmin"];
        cookie.Value = Empleados.conseguirNombre(Convert.ToInt32(txtLegajo.Text)); //pongo el nombre del empleado en el value de la cookie (se consigue con una consulta desde la clase Empleados que toma el legajo, lo verifica en la BD y me devuelve el string)
        cookie.Path = "/"; //path es la ruta donde solo va ser funcional la cookie
        cookie.Expires = DateTime.Now.AddHours(8);

        Response.Redirect("../Admin.aspx"); //redirije a menu de administracion
    }

}