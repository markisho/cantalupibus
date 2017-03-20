<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Clientes.aspx.cs" Inherits="Admin_Clientes" validateRequest="false" enableEventValidation="false"  Culture="Auto" UICulture="Auto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%-- SCRIPT QUE USA FUNCION JQUERY QUICKSEARCH --%>
    <script type="text/javascript"">
        $(document).ready(function () {
            var txtBuscar = '#' + '<%=txtBuscar.ClientID %>';
            var grilla = '#' + '<%=gvClientes.ClientID %>';
            $(txtBuscar).quicksearch(grilla + ' tbody tr');
        });
    </script>
    <%--FIN SCRIPT QUE USA FUNCION JQUERY QUICKSEARCH--%>


    <div id="Formularios">
        <div id="Titulos">CLIENTES</div>

        <br />

        <asp:Image ID="imgLupa" runat="server" ImageUrl="~/Admin/GridViews/ImgsABM/Buscar.png" />&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBuscar" runat="server" CssClass="CajaBusqueda"></asp:TextBox>
        <ajaxToolkit:TextBoxWatermarkExtender ID="txtBuscar_TextBoxWatermarkExtender" runat="server" BehaviorID="txtBuscar_TextBoxWatermarkExtender" TargetControlID="txtBuscar" WatermarkCssClass="CajaBusquedaWatermark" WatermarkText="Buscar..." />
        
        <br />
        <br />

        <asp:ScriptManager ID="ScriptManager" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>

        <div id="Grillas">
            <asp:GridView ID="gvClientes" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" runat="server" OnRowEditing="gvClientes_RowEditing" OnRowCancelingEdit="gvClientes_RowCancelingEdit" OnRowUpdating="gvClientes_RowUpdating" OnRowDeleting="gvClientes_RowDeleting" OnRowCommand="gvClientes_RowCommand" ShowFooter="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" style="margin-right: 0px" DataKeyNames="dni" ShowHeaderWhenEmpty="True">

            <PagerStyle CssClass="pgr"></PagerStyle>
            <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>

            <Columns>

                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="Eliminar" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Admin/GridViews/ImgsABM/Eliminar.png" OnClientClick="return confirm('¿Está seguro de querer eliminar este cliente?');" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="EdicionActualizar" runat="server" CausesValidation="True" CommandName="Update" OnClientClick="return confirm('¿Está seguro de actualizar y guardar los datos de este cliente?');" Text="OK" ValidationGroup="EditOK"/>
                        <asp:LinkButton ID="EdicionCancelar" runat="server" CausesValidation="False" CommandName="Cancel" OnClientClick="return confirm('¿Está seguro de cancelar los cambios sobre este cliente?');" Text="Cancelar" />
                    </EditItemTemplate>

                    <FooterTemplate>
                        <asp:ImageButton ID="ibAgregar" runat="server" CommandName="AgregarNuevo" ImageUrl="~/Admin/GridViews/ImgsABM/Agregar.png" />
                    </FooterTemplate>

                    <ItemTemplate>
                        <asp:ImageButton ID="Edicion" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Admin/GridViews/ImgsABM/Modificar.png" />
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Fecha de alta" SortExpression="FechaAlta">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFechaAlta" runat="server" Text='<%# Bind("FechaAlta", "{0:dd/MM/yyyy}") %>' Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtFechaAlta_FilteredTextBoxExtender" runat="server" BehaviorID="txtFechaAlta_FilteredTextBoxExtender" TargetControlID="txtFechaAlta" ValidChars="0123456789/" />
                        <ajaxToolkit:CalendarExtender ID="txtFechaAlta_CalendarExtender" runat="server" Animated="False" BehaviorID="txtFechaAlta_CalendarExtender" PopupButtonID="btnSeleccionarFechaAlta" TargetControlID="txtFechaAlta" TodaysDateFormat="d MMMM , yyyy" />
                        <asp:Button ID="btnSeleccionarFechaAlta" runat="server" Height="20px" Text="..." />
                        <asp:RequiredFieldValidator ID="rfvFechaAlta" runat="server" ControlToValidate="txtFechaAlta" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>

                    <FooterTemplate>
                        <asp:Label ID="lblNuevaFechaAlta" runat="server" Text='<%# System.DateTime.Now.ToString("dd/MM/yyyy") %>'></asp:Label>
                    </FooterTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("FechaAlta", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="DNI" SortExpression="dni">
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoDNI" runat="server" MaxLength="8" Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevoDNI_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevoDNI_FilteredTextBoxExtender" TargetControlID="txtNuevoDNI" ValidChars="0123456789" />
                        <asp:RequiredFieldValidator ID="rfvNuevoDNI" runat="server" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ControlToValidate="txtNuevoDNI"></asp:RequiredFieldValidator>
                    </FooterTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("dni") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("Nombre") %>' Width="100px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNombre_FilteredTextBoxExtender" runat="server" BehaviorID="txtNombre_FilteredTextBoxExtender" TargetControlID="txtNombre" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ" />
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ControlToValidate="txtNombre" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>

                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoNombre" runat="server" Width="100px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevoNombre_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevoNombre_FilteredTextBoxExtender" TargetControlID="txtNuevoNombre" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ" />
                        <asp:RequiredFieldValidator ID="rfvNuevoNombre" runat="server" ControlToValidate="txtNuevoNombre" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Apellido" SortExpression="Apellido">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtApellido" runat="server" Text='<%# Bind("Apellido") %>' Width="100px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtApellido_FilteredTextBoxExtender" runat="server" BehaviorID="txtApellido_FilteredTextBoxExtender" TargetControlID="txtApellido" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ" />
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>

                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoApellido" runat="server" Width="100px" Height="20px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevoApellido_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevoApellido_FilteredTextBoxExtender" TargetControlID="txtNuevoApellido" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ" />
                        <asp:RequiredFieldValidator ID="rfvNuevoApellido" runat="server" ControlToValidate="txtNuevoApellido" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Apellido") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Fecha de nacimiento" SortExpression="FechaNacimiento" >
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFechaNacimiento" runat="server" Text='<%# Bind("FechaNacimiento", "{0:dd/MM/yyyy}") %>' Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtFechaNacimiento_FilteredTextBoxExtender" runat="server" BehaviorID="txtFechaNacimiento_FilteredTextBoxExtender" TargetControlID="txtFechaNacimiento" ValidChars="0123456789/" />
                        <ajaxToolkit:CalendarExtender ID="txtFechaNacimiento_CalendarExtender" runat="server" Animated="False" BehaviorID="txtFechaNacimiento_CalendarExtender" DefaultView="Years" PopupButtonID="btnSeleccionarFecha" TargetControlID="txtFechaNacimiento" TodaysDateFormat="d MMMM , yyyy" />
                        <asp:Button ID="btnSeleccionarFecha" runat="server" Height="20px" Text="..." />
                    </EditItemTemplate>

                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevaFechaNacimiento" runat="server" Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevaFechaNacimiento_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevaFechaNacimiento_FilteredTextBoxExtender" TargetControlID="txtNuevaFechaNacimiento" ValidChars="0123456789/" />
                        <ajaxToolkit:CalendarExtender ID="txtNuevaFechaNacimiento_CalendarExtender" runat="server" Animated="False" BehaviorID="txtNuevaFechaNacimiento_CalendarExtender" DefaultView="Years" PopupButtonID="btnSeleccionarNuevaFecha" SelectedDate="1930-01-01" TargetControlID="txtNuevaFechaNacimiento" TodaysDateFormat="d MMMM , yyyy" StartDate="1930-01-01" />
                        <asp:Button ID="btnSeleccionarNuevaFecha" runat="server" Height="20px" Text="..." />
                        <asp:RequiredFieldValidator ID="rfvNuevaFechaNacimiento" runat="server" ControlToValidate="txtNuevaFechaNacimiento" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("FechaNacimiento", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Teléfono" SortExpression="Telefono">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTelefono" runat="server" Text='<%# Bind("Telefono") %>' Width="90px" MaxLength="14"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtTelefono_FilteredTextBoxExtender" runat="server" BehaviorID="txtTelefono_FilteredTextBoxExtender" TargetControlID="txtTelefono" ValidChars="0123456789-+" />
                    </EditItemTemplate>

                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoTelefono" runat="server" Width="90px" MaxLength="14"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevoTelefono_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevoTelefono_FilteredTextBoxExtender" TargetControlID="txtNuevoTelefono" ValidChars="0123456789-+" />
                        <asp:RequiredFieldValidator ID="rfvNuevoTelefono" runat="server" ControlToValidate="txtNuevoTelefono" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>

                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Telefono") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Calle" SortExpression="Calle">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCalle" runat="server" Text='<%# Bind("Calle") %>' Width="110px"></asp:TextBox>
                    </EditItemTemplate>

                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevaCalle" runat="server" Width="110px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNuevaCalle" runat="server" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ControlToValidate="txtNuevaCalle"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Calle") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Número" SortExpression="numero">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNro" runat="server" Text='<%# Bind("numero") %>' Width="50px" MaxLength="5"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNro_FilteredTextBoxExtender" runat="server" BehaviorID="txtNro_FilteredTextBoxExtender" TargetControlID="txtNro" ValidChars="0123456789" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoNro" runat="server" Width="50px" MaxLength="5"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevoNro_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevoNro_FilteredTextBoxExtender" TargetControlID="txtNuevoNro" ValidChars="0123456789" />
                        <asp:RequiredFieldValidator ID="rfvNuevoNro" runat="server" ControlToValidate="txtNuevoNro" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("numero") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Piso" SortExpression="piso">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPiso" runat="server" Text='<%# Bind("piso") %>' Width="40px" MaxLength="3"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoPiso" runat="server" Width="40px" MaxLength="3"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("piso") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Departamento" SortExpression="departamento">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDepto" runat="server" Text='<%# Bind("departamento") %>' Width="30px" MaxLength="3"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoDepto" runat="server" Width="30px" MaxLength="3"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("departamento") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Localidad" SortExpression="Localidad">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtLocalidad" runat="server" Text='<%# Bind("Localidad") %>' Width="100px"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevaLocalidad" runat="server" Width="100px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNuevaLocalidad" runat="server" ControlToValidate="txtNuevaLocalidad" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Localidad") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="CP" SortExpression="CodigoPostal">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCP" runat="server" Text='<%# Bind("CodigoPostal") %>' Width="50px" MaxLength="8"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoCP" runat="server" Width="50px" MaxLength="8"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label12" runat="server" Text='<%# Bind("CodigoPostal") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="E-mail" SortExpression="CorreoElectronico">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("CorreoElectronico") %>' Width="170px" TextMode="Email"></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoEmail" runat="server" TextMode="Email" Width="170px"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label13" runat="server" Text='<%# Bind("CorreoElectronico") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Tipo de cliente" SortExpression="TipoUsuario">
                    <EditItemTemplate>
                        <asp:CheckBox ID="chkTipoCliente" runat="server" Checked='<%# Bind("TipoUsuario") %>'></asp:CheckBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBoxList1" runat="server" Checked='<%# Bind("TipoUsuario") %>' Enabled="False"></asp:CheckBox>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

            </asp:GridView>
        </div>
    </div>


<br />

    
</asp:Content>

