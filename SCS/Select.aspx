<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Select.aspx.cs" Inherits="Select" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <form runat="server">
        <center>
            <asp:SiteMapPath ID="SiteMapPath1" runat="server" PathDirection="CurrentToRoot"></asp:SiteMapPath><div class="BlockBorder" style="width: 350px;" id="loginbox"><div class="BlockBL"><div></div></div><div class="BlockBR"><div></div></div><div class="BlockTL"></div><div class="BlockTR"><div></div></div><div class="BlockT"></div><div class="BlockR"><div></div></div><div class="BlockB"><div></div></div><div class="BlockL"></div><div class="BlockC"></div><div class="Block">
                <span class="BlockHeader"><span>Select One</span></span>
                <div class="BlockContentBorder">
                    <span class="ButtonInput"><span><asp:Button ID="Button1" runat="server" Text="Insert faculty slot" OnClick="Button1_Click"></asp:Button></span></span>
                    <span class="ButtonInput"><span><asp:Button ID="Button2" runat="server" Text="Generate Chart" OnClick="Button2_Click"></asp:Button></span></span>
                </div></div></div>
        </center>
    </form>
</asp:Content>

