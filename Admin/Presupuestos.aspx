<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Presupuestos.aspx.cs" Inherits="Admin_Presupuestos" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%-- SCRIPT QUE USA FUNCION JQUERY QUICKSEARCH --%>
    <script type="text/javascript"">
        $(document).ready(function () {
            var txtBuscar = '#' + '<%=txtBuscar.ClientID %>';
            var grilla = '#' + '<%=gvPresupuestos.ClientID %>';
            $(txtBuscar).quicksearch(grilla + ' tbody tr');
        });
    </script>
    <%--FIN SCRIPT QUE USA FUNCION JQUERY QUICKSEARCH--%>

    <div id="Formularios">
        <div id="Titulos">PRESUPUESTOS</div>

        <br />

        <asp:Image ID="imgLupa" runat="server" ImageUrl="~/Admin/GridViews/ImgsABM/Buscar.png" />&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBuscar" runat="server" CssClass="CajaBusqueda"></asp:TextBox>

        <ajaxToolkit:TextBoxWatermarkExtender ID="txtBuscar_TextBoxWatermarkExtender" runat="server" BehaviorID="txtBuscar_TextBoxWatermarkExtender" TargetControlID="txtBuscar" WatermarkCssClass="CajaBusquedaWatermark" WatermarkText="Buscar...">
        </ajaxToolkit:TextBoxWatermarkExtender>

        <br />
        <br />

        <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

        <div id="Grillas">
            <asp:GridView ID="gvPresupuestos"  CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" runat="server" OnRowEditing="gvPresupuestos_RowEditing" OnRowCancelingEdit="gvPresupuestos_RowCancelingEdit" OnRowUpdating="gvPresupuestos_RowUpdating" DataKeyNames="codPresupuesto" ShowFooter="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" OnRowCommand="gvPresupuestos_RowCommand">
                
            <PagerStyle CssClass="pgr"></PagerStyle>
            <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>

            <Columns>

                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="EdicionActualizar" runat="server" CausesValidation="True" CommandName="Update" OnClientClick="return confirm('¿Está seguro de actualizar y guardar los datos de este Presupuesto?');" Text="OK" ValidationGroup="EditOK" />
                        <asp:LinkButton ID="EdicionCancelar" runat="server" CausesValidation="False" CommandName="Cancel" OnClientClick="return confirm('¿Está seguro de cancelar los cambios sobre este Presupuesto?');" Text="Cancelar" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="Edicion" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Admin/GridViews/ImgsABM/Modificar.png" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Código" SortExpression="codPresupuesto">
                    <FooterTemplate>
                        <asp:ImageButton ID="ibAgregar" runat="server" CommandName="AgregarNuevo" ImageUrl="~/Admin/GridViews/ImgsABM/Agregar.png" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("codPresupuesto") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DNI solicitante" SortExpression="dniP">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDNISolicitante" runat="server" MaxLength="8" Text='<%# Bind("dniP") %>' Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtDNISolicitante_FilteredTextBoxExtender" runat="server" BehaviorID="txtDNISolicitante_FilteredTextBoxExtender" TargetControlID="txtDNISolicitante" ValidChars="0123456789" />
                        <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNISolicitante" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoDNISolicitante" runat="server" MaxLength="8" Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevoDNISolicitante_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevoDNI_FilteredTextBoxExtender" TargetControlID="txtNuevoDNISolicitante" ValidChars="0123456789" />
                        <asp:RequiredFieldValidator ID="rfvNuevoDNI" runat="server" ControlToValidate="txtNuevoDNISolicitante" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("dniP") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre de solicitante" SortExpression="NombreCliente">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombreSolicitante" runat="server" Text='<%# Bind("NombreCliente") %>'></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNombreSolicitante_FilteredTextBoxExtender" runat="server" BehaviorID="txtNombreSolicitante_FilteredTextBoxExtender" TargetControlID="txtNombreSolicitante" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ" />
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombreSolicitante" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoNombreSolicitante" runat="server"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevoNombreSolicitante_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevoNombreSolicitante_FilteredTextBoxExtender" TargetControlID="txtNuevoNombreSolicitante" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ" />
                        <asp:RequiredFieldValidator ID="rfvNuevoNombre" runat="server" ControlToValidate="txtNuevoNombreSolicitante" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("NombreCliente") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellido de solicitante" SortExpression="ApellidoCliente">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtApellidoSolicitante" runat="server" Text='<%# Bind("ApellidoCliente") %>'></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtApellidoSolicitante_FilteredTextBoxExtender" runat="server" BehaviorID="txtApellidoSolicitante_FilteredTextBoxExtender" TargetControlID="txtApellidoSolicitante" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ" />
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellidoSolicitante" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoApellidoSolicitante" runat="server"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevoApellidoSolicitante_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevoApellidoSolicitante_FilteredTextBoxExtender" TargetControlID="txtNuevoApellidoSolicitante" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ" />
                        <asp:RequiredFieldValidator ID="rfvNuevoApellido" runat="server" ControlToValidate="txtNuevoApellidoSolicitante" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ApellidoCliente") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="E-mail de contacto" SortExpression="EmailCliente">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmailContacto" runat="server" Text='<%# Bind("EmailCliente") %>' TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmailContacto" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoEmailContacto" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNuevoEmail" runat="server" ControlToValidate="txtNuevoEmailContacto" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("EmailCliente") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Teléfono" SortExpression="TelefonocCliente">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTelefono" runat="server" Text='<%# Bind("TelefonocCliente") %>' MaxLength="14"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtTelefono_FilteredTextBoxExtender" runat="server" BehaviorID="txtTelefono_FilteredTextBoxExtender" TargetControlID="txtTelefono" ValidChars="0123456789-+" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoTelefono" runat="server" MaxLength="14"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevoTelefono_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevoTelefono_FilteredTextBoxExtender" TargetControlID="txtNuevoTelefono" ValidChars="0123456789-+" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("TelefonocCliente") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Origen" SortExpression="lugarOrigen">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlOrigen" runat="server" DataSourceID="SqlDataSourceLugaresOrigen" DataTextField="Lugar" DataValueField="Lugar">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceLugaresOrigen" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT * FROM Lugares"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlNuevoOrigen" runat="server" DataSourceID="SqlDataSourceLugaresOrigen" DataTextField="Lugar" DataValueField="Lugar">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceLugaresOrigen" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT * FROM Lugares"></asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("lugarOrigen") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Destino" SortExpression="LugarDestino">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlDestino" runat="server" DataSourceID="SqlDataSourceLugaresDestino" DataTextField="Lugar" DataValueField="Lugar">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceLugaresDestino" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT * FROM Lugares"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlNuevoDestino" runat="server" DataSourceID="SqlDataSourceLugaresDestino" DataTextField="Lugar" DataValueField="Lugar">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceLugaresDestino" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT * FROM Lugares"></asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("LugarDestino") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comentarios/Aclaraciones" SortExpression="Comentarios">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtComentarios" runat="server" Text='<%# Bind("Comentarios") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoComentarios" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Comentarios") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            </asp:GridView>
        </div>
    </div>
    
    <br />

</asp:Content>

