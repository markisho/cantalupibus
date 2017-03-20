<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="EventosCasuales.aspx.cs" Inherits="Admin_EventosCasuales" Culture="Auto" UICulture="Auto" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%-- SCRIPT QUE USA FUNCION JQUERY QUICKSEARCH --%>
    <script type="text/javascript"">
        $(document).ready(function () {
            var txtBuscar = '#' + '<%=txtBuscar.ClientID %>';
            var grilla = '#' + '<%=gvEventosCasuales.ClientID %>';
            $(txtBuscar).quicksearch(grilla + ' tbody tr');
        });
    </script>
    <%--FIN SCRIPT QUE USA FUNCION JQUERY QUICKSEARCH--%>



    <div id="Formularios">
        <div id="Titulos">EVENTOS CASUALES</div>

        <br />

        <asp:Image ID="imgLupa" runat="server" ImageUrl="~/Admin/GridViews/ImgsABM/Buscar.png" />&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBuscar" runat="server" CssClass="CajaBusqueda"></asp:TextBox>

        <ajaxToolkit:TextBoxWatermarkExtender ID="txtBuscar_TextBoxWatermarkExtender" runat="server" BehaviorID="txtBuscar_TextBoxWatermarkExtender" TargetControlID="txtBuscar" WatermarkCssClass="CajaBusquedaWatermark" WatermarkText="Buscar..." />

        <br />
        <br />

        <asp:ScriptManager ID="ScriptManager" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>


        <div id="Grillas">
            <asp:GridView ID="gvEventosCasuales" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" runat="server" OnRowEditing="gvEventosCasuales_RowEditing" OnRowCancelingEdit="gvEventosCasuales_RowCancelingEdit" OnRowUpdating="gvEventosCasuales_RowUpdating" OnRowDeleting="gvEventosCasuales_RowDeleting" DataKeyNames="CodEvento" ShowFooter="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" OnRowCommand="gvEventosCasuales_RowCommand" >
                
            <PagerStyle CssClass="pgr"></PagerStyle>
            <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>

            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:ImageButton ID="Eliminar" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Admin/GridViews/ImgsABM/Eliminar.png" OnClientClick="return confirm('¿Está seguro de querer eliminar este evento?');" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="EdicionActualizar" runat="server" CausesValidation="True" CommandName="Update" OnClientClick="return confirm('¿Está seguro de actualizar y guardar los datos de este evento?');" Text="OK" ValidationGroup="EditOK" />
                        <asp:LinkButton ID="EdicionCancelar" runat="server" CausesValidation="False" CommandName="Cancel" OnClientClick="return confirm('¿Está seguro de cancelar los cambios sobre este evento?');" Text="Cancelar" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="Edicion" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Admin/GridViews/ImgsABM/Modificar.png" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Código de Evento" SortExpression="CodEvento">
                    <FooterTemplate>
                        <asp:ImageButton ID="ibAgregar" runat="server" CommandName="AgregarNuevo" ImageUrl="~/Admin/GridViews/ImgsABM/Agregar.png" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label52" runat="server" Text='<%# Bind("CodEvento") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Código de presupuesto" SortExpression="codPresupuesto">
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlNuevoCodPresupuesto" runat="server" DataSourceID="SqlDataSourceCodPresupuestos" DataTextField="codPresupuesto" DataValueField="codPresupuesto">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceCodPresupuestos" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT [codPresupuesto] FROM [Presupuesto]
WHERE asignado=0"></asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblCodPresupuesto" runat="server" Text='<%# Bind("codPresupuesto") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mini-Bus asignado" SortExpression="IdminiBusEvento">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlMiniBus" runat="server" DataSourceID="SqlDataSourceMiniBus" DataTextField="MiniBus" DataValueField="IdMiniBus" Height="16px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceMiniBus" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT MiniBuses.IdMiniBus, Modelos.Modelo + ' (' + MiniBuses.Patente + ')' AS 'MiniBus', color

FROM MiniBuses INNER JOIN Modelos
	ON (MiniBuses.IdModeloBus=Modelos.IdModelo)
WHERE MiniBuses.BusActivo=1"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlNuevoMiniBus" runat="server" DataSourceID="SqlDataSourceMiniBus" DataTextField="MiniBus" DataValueField="IdMiniBus">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceMiniBus" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT MiniBuses.IdMiniBus, Modelos.Modelo + ' (' + MiniBuses.Patente + ')' AS 'MiniBus', color

FROM MiniBuses INNER JOIN Modelos
	ON (MiniBuses.IdModeloBus=Modelos.IdModelo)
WHERE MiniBuses.BusActivo=1"></asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("IdminiBusEvento") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Chofer" SortExpression="LegajoChoferEvento">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlChofer" runat="server" DataSourceID="SqlDataSourceChofer" DataTextField="Empleado" DataValueField="Legajo">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceChofer" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT Empleados.Legajo,
Empleados.Nombre + ' ' + Empleados.Apellido AS 'Empleado'
FROM Empleados
WHERE Empleados.CodSectorEmpleado=2"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlNuevoChofer" runat="server" DataSourceID="SqlDataSourceChofer" DataTextField="Empleado" DataValueField="Legajo">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceChofer" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT Empleados.Legajo,
Empleados.Nombre + ' ' + Empleados.Apellido AS 'Empleado'
FROM Empleados
WHERE Empleados.CodSectorEmpleado=2"></asp:SqlDataSource>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("LegajoChoferEvento") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cantidad de pasajeros" SortExpression="cantPasajeros">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCantPasajeros" runat="server" Text='<%# Bind("cantPasajeros") %>' MaxLength="2"></asp:TextBox>
                        <ajaxToolkit:NumericUpDownExtender ID="txtCantPasajeros_NumericUpDownExtender" runat="server" BehaviorID="txtCantPasajeros_NumericUpDownExtender" Maximum="40" Minimum="1" RefValues="" ServiceDownMethod="" ServiceUpMethod="" Tag="" TargetButtonDownID="" TargetButtonUpID="" TargetControlID="txtCantPasajeros" Width="40" />
                        <asp:RequiredFieldValidator ID="rfvCantPasajeros" runat="server" ControlToValidate="txtCantPasajeros" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevaCantPasajeros" runat="server" MaxLength="2">1</asp:TextBox>
                        <ajaxToolkit:NumericUpDownExtender ID="txtNuevaCantPasajeros_NumericUpDownExtender" runat="server" BehaviorID="txtNuevaCantPasajeros_NumericUpDownExtender" Maximum="40" Minimum="1" RefValues="" ServiceDownMethod="" ServiceUpMethod="" Tag="" TargetButtonDownID="" TargetButtonUpID="" TargetControlID="txtNuevaCantPasajeros" Width="40" />
                        <asp:RequiredFieldValidator ID="rfvNuevaCantPasajeros" runat="server" ControlToValidate="txtNuevaCantPasajeros" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label51" runat="server" Text='<%# Bind("cantPasajeros") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha de Pedido" SortExpression="FechaPedido">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFechaPedido" runat="server" Text='<%# Bind("FechaPedido", "{0:dd/MM/yyyy}") %>' Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtFechaPedido_FilteredTextBoxExtender" runat="server" BehaviorID="txtFechaPedido_FilteredTextBoxExtender" TargetControlID="txtFechaPedido" ValidChars="0123456789/" />
                        <ajaxToolkit:CalendarExtender ID="txtFechaPedido_CalendarExtender" runat="server" Animated="False" BehaviorID="txtFechaPedido_CalendarExtender" PopupButtonID="btnSeleccionarFechaPedido" TargetControlID="txtFechaPedido"  TodaysDateFormat="d MMMM , yyyy"/>
                        <asp:Button ID="btnSeleccionarFechaPedido" runat="server" Height="20px" Text="..." />
                        <asp:RequiredFieldValidator ID="rfvFechaPedido" runat="server" ControlToValidate="txtFechaPedido" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Label ID="lblNuevaFechaPedido" runat="server" Text='<%# System.DateTime.Now.ToString("dd/MM/yyyy") %>'></asp:Label>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("FechaPedido", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Fecha de evento" SortExpression="FechaViaje">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtFechaEvento" runat="server" Text='<%# Bind("FechaViaje", "{0:dd/MM/yyyy}") %>' Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtFechaEvento_FilteredTextBoxExtender" runat="server" BehaviorID="txtFechaEvento_FilteredTextBoxExtender" TargetControlID="txtFechaEvento" ValidChars="0123456789/" />
                        <ajaxToolkit:CalendarExtender ID="txtFechaEvento_CalendarExtender" runat="server" Animated="False" BehaviorID="txtFechaEvento_CalendarExtender" PopupButtonID="btnSeleccionarFechaEvento" TargetControlID="txtFechaEvento" TodaysDateFormat="d MMMM , yyyy" />
                        <asp:Button ID="btnSeleccionarFechaEvento" runat="server" Height="20px" Text="..." />
                        <asp:RequiredFieldValidator ID="rfvFechaEvento" runat="server" ControlToValidate="txtFechaEvento" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevaFechaEvento" runat="server" Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevaFechaEvento_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevaFechaEvento_FilteredTextBoxExtender" TargetControlID="txtNuevaFechaEvento" ValidChars="0123456789/" />
                        <ajaxToolkit:CalendarExtender ID="txtNuevaFechaEvento_CalendarExtender" runat="server" Animated="False" BehaviorID="txtNuevaFechaEvento_CalendarExtender" PopupButtonID="btnSeleccionarNuevaFechaEvento" TargetControlID="txtNuevaFechaEvento" TodaysDateFormat="d MMMM , yyyy" />
                        <asp:Button ID="btnSeleccionarNuevaFechaEvento" runat="server" Height="19px" Text="..." />
                        <asp:RequiredFieldValidator ID="rfvNuevaFechaEvento" runat="server" ControlToValidate="txtNuevaFechaEvento" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("FechaViaje", "{0:dd/MM/yyyy}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hora de evento" SortExpression="HoraViaje">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtHora" runat="server" Text='<%# Bind("HoraViaje", "{0:HH:mm}") %>' Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtHora_FilteredTextBoxExtender" runat="server" BehaviorID="txtHora_FilteredTextBoxExtender" TargetControlID="txtHora" ValidChars="0123456789:" />
                        <asp:RequiredFieldValidator ID="rfvHora" runat="server" ControlToValidate="txtHora" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevaHora" runat="server" Width="70px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevaHora_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevaHora_FilteredTextBoxExtender" TargetControlID="txtNuevaHora" ValidChars="0123456789:" />
                        <asp:RequiredFieldValidator ID="rfvNuevaHora" runat="server" ControlToValidate="txtNuevaHora" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("HoraViaje", "{0:HH:mm}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Importe" SortExpression="Importe">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtImporte" runat="server" Text='<%# Bind("Importe") %>' Width="50px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtImporte_FilteredTextBoxExtender" runat="server" BehaviorID="txtImporte_FilteredTextBoxExtender" TargetControlID="txtImporte" ValidChars="0123456789," />
                        <asp:RequiredFieldValidator ID="rfvImporte" runat="server" ControlToValidate="txtImporte" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtNuevoImporte" runat="server" Width="50px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevoImporte_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevoImporte_FilteredTextBoxExtender" TargetControlID="txtNuevoImporte" ValidChars="0123456789," />
                        <asp:RequiredFieldValidator ID="rfvNuevoImporte" runat="server" ControlToValidate="txtNuevoImporte" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("Importe") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            </asp:GridView>
        </div>
    </div>
    
    <br />

</asp:Content>

