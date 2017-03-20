<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vision.aspx.cs" Inherits="Nosotros_Vision" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table id="Vision">
        <tr>
            <td rowspan="3" style="width: 230px; margin-right: 100px;" class="modal-sm">
                <asp:Image ID="ImagenFlecha" runat="server" ImageUrl="~/Nosotros/Vision/Flechita.jpg" Width="230px" />
            </td>
        </tr>

        <tr>
            <td style="width: 500px; height: 15px; text-decoration: underline; font-size: x-large;" class="text-right"><strong>Visión de la empresa</strong></td>
        </tr>

        <tr>
            <td style="width: 500px; font-size: large;" class="text-right">Proyectar una imagen fuerte y positiva a los clientes y al público en general por lo que somos y hacemos, logrando ser líderes del mejor servicio de transporte de la zona.</td>
        </tr>
    </table>

</asp:Content>

