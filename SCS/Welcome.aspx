<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" Theme="SkinFile" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <form runat="server">
         
        <center>
           <asp:SiteMapPath ID="SiteMapPath1" runat="server" PathDirection="CurrentToRoot"></asp:SiteMapPath>
            <div class="BlockBorder" style="width:500px;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                <span class="BlockHeader"><span style="font-size: 20px"><%# Enter %></span></span>
            <table>
                <tr>
                    <td colspan="2">
               
            <div class="BlockBorder" style="width: 400px;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                <span class="BlockHeader"><span>Select Dates</span></span>
            <div class="BlockContentBorder">
                 <asp:Calendar style="float:left;" ID="Calendar1" runat="server" required="required" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnDayRender="Calendar1_DayRender" Width="200px" >
                     <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                     <NextPrevStyle VerticalAlign="Bottom" />
                     <OtherMonthDayStyle ForeColor="#808080" />
                     <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                     <SelectorStyle BackColor="#CCCCCC" />
                     <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                     <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                     <WeekendDayStyle BackColor="#FFFFCC" />
                 </asp:Calendar>
                &nbsp;&nbsp;
                <asp:Label ID="displaydates" runat="server" Text="Selected Dates:-<br>&nbsp;&nbsp;&nbsp;&nbsp;"></asp:Label>
            </div></div></div>
                    </td>
                    </tr>
                    <tr>
                        <td>
                              <div class="BlockBorder" style="width: 190px;font-size:15px;"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                <span class="BlockHeader"><span>Select semesters</span></span>
            <div class="BlockContentBorder">
                             <asp:CheckBoxList ID="semester" runat="server" RepeatColumns="2">
                                 <asp:ListItem Value="1">&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                 <asp:ListItem Value="2">&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                 <asp:ListItem Value="3">&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                 <asp:ListItem Value="4">&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                 <asp:ListItem Value="5">&nbsp;&nbsp;5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                 <asp:ListItem Value="6">&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                 <asp:ListItem Value="7">&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                 <asp:ListItem Value="8">&nbsp;&nbsp;8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                 <asp:ListItem Value="9">&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                                 <asp:ListItem Value="e">&nbsp;&nbsp;10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                             </asp:CheckBoxList>
                <label id="semester"></label>

            </div></div></div>
                        </td>
                        <td>
            <div class="BlockBorder" style="width: 190px;font-size:15px;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                <span class="BlockHeader"><span>Select Timings</span></span>
            <div class="BlockContentBorder">
                <asp:RadioButtonList ID="duration" runat="server" Font-Size="15px">
                    <asp:ListItem Value="1">&nbsp;&nbsp;9:00 to 10:30</asp:ListItem>
                    <asp:ListItem Value="2">&nbsp;&nbsp;1:30 to 3:30</asp:ListItem>
                    <asp:ListItem Value="3">&nbsp;&nbsp;9:00 to 12:00</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" ErrorMessage=" **Select Timings" ControlToValidate="duration"></asp:RequiredFieldValidator>

            </div></div></div>
                            </td>
                        
                        </tr>
             
            <tr>
                <td colspan="2">
                    <div class="BlockBorder" style="width: 400px; font-size:15px;"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                <span class="BlockHeader"><span>Select Classes</span></span>
            <div class="BlockContentBorder">
                        <div class="BlockBorder" style="width:110px; float:left;"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                                
                            <div class="BlockContentBorder">

                               <asp:CheckBoxList ID="CheckBoxList1" runat="server" CausesValidation="true">
                                   <asp:ListItem Value="A207">A207</asp:ListItem>
                               </asp:CheckBoxList> 

                            </div></div></div>
             
                <div class="BlockBorder" style="width:110px; float:left;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
            <div class="BlockContentBorder">
                
                                <asp:CheckBoxList ID="CheckBoxList2" runat="server">
                                   <asp:ListItem Value="B101">B101</asp:ListItem>
                                    <asp:ListItem Value="B102">B102</asp:ListItem>
                                    <asp:ListItem Value="B103">B103</asp:ListItem>
                                    <asp:ListItem Value="B104">B104</asp:ListItem>
                                    <asp:ListItem Value="B201">B201</asp:ListItem>
                                    <asp:ListItem Value="B202">B202</asp:ListItem>
                                    <asp:ListItem Value="B203">B203</asp:ListItem>
                                    <asp:ListItem Value="B204">B204</asp:ListItem>
                                </asp:CheckBoxList>
                    </div></div></div>
                <div class="BlockBorder" style="width:110px; float:left;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
            <div class="auto-style1">
                                 <asp:CheckBoxList ID="CheckBoxList3" runat="server">
                                    <asp:ListItem Value="C101">C101</asp:ListItem>
                                    <asp:ListItem Value="C102">C102</asp:ListItem>
                                    <asp:ListItem Value="C103">C103</asp:ListItem>
                                    <asp:ListItem Value="C104">C104</asp:ListItem>
                                    <asp:ListItem Value="C105">C105</asp:ListItem>
                                    <asp:ListItem Value="C201">C201</asp:ListItem>
                                    <asp:ListItem Value="C203">C203</asp:ListItem>
                                    <asp:ListItem Value="C204">C204</asp:ListItem>
                                    <asp:ListItem Value="C205">C205</asp:ListItem>
                                </asp:CheckBoxList>
                                     
            </div></div></div>
           
            </div></div></div>


                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="BlockBorder" style="width:130px;float:right" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
            <span class="ButtonInput"><span ><asp:Button ID="Submit" runat="server" Text="Generate" Font-Size="15px" OnClick="Submit_Click"></asp:Button></span></span></div></div></div>
                </div>
                </td>
            </tr>

            </table>
         </div></div></center>

    </form>

</asp:Content>

