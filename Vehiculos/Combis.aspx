<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Combis.aspx.cs" Inherits="Vehiculos_Combis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="ListadoCombis">   
        <asp:ListView ID="lstCombis" runat="server" GroupItemCount="3">

            <ItemTemplate>
                    <td class="Combis1">
                        <asp:Label ID="lblModelo" runat="server" Text='<%# Eval("Modelo") %>'></asp:Label>
                        <br />  
                            <asp:Image ID="imgImagen" ImageUrl='<%# Eval("ImgUrl") %>' runat="server" CommandArgument='<%# Eval("IdModelo") %>'/>
                        <br />
                        <asp:Label ID="lblFechaFabricacion" runat="server" Text='<%# Eval("FechaFabricacion", "{0:yyyy}") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblPais" runat="server" Text='<%# Eval("Pais") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblCapacidad" runat="server" Text='<%# Eval("CapAsientos") %>'></asp:Label>
                        <br />
                    </td>
            </ItemTemplate>

            <AlternatingItemTemplate>
                    <td class="Combis2">
                        <asp:Label ID="lblModelo" runat="server" Text='<%# Eval("Modelo") %>'></asp:Label>
                        <br />  
                            <asp:Image ID="imgImagen" ImageUrl='<%# Eval("ImgUrl") %>' runat="server" CommandArgument='<%# Eval("IdModelo") %>'/>
                        <br />
                        <asp:Label ID="lblFechaFabricacion" runat="server" Text='<%# Eval("FechaFabricacion", "{0:yyyy}") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblPais" runat="server" Text='<%# Eval("Pais") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblCapacidad" runat="server" Text='<%# Eval("CapAsientos") %>'></asp:Label>
                        <br />
                    </td>
            </AlternatingItemTemplate>

            <LayoutTemplate>
                <table id="Table1" runat="server">
                    <tr runat="server">
                        <%--<td ID="itemPlaceholder"></td>--%>
                        <td id="groupPlaceholder"></td>
                    </tr>
                </table>
            </LayoutTemplate>

                    <GroupTemplate>
                        <tr runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>

        </asp:ListView>
    </div>

</asp:Content>

