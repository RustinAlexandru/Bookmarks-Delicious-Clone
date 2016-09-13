<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBookmark.aspx.cs" Inherits="ProiectLast2.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <br />
    <asp:Button id="UploadButton" Text="Upload file" OnClick="UploadButton_Click" runat="server" CausesValidation="false">
    </asp:Button>    
    <br />
    <asp:Label id="UploadStatusLabel"
           runat="server">
    </asp:Label>
    <br />   
    <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
    <asp:TextBox ID="title" runat="server"> </asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="field-validation-error" ErrorMessage="RequiredFieldValidator" ControlToValidate="title"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label4" runat="server" Text="URL"></asp:Label>
    <asp:TextBox ID="URL" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic" CssClass="field-validation-error" ErrorMessage="RequiredFieldValidator" ControlToValidate="URL"></asp:RequiredFieldValidator>    
    <br />
    <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
    <asp:TextBox ID="Description" runat="server" TextMode="MultiLine" Columns="5" Rows="5" Width="257px"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Tags"></asp:Label>
    <asp:TextBox ID="Tags" runat="server" Width="370px"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="submit" ValidationGroup="AllValidators" />
    <asp:HiddenField   Value="" runat="server" ID="hiddenfield" />
</asp:Content>
