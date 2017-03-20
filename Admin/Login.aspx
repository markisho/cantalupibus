<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>
<%@ MasterType VirtualPath="~/Admin/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

            <table id="CajasLogin">
            <tr>
                <td style="font-weight: bold; text-align: right;">Legajo:&nbsp;&nbsp;</td>
                <td>
                    <asp:TextBox ID="txtLegajo" runat="server"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo" ErrorMessage="!" ForeColor="#CC0000" style="font-weight: 700; font-size: x-large; font-style: italic"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="font-weight: bold; text-align: right;"" class="text-right">Contraseña:&nbsp;&nbsp;</td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPass" ErrorMessage="!" ForeColor="#CC0000" style="font-weight: 700; font-size: x-large; font-style: italic"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>

        <br />
        <br />

        <div id="BotonEntrar"><asp:Button ID="btnEntrar" CssClass="BotonEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click" Width="100px"/></div>

        <br />
        <br />

        <div id="LabelError"><asp:Label ID="lblUserInvalido" runat="server" ForeColor="Red"></asp:Label></div>


            <br />
            <br />
        
        <div id="SalirAdmin"><asp:ImageButton ID="ibSalir" runat="server" ImageUrl="~/Admin/Login/Salir.png" Width="64px" PostBackUrl="~/Inicio.aspx" CausesValidation="False"/></div>

</asp:Content>

