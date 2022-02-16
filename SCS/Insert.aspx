<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Insert.aspx.cs" Inherits="Insert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <center>
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
        <form runat="server">
        <div class="BlockBorder" style="width:830px;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                <span class="BlockHeader"><span style="font-size: 20px">Enter Faculty Slot</span></span>
        <table>
            <tr>
                <td>
                     <div class="BlockBorder" style="width:250px;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                        <span class="BlockHeader"><span style="font-size: 20px">Select Faculty</span></span>
                        <center>
                            <asp:DropDownList ID="Faculty" runat="server" DataSourceID="SqlDataSource1" DataTextField="Fname" DataValueField="Fname">
                               <asp:ListItem Value="TPR">TPR</asp:ListItem>
                                <asp:ListItem Value="DBD">DBD</asp:ListItem>
                                <asp:ListItem Value="KBL">KBL</asp:ListItem>
                                <asp:ListItem Value="HHP1">HHP1</asp:ListItem>
                                <asp:ListItem Value="HHP2">HHP2</asp:ListItem>
                                <asp:ListItem Value="VRF">VRF</asp:ListItem>
                                <asp:ListItem Value="ADP">ADP</asp:ListItem>
                                <asp:ListItem Value="TJP">TJP</asp:ListItem>
                                <asp:ListItem Value="JBU">JBU</asp:ListItem>

                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Fname] FROM [Faculty]"></asp:SqlDataSource>
                        </center>
                     </div></div>
                </td>
                <td>
                     <div class="BlockBorder" style="width:250px;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                        <span class="BlockHeader"><span style="font-size: 20px">Select Day</span></span>
                        <center>
                               <asp:DropDownList ID="Day" runat="server" >
                                   <asp:ListItem Value="Monday">Monday</asp:ListItem>
                                   <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                                   <asp:ListItem Value="Wednesday">Wednesday</asp:ListItem>
                                   <asp:ListItem Value="Thursday">Thursday</asp:ListItem>                                     
                                   <asp:ListItem Value="Friday">Friday</asp:ListItem>
                                   <asp:ListItem Value="Saturday">Saturday</asp:ListItem>
                               </asp:DropDownList>
                        </center>
                     </div></div>
                </td>
            </tr>
            <tr>
                <td>
                     <div class="BlockBorder" style="width:250px;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                             <span class="BlockHeader"><span style="font-size: 20px">Select Time</span></span><div class="timings">
                                 <center class="auto-style1">
                                 08:30 to 09:25&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server"><asp:ListItem Value="f">f</asp:ListItem><asp:ListItem Value="1">1</asp:ListItem><asp:ListItem Value="3">3</asp:ListItem><asp:ListItem Value="5">5</asp:ListItem><asp:ListItem Value="7">7</asp:ListItem><asp:ListItem Value="9">9</asp:ListItem></asp:DropDownList><br><br>
                                 09:25 to 10:20&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList2" runat="server"><asp:ListItem Value="f">f</asp:ListItem><asp:ListItem Value="1">1</asp:ListItem><asp:ListItem Value="3">3</asp:ListItem><asp:ListItem Value="5">5</asp:ListItem><asp:ListItem Value="7">7</asp:ListItem><asp:ListItem Value="9">9</asp:ListItem></asp:DropDownList><br><br>
                                 10:20 to 11:15&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList3" runat="server"><asp:ListItem Value="f">f</asp:ListItem><asp:ListItem Value="1">1</asp:ListItem><asp:ListItem Value="3">3</asp:ListItem><asp:ListItem Value="5">5</asp:ListItem><asp:ListItem Value="7">7</asp:ListItem><asp:ListItem Value="9">9</asp:ListItem></asp:DropDownList><br><br>
                                 11:55 to 12:50&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList4" runat="server"><asp:ListItem Value="f">f</asp:ListItem><asp:ListItem Value="1">1</asp:ListItem><asp:ListItem Value="3">3</asp:ListItem><asp:ListItem Value="5">5</asp:ListItem><asp:ListItem Value="7">7</asp:ListItem><asp:ListItem Value="9">9</asp:ListItem></asp:DropDownList><br><br>
                                 12:50 to 01:45&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList5" runat="server"><asp:ListItem Value="f">f</asp:ListItem><asp:ListItem Value="1">1</asp:ListItem><asp:ListItem Value="3">3</asp:ListItem><asp:ListItem Value="5">5</asp:ListItem><asp:ListItem Value="7">7</asp:ListItem><asp:ListItem Value="9">9</asp:ListItem></asp:DropDownList><br><br>
                                 01:55 to 02:50&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList6" runat="server"><asp:ListItem Value="f">f</asp:ListItem><asp:ListItem Value="1">1</asp:ListItem><asp:ListItem Value="3">3</asp:ListItem><asp:ListItem Value="5">5</asp:ListItem><asp:ListItem Value="7">7</asp:ListItem><asp:ListItem Value="9">9</asp:ListItem></asp:DropDownList><br><br>
                                 02:50 to 03:45&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownList7" runat="server"><asp:ListItem Value="f">f</asp:ListItem><asp:ListItem Value="1">1</asp:ListItem><asp:ListItem Value="3">3</asp:ListItem><asp:ListItem Value="5">5</asp:ListItem><asp:ListItem Value="7">7</asp:ListItem><asp:ListItem Value="9">9</asp:ListItem></asp:DropDownList><br><br>


                                 </center> </div></div></div>
                </td>
                <td>
                    <div class="BlockBorder" style="width:250px;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                            <div class="timings"> Note:-<br>
                            1) Select the semester where faculty is allocated at that time.<br>
                            2) 'f' is selected by default which means faculty is free.<br>
                            </div><br><br><br><br><br><br><br><br><br>
                    <div class="BlockBorder" style="width:120px;float:right" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
            <span class="ButtonInput"><span ><asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click"></asp:Button></span></span></div></div></div>
                
                </div></div></div>

                    </div></div>
                
                </td>
            </tr>
            <tr>
                <td colspan="2">
                                </td>
            </tr>
        </table>
      </div>
         </div>
         </form>
    </center>
</asp:Content>

