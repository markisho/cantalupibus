<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Informes.aspx.cs" Inherits="Informes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="Titulos">INFORMES</div>

    <br />

    <div id="labelInforme">

        <asp:Label ID="lblRecTotalEventos" runat="server">Recaudación total por Eventos casuales:
            <br />$</asp:Label>
        <br />
        <br />
        <asp:Label ID="lblCantViajesDiarios" runat="server">Cantidad de Viajes Diarios realizados hasta la fecha: </asp:Label>
        <br />
        <br />
        <asp:Label ID="lblCantEventos" runat="server">Cantidad de Eventos Casuales realizados hasta la fecha: </asp:Label>

    </div>

</asp:Content>

