<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mainpage.aspx.cs" Inherits="Proiect.mainpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server"> 
     
    <asp:LoginView runat="server" ViewStateMode="Disabled">  
        <LoggedInTemplate>
            <a runat="server" href="~/AddBookmark">Add bookmark </a>        
        </LoggedInTemplate>
    </asp:LoginView>
                    
    <div>
    <asp:DataGrid ID="Grid1" runat="server" PageSize="5" AllowPaging="True" DataKeyField="Id"
    AutoGenerateColumns="False" CellPadding="10" ForeColor="#333333" GridLines="None" OnPageIndexChanged="Grid_PageIndexChanged">
    <Columns>
    <asp:BoundColumn HeaderText="BookmarkId" DataField="Id">
    </asp:BoundColumn>
    <asp:BoundColumn HeaderText="Title" DataField="title">
    </asp:BoundColumn>
    <asp:BoundColumn HeaderText="Description" DataField="description">
    </asp:BoundColumn>
    <asp:BoundColumn HeaderText="Tags" DataField="tags">
    </asp:BoundColumn>
    <asp:BoundColumn HeaderText="Likes" DataField="likes">
    </asp:BoundColumn>
    <asp:BoundColumn HeaderText="Dislikes" DataField="dislikes">
    </asp:BoundColumn>
</Columns>
<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
<SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" Mode="NumericPages" />
<AlternatingItemStyle BackColor="White" />
<ItemStyle BackColor="#FFFBD6" ForeColor="#333333" />
<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
</asp:DataGrid>
</div>
</asp:Content>