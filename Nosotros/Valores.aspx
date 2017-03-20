<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Valores.aspx.cs" Inherits="Nosotros_Valores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table id="Valores">
        <tr>
            <td rowspan="3" style="width: 230px; margin-right: 100px;" class="modal-sm">
                <asp:Image ID="ImagenColaboracion" runat="server" ImageUrl="~/Nosotros/Valores/Colaboracion.png" Width="230px" />
            </td>
        </tr>

        <tr>
            <td style="width: 500px; height: 15px; text-decoration: underline; font-size: x-large;" class="text-left"><strong>Valores de la empresa</strong></td>
        </tr>

        <tr>
            <td style="width: 500px; font-size: large;" class="text-left">
                • Respeto<br />
                • Honestidad<br />
                • Puntualidad<br />
                • Autocrítica<br />
                • Seguridad<br />
                • Responsabilidad<br />
                • Lealtad<br />
                • Esfuerzo<br />
            </td>
        </tr>
    </table>

</asp:Content>

