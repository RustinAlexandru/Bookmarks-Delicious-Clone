<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Bookmark.aspx.cs" Inherits="ProiectLast2.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="formview" runat="server">
         <ItemTemplate>
                <td style="background-color: #E0FFFF; color: #333333;" runat="server">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img") %>' Width="150px" Height="150px"/>
                <br />
                title:
              <asp:Label id="titleLabel" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                <br />
                description:
              <asp:Label id="descriptionLabel" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                <br />                            
                tags:
                <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                <br />
                likes:
                <asp:Label ID="likesLabel" runat="server" Text='<%# Eval("likes") %>' />
                <br />
                dislikes:
                <asp:Label ID="dislikesLabel" runat="server" Text='<%# Eval("dislikes") %>' />
                <br />
                date_added:
                <asp:Label ID="date_addedLabel" runat="server" Text='<%# Eval("date_added") %>' />
                <br />
                URL:
                <asp:Label ID="URLLabel" runat="server" Text='<%# Eval("URL") %>' />
                <br />
             </td>
         </ItemTemplate>
    </asp:FormView>
    
    <asp:LoginView runat="server" ID="loginview">  
        <LoggedInTemplate>

        Comment: <asp:TextBox ID="comment" runat="server" TextMode="MultiLine"> </asp:TextBox> 
       <br/>
        <asp:Button ID="addCommentBtn" Text="Add comment" CssClass="btn btn-success" runat="server" OnClick="addComment" />
        </LoggedInTemplate>
    </asp:LoginView>
    
        <asp:Repeater ID="Repeater" runat="server" >
            <ItemTemplate>
                 <div class="comments">
                  <asp:Label ID="username" runat="server" Text='<%# Eval("UserName") %>' > </asp:Label>
                 <asp:Label ID="dateAdded" runat="server" Text='<%# Eval("date_added") %>'> </asp:Label>
                     <br />
                     <br />
                     <br />
                 <asp:Label ID="comment" runat="server" Text='<%# Eval("text") %>'> </asp:Label>
                </div>
                <asp:Button ID="deleteComment" Text="Delete comment" CssClass="btn btn-warning" runat="server" Visible="false" CommandName="deleteComment" CommandArgument='<%# Eval("Id") %>' OnCommand="commandClick"/>
            </ItemTemplate>
        </asp:Repeater>
</asp:Content>
