<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="ViajesDiarios.aspx.cs" Inherits="Admin_ViajesDiarios"  Culture="Auto" UICulture="Auto" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


   <%-- SCRIPT QUE USA FUNCION JQUERY QUICKSEARCH --%>
    <script type="text/javascript"">
        $(document).ready(function () {
            var txtBuscar = '#' + '<%=txtBuscar.ClientID %>';
            var grilla = '#' + '<%=gvViajesDiarios.ClientID %>';
            $(txtBuscar).quicksearch(grilla + ' tbody .UserRolesRow');
        });
    </script>
    <%--FIN SCRIPT QUE USA FUNCION JQUERY QUICKSEARCH--%>


    <div id="Formularios">
        <div id="Titulos">VIAJES DIARIOS</div>

        <br />

        <asp:Image ID="imgLupa" runat="server" ImageUrl="~/Admin/GridViews/ImgsABM/Buscar.png" />&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBuscar" runat="server" CssClass="CajaBusqueda"></asp:TextBox>
        <ajaxToolkit:TextBoxWatermarkExtender ID="txtBuscar_TextBoxWatermarkExtender" runat="server" BehaviorID="txtBuscar_TextBoxWatermarkExtender" TargetControlID="txtBuscar" WatermarkCssClass="CajaBusquedaWatermark" WatermarkText="Buscar..."></ajaxToolkit:TextBoxWatermarkExtender>

        <br />
        <br />

        <asp:ScriptManager ID="ScriptManager" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>

        <div id="Grillas">
            <asp:GridView ID="gvViajesDiarios" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" runat="server" OnRowEditing="gvViajesDiarios_RowEditing" OnRowCancelingEdit="gvViajesDiarios_RowCancelingEdit" OnRowUpdating="gvViajesDiarios_RowUpdating" DataKeyNames="CodViaje" ShowFooter="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" AutoGenerateColumns="False" OnRowCommand="gvViajesDiarios_RowCommand" >
                
            <PagerStyle CssClass="pgr"></PagerStyle>
            <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>

                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="EdicionActualizar" runat="server" CausesValidation="True" CommandName="Update" OnClientClick="return confirm('¿Está seguro de actualizar y guardar los datos de este Viaje?');" Text="Confirmar" ValidationGroup="EditOK" />
                            <asp:LinkButton ID="EdicionCancelar" runat="server" CausesValidation="False" CommandName="Cancel" OnClientClick="return confirm('¿Está seguro de cancelar los cambios sobre este Viaje?');" Text="Cancelar" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="Edicion" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/Admin/GridViews/ImgsABM/Modificar.png" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Código" SortExpression="CodViaje">
                        <FooterTemplate>
                            <asp:ImageButton ID="ibAgregar" runat="server" CommandName="AgregarNuevo" ImageUrl="~/Admin/GridViews/ImgsABM/Agregar.png" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("CodViaje") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha" SortExpression="fechaViajeDiario">
                        <FooterTemplate>
                            <asp:TextBox ID="txtNuevaFecha" runat="server" Width="70px"></asp:TextBox>
                            <ajaxToolkit:FilteredTextBoxExtender ID="txtNuevaFecha_FilteredTextBoxExtender" runat="server" BehaviorID="txtNuevaFecha_FilteredTextBoxExtender" TargetControlID="txtNuevaFecha" ValidChars="0123456789/" />
                            <ajaxToolkit:CalendarExtender ID="txtNuevaFecha_CalendarExtender" runat="server" Animated="False" BehaviorID="txtNuevaFecha_CalendarExtender" PopupButtonID="btnSeleccionarNuevaFecha" TargetControlID="txtNuevaFecha" TodaysDateFormat="d MMMM , yyyy" />
                            <asp:Button ID="btnSeleccionarNuevaFecha" runat="server" Height="21px" Text="..." />
                            <asp:RequiredFieldValidator ID="rfvFecha" runat="server" ControlToValidate="txtNuevaFecha" ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("fechaViajeDiario", "{0:dd/MM/yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Turno" SortExpression="Turno">
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlNuevoTurno" runat="server">
                                <asp:ListItem>Mañana</asp:ListItem>
                                <asp:ListItem>Tarde</asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Turno") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Origen" SortExpression="Origen">
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
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Origen") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Destino" SortExpression="Destino">
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
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Destino") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mini-Bus asignado" SortExpression="IdMIniBusAsignado">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlMiniBus" runat="server" DataSourceID="SqlDataSourceMiniBuses" DataTextField="MiniBus" DataValueField="IdMiniBus">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceMiniBuses" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT MiniBuses.IdMiniBus, Modelos.Modelo + ' (' + MiniBuses.Patente + ')' AS 'MiniBus', color

FROM MiniBuses INNER JOIN Modelos
	ON (MiniBuses.IdModeloBus=Modelos.IdModelo)
WHERE MiniBuses.BusActivo=1"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlNuevoMiniBusAsignado" runat="server" DataSourceID="SqlDataSourceMiniBuses" DataTextField="MiniBus" DataValueField="IdMiniBus">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceMiniBuses" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT MiniBuses.IdMiniBus, Modelos.Modelo + ' (' + MiniBuses.Patente + ')' AS 'MiniBus', color

FROM MiniBuses INNER JOIN Modelos
	ON (MiniBuses.IdModeloBus=Modelos.IdModelo)
WHERE MiniBuses.BusActivo=1"></asp:SqlDataSource>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("IdMIniBusAsignado") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Chofer" SortExpression="LegajoChofer">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlChofer" runat="server" DataSourceID="SqlDataSourceChoferes" DataTextField="Empleado" DataValueField="Legajo">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceChoferes" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT Empleados.Legajo,
Empleados.Nombre + ' ' + Empleados.Apellido AS 'Empleado'
FROM Empleados
WHERE Empleados.CodSectorEmpleado=2"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlNuevoChofer" runat="server" DataSourceID="SqlDataSourceChoferes" DataTextField="Empleado" DataValueField="Legajo">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceChoferes" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT Empleados.Legajo,
Empleados.Nombre + ' ' + Empleados.Apellido AS 'Empleado'
FROM Empleados
WHERE Empleados.CodSectorEmpleado=2"></asp:SqlDataSource>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("LegajoChofer") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cantidad de socios" SortExpression="CantPasajerosDiarios">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtCantSocios" runat="server" Text='<%# Bind("CantPasajerosDiarios") %>' Width="50px"></asp:TextBox>
                            <ajaxToolkit:NumericUpDownExtender ID="txtCantSocios_NumericUpDownExtender" runat="server" BehaviorID="txtCantSocios_NumericUpDownExtender" Maximum="40" Minimum="20" TargetControlID="txtCantSocios" Width="50" />
                            <asp:RequiredFieldValidator ID="rfvCantSocios" runat="server" ControlToValidate="txtCantSocios"  ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000" ValidationGroup="EditOK"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNuevaCantSocios" runat="server" Width="50px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNuevaCantSocios" runat="server" ControlToValidate="txtNuevaCantSocios"  ErrorMessage="!" Font-Bold="True" Font-Size="20px" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                            <ajaxToolkit:NumericUpDownExtender ID="txtNuevaCantSocios_NumericUpDownExtender" runat="server" BehaviorID="txtNuevaCantSocios_NumericUpDownExtender" Maximum="40" Minimum="2" TargetControlID="txtNuevaCantSocios" Width="50" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("CantPasajerosDiarios") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Observaciones" SortExpression="Observaciones">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtObservaciones" runat="server" Text='<%# Bind("Observaciones") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNuevasObservaciones" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Observaciones") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

            </asp:GridView>
        </div>
    </div>
    
    <br />

</asp:Content>

