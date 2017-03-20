<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="MiniBuses.aspx.cs" Inherits="Admin_MiniBuses" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%-- SCRIPT QUE USA FUNCION JQUERY QUICKSEARCH --%>
    <script type="text/javascript"">
        $(document).ready(function () {
            var txtBuscar = '#' + '<%=txtBuscar.ClientID %>';
            var grilla = '#' + '<%=gvMiniBuses.ClientID %>';
            $(txtBuscar).quicksearch(grilla + ' tbody tr');
        });
    </script>
    <%--FIN SCRIPT QUE USA FUNCION JQUERY QUICKSEARCH--%>

    <div id="Formularios">
        <div id="Titulos">MINI-BUSES</div>

         <br />

        <asp:Image ID="imgLupa" runat="server" ImageUrl="~/Admin/GridViews/ImgsABM/Buscar.png" />&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBuscar" runat="server" CssClass="CajaBusqueda"></asp:TextBox>
        <ajaxToolkit:TextBoxWatermarkExtender ID="txtBuscar_TextBoxWatermarkExtender" runat="server" BehaviorID="txtBuscar_TextBoxWatermarkExtender" TargetControlID="txtBuscar" WatermarkCssClass="CajaBusquedaWatermark" WatermarkText="Buscar..."></ajaxToolkit:TextBoxWatermarkExtender>

        <br />
        <br />

        <asp:ScriptManager ID="ScriptManager" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>


        <div id="Grillas">
            <asp:GridView ID="gvMiniBuses" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" runat="server" OnRowEditing="gvMiniBuses_RowEditing" OnRowCancelingEdit="gvMiniBuses_RowCancelingEdit" OnRowUpdating="gvMiniBuses_RowUpdating" OnRowDeleting="gvMiniBuses_RowDeleting" DataKeyNames="IdMiniBus" ShowFooter="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" OnRowCommand="gvMiniBuses_RowCommand" >
                
                <PagerStyle CssClass="pgr"></PagerStyle>
                <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>


                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="Eliminar" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Admin/GridViews/ImgsABM/Eliminar.png" OnClientClick="return confirm('¿Está seguro de querer eliminar este Mini-bus?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="EdicionActualizar" runat="server" CausesValidation="True" CommandName="Update" OnClientClick="return confirm('¿Está seguro de actualizar y guardar los datos de este Mini-bus?');" Text="OK" ValidationGroup="EditOK" />
                            <asp:LinkButton ID="EdicionCancelar" runat="server" CausesValidation="False" CommandName="Cancel" OnClientClick="return confirm('¿Está seguro de cancelar los cambios sobre este Mini-bus?');" Text="Cancelar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="Edicion" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Admin/GridViews/ImgsABM/Modificar.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID" SortExpression="IdMiniBus">
                        <FooterTemplate>
                            <asp:ImageButton ID="ibAgregar" runat="server" ImageUrl="~/Admin/GridViews/ImgsABM/Agregar.png" CommandName="AgregarNuevo" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("IdMiniBus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Modelo" SortExpression="IdModeloBus">
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlNuevoModelo" runat="server" DataSourceID="SqlDataSourceModelos" DataTextField="Modelo" DataValueField="IdModelo">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceModelos" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT IdModelo, Modelo
FROM Modelos"></asp:SqlDataSource>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("IdModeloBus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Patente" SortExpression="patente">
                        <FooterTemplate>
                            <asp:TextBox ID="txtNuevaPatente" runat="server" MaxLength="7"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevaPatente_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevaPatente_FilteredTextBoxExtender" TargetControlID="txtNuevaPatente" ValidChars="QWERTYUIOPASDFGHJKLÑZXCVBNM0123456789 " />
                            <asp:RequiredFieldValidator ID="rfvNuevaPatente" runat="server" ControlToValidate="txtNuevaPatente" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("patente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Color" SortExpression="color">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditaColor" runat="server" Text='<%# Bind("color") %>' TextMode="Color" Width="20px"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNuevoColor" runat="server" TextMode="Color" Width="20px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:TextBox ID="txtMuestraColor" runat="server" Enabled="False" TextMode="Color" Width="20px" Text='<%# Bind("color") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Prestación" SortExpression="CodPrestacionBus">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlPrestacion" runat="server" DataSourceID="SqlDataSourcePrestaciones" DataTextField="Elemento" DataValueField="codPrestacion">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourcePrestaciones" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="
SELECT codPrestacion, Elemento
FROM Prestaciones"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlNuevaPrestacion" runat="server" DataSourceID="SqlDataSourcePrestaciones" DataTextField="Elemento" DataValueField="codPrestacion">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourcePrestaciones" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT codPrestacion, Elemento
FROM Prestaciones"></asp:SqlDataSource>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("CodPrestacionBus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>
    </div>
    
    <br />

</asp:Content>

