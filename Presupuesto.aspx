<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Presupuesto.aspx.cs" Inherits="Presupuesto" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">



</script>

    <asp:ScriptManager ID="ScriptManager" runat="server"></asp:ScriptManager>

    <table id="FormularioPresupuesto">
        <tr>
            <td rowspan="10" style="width: 200px" class="modal-sm">
                <asp:Image ID="ImagenBilletes" runat="server" ImageUrl="~/Presupuesto/Billetes.png" Width="180px" />
            </td>
        </tr>

        <tr>
            <td class="text-right" style="width: 150px; height: 30px">DNI (*):</td>
            <td style="height: 30px">
                 &nbsp;
                 <asp:TextBox ID="txtDNI" runat="server" MaxLength="8"></asp:TextBox>
                 &nbsp;<asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="!" CssClass="RFVs"></asp:RequiredFieldValidator>
                 <ajaxToolkit:FilteredTextBoxExtender ID="txtDNI_FilteredTextBoxExtender" runat="server" BehaviorID="txtDNI_FilteredTextBoxExtender" TargetControlID="txtDNI" ValidChars="0123456789" />
                 <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" BehaviorID="txtNombre_FilteredTextBoxExtender" TargetControlID="txtNombre" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ">
                 </ajaxToolkit:FilteredTextBoxExtender>
            </td>
        </tr>

        <tr>
            <td class="text-right" style="width: 150px; height: 30px">Nombre (*):</td>
            <td style="height: 30px">
                 &nbsp;
                 <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                 <ajaxToolkit:FilteredTextBoxExtender ID="txtNombre_FilteredTextBoxExtender" runat="server" BehaviorID="txtNombre_FilteredTextBoxExtender" TargetControlID="txtNombre" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ">
                 </ajaxToolkit:FilteredTextBoxExtender>
                 &nbsp;<asp:RequiredFieldValidator ID="rfvNombre" runat="server" ErrorMessage="!" CssClass="RFVs" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td class="text-right" style="width: 150px; height: 30px;">Apellido (*):</td>
            <td style="height: 30px">
                &nbsp;
                <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="txtApellido_FilteredTextBoxExtender" runat="server" BehaviorID="txtApellido_FilteredTextBoxExtender" TargetControlID="txtApellido" ValidChars="qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNMáéíóúÁÉÍÓÚ">
                </ajaxToolkit:FilteredTextBoxExtender>
                &nbsp;<asp:RequiredFieldValidator ID="rfvApellido" runat="server" ErrorMessage="!" CssClass="RFVs" ControlToValidate="txtApellido"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: 150px; height: 30px;">Correo electrónico (*):</td>
            <td style="height: 30px">
                &nbsp;
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="!" CssClass="RFVs" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: 150px; height: 30px;">Teléfono:</td>
            <td style="height: 30px">
                &nbsp;
                <asp:TextBox ID="txtTelefono" runat="server" MaxLength="14"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="txtTelefono_FilteredTextBoxExtender" runat="server" BehaviorID="txtTelefono_FilteredTextBoxExtender" TargetControlID="txtTelefono" ValidChars="0123456789-+">
                </ajaxToolkit:FilteredTextBoxExtender>
            </td>
        </tr>
        <tr>
            <td class="text-right" style="width: 150px; height: 30px;">Lugar de origen (*):</td>
            <td style="height: 30px">
                &nbsp;
                <asp:DropDownList ID="ddlLugarOrigen" runat="server" DataSourceID="SqlDataSourceLugares" DataTextField="Lugar" DataValueField="Lugar">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceLugares" runat="server" ConnectionString="<%$ ConnectionStrings:cantalupibus2015ConnectionString %>" SelectCommand="SELECT * FROM Lugares"></asp:SqlDataSource>
            </td>
        </tr>

        <tr>
            <td class="text-right" style="width: 150px; height: 30px;">Lugar de destino (*):</td>
            <td class="text-left" style="height: 30px">
                &nbsp;
                <asp:DropDownList ID="ddlLugarDestino" runat="server" DataSourceID="SqlDataSourceLugares" DataTextField="Lugar" DataValueField="Lugar">
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td class="text-right" style="width: 150px; height: 49px;">Comentarios</td>
            <td class="text-left" style="height: 49px">
                &nbsp;
                <asp:TextBox ID="txtComentario" runat="server" Height="60px" TextMode="MultiLine" Width="240px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="text-right" colspan="1" style="height: 50px">
                </td>
            <td style="height: 50px">&nbsp;
                <asp:Button ID="btnEnviar" runat="server" Text="Enviar" Height="30px" Width="90px" OnClick="btnEnviar_Click" Style="cursor: default;"/>
            </td>
        </tr>
    </table>

    <div id="labelCodGenerado"><asp:Label ID="lblConfirmacion" runat="server"></asp:Label></div>


        

</asp:Content>

