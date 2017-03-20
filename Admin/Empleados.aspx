<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Empleados.aspx.cs" Inherits="Admin_Empleados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div id="Formularios">
        <div id="Titulos">CHOFERES</div>

        <br />

        <asp:ScriptManager ID="ScriptManager" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>

        <div id="Grillas">
            <asp:GridView ID="gvEmpleados" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" runat="server" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" style="margin-right: 0px" DataKeyNames="Legajo" AutoGenerateColumns="False" DataSourceID="SqlDataSourceChoferes">

                <Columns>
                    <asp:BoundField DataField="Legajo" HeaderText="Legajo" InsertVisible="False" ReadOnly="True" SortExpression="Legajo" />
                    <asp:BoundField DataField="Chofer" HeaderText="Chofer" ReadOnly="True" SortExpression="Chofer" />
                </Columns>

            <PagerStyle CssClass="pgr"></PagerStyle>
            <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>



            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceChoferes" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT Legajo, Nombre + ' ' + Apellido AS 'Chofer'
FROM Empleados
WHERE CodSectorEmpleado=2 AND EmpleadoActivo=1"></asp:SqlDataSource>
        </div>
    </div>


<br />
</asp:Content>

