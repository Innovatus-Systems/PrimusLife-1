﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/CovaiSoft.master" CodeFile="FinancialTransactionSummary.aspx.cs" Inherits="FinancialTransactionSummary" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Css/sb-admin.css" rel="stylesheet" type="text/css" />
    <link href="CSS/CovaiSoft.css" rel="stylesheet" />
    <%--<link href="CSS/MenuCSS.css" rel="stylesheet" />--%>
    <%--<script src="//code.jquery.com/jquery-1.10.2.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript" language="javascript">
        $(window).scroll(function () {
            if ($(window).scrollTop() >= 300) {
                $('nav').addClass('fixed-header');
            }
            else {
                $('nav').removeClass('fixed-header');
            }
        });



        function askConfirm() {
            if (confirm("Are you sure, you want to save?"))
                alert(" ")
            else {
                //alert(" ")

                return false;
            }
        }

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main_cnt">
        <div class="first_cnt">
            <div style="width:98%";>
               
                <table style="width:100%">
                    <tr>
                        <td align="center">
                             <asp:LinkButton ID="lnktitle" runat="server" Font-Names="verdana" Font-Size="Medium" ForeColor="Green" Font-Bold="true" ></asp:LinkButton>
                        </td>
                    </tr>
                </table>
                <table style="width:100%">

                    <tr>
                                          <td  >
                                                <asp:Label ID="lblfordate" runat="Server" Text="From Date" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>
                                                <telerik:RadDatePicker ID="dtpfordate" runat="server" Culture="English (United Kingdom)" Font-Names="Verdana" Font-Size="Small"
                                                    Width="150px" CssClass="TextBox" ReadOnly="true" ToolTip="Select the date from which you wish to view the transaction details." AutoPostBack="true">
                                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                                        CssClass="TextBox" Font-Names="Calibri">
                                                    </Calendar>
                                                    <DatePopupButton></DatePopupButton>
                                                    <DateInput DisplayDateFormat="ddd dd-MMM-yyyy" DateFormat="dd-MMM-yyyy" Font-Names="Verdana" Font-Size="Small"
                                                        ForeColor="Black" ReadOnly="true">
                                                    </DateInput>
                                                </telerik:RadDatePicker>
                                            </td>

                                            <td>
                                                <asp:Label ID="lbluntildate" runat="Server" Text="To Date" ForeColor=" Black " Font-Names="Verdana" Font-Size="Small"></asp:Label>

                                                <telerik:RadDatePicker ID="dtpuntildate" runat="server" Culture="English (United Kingdom)" Font-Names="Verdana" Font-Size="Small"
                                                    Width="150px" CssClass="TextBox" ReadOnly="true" ToolTip="Select the date till which you wish to view the transaction details." AutoPostBack="true" >
                                                    <Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"
                                                        CssClass="TextBox" Font-Names="Calibri">
                                                    </Calendar>
                                                    <DatePopupButton></DatePopupButton>
                                                    <DateInput DisplayDateFormat="ddd dd-MMM-yyyy" DateFormat="dd-MMM-yyyy" Font-Names="Verdana" Font-Size="Small"
                                                        ForeColor="Black" ReadOnly="true">
                                                    </DateInput>
                                                </telerik:RadDatePicker>
                                            </td>

                       
                        <td >
                           
                            <asp:Button ID="BtnShow" runat="server" CssClass="btn btn-primary" ToolTip="Click here to view the transaction details within the selected date range." AutoPostBack="true" Text="Show" ForeColor="White" OnClick="BtnShow_Click" OnClientClick="ConfirmMsg()"></asp:Button>
                            </td>
                        <td>
                            <asp:Button ID="BtnnExcelExport" runat="server" CssClass="btn btn-success" Font-Bold="true" Text="Export to Excel" OnClick="BtnnExcelExport_Click" ForeColor="White" ToolTip="Click here to export grid details in excel." />
                            
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="Server" Text="Here you get all the financial transaction summary for  a given date range.  Outstanding as of now is also shown." ForeColor="DarkBlue" Font-Names="Verdana" Font-Size="X-Small"></asp:Label>
                        </td>
                    </tr>
                    

                </table>
                <table style="width:97%">
                    <tr>
                        <td align="right">
                            <asp:Label ID="lbltotoutstanding" runat="Server" Text="" ForeColor="DarkGray" Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
                             <asp:Label ID="lbltotdebitcredit" runat="Server" Text="" ForeColor="DarkGray" Font-Names="Verdana" Font-Size="Smaller"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>

                        <td style="width: 1200px; height: 185px; vertical-align: top;">
                            <telerik:RadGrid ID="ReportList" runat="server" AllowPaging="true" PageSize="50" AutoPostBack="true" OnItemCommand="ReportList_ItemCommand"
                                AutoGenerateColumns="False" Skin="WebBlue" AllowSorting="True" ShowFooter="true"
                                CellSpacing="5" Width="98%"
                                MasterTableView-HierarchyDefaultExpanded="true">
                                <ClientSettings>
                                    <Scrolling AllowScroll="True" UseStaticHeaders="true" />
                                </ClientSettings>
                                <HeaderContextMenu CssClass="table table-bordered table-hover">
                                </HeaderContextMenu>
                                <PagerStyle AlwaysVisible="true" Mode="NextPrevAndNumeric" />
                                <MasterTableView AllowCustomPaging="false">
                                    <NoRecordsTemplate>
                                        No Records Found.
                                    </NoRecordsTemplate>
                                    <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                                    <RowIndicatorColumn>
                                        <HeaderStyle Width="10px"></HeaderStyle>
                                    </RowIndicatorColumn>
                                    <ExpandCollapseColumn>
                                        <HeaderStyle Width="10px"></HeaderStyle>
                                    </ExpandCollapseColumn>
                                    <Columns>
                                        
                                        
                                         <telerik:GridBoundColumn HeaderText="Group" DataField="Group" HeaderStyle-Wrap="false" Visible="true"
                                            ItemStyle-Wrap="false"  ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10px"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Count" DataField="Count" HeaderStyle-Wrap="false" Visible="true"
                                            ItemStyle-Wrap="false"  ItemStyle-HorizontalAlign="Left" ItemStyle-Width="10px"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                       
                                         <telerik:GridBoundColumn HeaderText="Debit" DataField="DR" HeaderStyle-Wrap="false" ItemStyle-Width="50px"
                                            ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn HeaderText="Credit" DataField="CR" HeaderStyle-Wrap="false" ItemStyle-Width="50px"
                                            ItemStyle-Wrap="false" AllowFiltering="false" Visible="true" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right"
                                            ItemStyle-CssClass="Row1">
                                            <HeaderStyle Wrap="False"></HeaderStyle>
                                            <ItemStyle Wrap="False"></ItemStyle>
                                        </telerik:GridBoundColumn>
                                          
                                    </Columns>
                                    <EditFormSettings>
                                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                                        </EditColumn>
                                    </EditFormSettings>
                                    <PagerStyle AlwaysVisible="True"></PagerStyle>
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="True" />
                                </ClientSettings>
                                <FilterMenu Skin="WebBlue" EnableTheming="True">
                                    <CollapseAnimation Type="OutQuint" Duration="200"></CollapseAnimation>
                                </FilterMenu>
                            </telerik:RadGrid>


                        </td>

                    </tr>




                </table>


            </div>
        </div>
    </div>
</asp:Content>

