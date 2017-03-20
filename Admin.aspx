<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>
<%@ MasterType VirtualPath="~/Admin/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="Opciones">
        <a href="Admin/Clientes.aspx">Clientes</a><br />
        <a href="Admin/Presupuestos.aspx">Presupuestos</a><br />
        <a href="Admin/EventosCasuales.aspx">Eventos casuales</a><br />
        <a href="Admin/ViajesDiarios.aspx">Viajes diarios</a><br />
        <a href="Admin/MiniBuses.aspx">Mini-buses</a><br />
        <a href="Admin/Empleados.aspx">Lista de Choferes</a><br />
        <a href="Admin/Informes.aspx">Informes</a><br />
        <br />
        <asp:Button ID="btnCerrarSesion" runat="server" Text="Cerrar sesión" OnClick="btnCerrarSesion_Click" Width="100px" />
    </div>

</asp:Content>
