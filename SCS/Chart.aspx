<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Chart.aspx.cs" Inherits="Chart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
    <body>
        <form runat="server">
             <asp:SiteMapPath ID="SiteMapPath1" runat="server" PathDirection="CurrentToRoot"></asp:SiteMapPath>
       
           <span class="ButtonInput" style="float:right; margin-right: 42px;"><span > <asp:Button ID="logout" runat="server" Text="Logout" OnClick="logout_Click" CssClass="auto-style1" /></span></span>
       <br />
           <br />

        <div class="BlockBorder" style="width:95%" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                <span class="BlockHeader"><span style="font-size: 20px">Supervision Chart</span></span>
               <center>
                   <asp:Label ID="Label1" runat="server" Font-Size="15pt" Text="Supervision Chart"></asp:Label>
                   <br />
                   <asp:GridView ID="GridView1" runat="server" Height="180px" Width="223px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnPreRender="GridView1_PreRender" ForeColor="Black" GridLines="Vertical">
                       <AlternatingRowStyle BackColor="White" />
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
                   <%# Chartmanual %>
                   <asp:DetailsView ID="DetailsView1" runat="server" Width="125px" Height="50px"></asp:DetailsView>
                   <asp:FormView ID="FormView1" runat="server"></asp:FormView>
                   <asp:ListView ID="ListView1" runat="server"></asp:ListView>

                   <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                   <br />

                   
                   
                   <span class="ButtonInput"><span><asp:Button ID="Button1" runat="server" Text="Click here to view table in excel file" OnClick="Button1_Click"></asp:Button></span></span>
                   
               </center>
                   
              </div></div>
           </form>
        </body>
</asp:Content>

