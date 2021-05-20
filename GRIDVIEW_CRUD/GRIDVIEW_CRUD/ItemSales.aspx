<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ItemSales.aspx.vb" Inherits="GRIDVIEW_CRUD.ItemSales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td>TUTORIAL : GRIDVIEW CRUD USING VB.NET&nbsp;</td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td>

                    <asp:GridView ID="GV_SALES" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" Width="100%" ShowFooter="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="No" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_no" runat="server" Text='<%# Bind("No") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_item" runat="server" Text='<%# Bind("Item") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txt_item" runat="server" Width="98%"></asp:TextBox>
                                </FooterTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Edititem" runat="server" Width="98%" Text='<%# Bind("Item") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sub Item">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_subitem" runat="server" Text='<%# Bind("SubItem") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txt_subitem" runat="server" Width="98%"></asp:TextBox>
                                </FooterTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Editsubitem" runat="server" Width="98%" Text='<%# Bind("SubItem") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ordering">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_ordering" runat="server" Text='<%# Bind("Ordering", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txt_ordering" runat="server" Width="98%"></asp:TextBox>
                                </FooterTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Editordering" runat="server" Width="98%" Text='<%# Bind("Ordering") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Selling">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_selling" runat="server" Text='<%# Bind("Selling", "{0:n}") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txt_selling" runat="server" Width="98%"></asp:TextBox>
                                </FooterTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Editselling" runat="server" Width="98%" Text='<%# Bind("Selling") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtn_Delete" runat="server" Text="|Delete|" CommandName="Delete" CausesValidation="false"></asp:LinkButton>
                                    <asp:LinkButton ID="lbtn_Edit" runat="server" Text="|Edit|" CommandName="Edit" CausesValidation="false"></asp:LinkButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="lbtn_Entry" runat="server" Text="|Entry|" CommandName="Entry" CausesValidation="false" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton>
                                    <asp:LinkButton ID="lbtn_Cancel" runat="server" Text="|Cancel|" CommandName="Cancel" CausesValidation="false" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton>
                                </FooterTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lbtn_Update" runat="server" CausesValidation="True"
                                            CommandName="Update" Text="|Update|"></asp:LinkButton>
                                        <asp:LinkButton ID="lbtn_Cancel" runat="server" CausesValidation="False"
                                            CommandName="Cancel" Text="|Cancel|"></asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <tr>
                                <th style="background:#CCCC99; color:white; border: 1px solid #F7F7DE">Item</th>
                                <th style="background:#CCCC99; color:white; border: 1px solid #F7F7DE">Sub Item</th>
                                <th style="background:#CCCC99; color:white; border: 1px solid #F7F7DE">Ordering</th>
                                <th style="background:#CCCC99; color:white; border: 1px solid #F7F7DE">Selling</th>
                                <th style="background:#CCCC99; color:white; border: 1px solid #F7F7DE">Action</th>
                            </tr>
                            <tr style="#F7F7DE">
                                <td>
                                    <asp:TextBox ID="txt_item" runat="server" Width="98%"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_subitem" runat="server" Width="98%"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_ordering" runat="server" Width="98%" Style="text-align: right;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt_selling" runat="server" Width="98%" Style="text-align: right;"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:LinkButton ID="lbtn_EntryItem" runat="server" CausesValidation="false" CommandName="Entry" Text="|Entry|" CommandArgument='<%# Container.DataItemIndex %>'></asp:LinkButton>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>

                </td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">Total Ordering :
                    <asp:TextBox ID="txt_total_ordering" runat="server" Width="210px"  Style="text-align: right;">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Total Selling :
                    <asp:TextBox ID="txt_total_selling" runat="server" Width="210px"  Style="text-align: right;">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Profit :
                    <asp:TextBox ID="txt_percentage_profit" runat="server" Width="70px" Style="text-align: right;">0</asp:TextBox>
                    <asp:TextBox ID="txt_profit" runat="server" Width="130px" Style="text-align: right;">0</asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
