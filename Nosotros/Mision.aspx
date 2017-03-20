<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Mision.aspx.cs" Inherits="Nosotros_Mision" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table id="Mision">
        <tr>
            <td rowspan="3" style="width: 300px; margin-right: 100px;" class="modal-sm">
                <asp:Image ID="ImagenRompecabezas" runat="server" ImageUrl="~/Nosotros/Mision/Rompecabezas.png" Width="300px" />
            </td>
        </tr>

        <tr>
            <td style="width: 500px; height: 40px; text-decoration: underline; font-size: x-large;" class="text-right"><strong>Misión de la empresa</strong></td>
        </tr>

        <tr>
            <td style="width: 500px; height: 40px; font-size: large;" class="text-right">Brindar un servicio eficiente de viajes grupales en "chárter" a particulares, explotando al máximo potencial las habilidades del personal en un ambiente amable y de crecimiento para que cada cliente se sienta cómodo, seguro y confiable al menor costo posible.</td>
        </tr>
    </table>

</asp:Content>

