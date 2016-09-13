<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuccessMessage.aspx.cs" Inherits="ProiectLast2.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <h2>
        <asp:Literal runat="server" ID="literal" OnInit="literal_Init">

        </asp:Literal>
    </h2>
</div>
</asp:Content>
