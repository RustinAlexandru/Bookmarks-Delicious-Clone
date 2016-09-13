<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mainpage.aspx.cs" Inherits="Proiect.mainpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" runat="server"> 
     
    <asp:LoginView runat="server" ViewStateMode="Disabled">  
        <LoggedInTemplate>
            <a runat="server" href="~/AddBookmark" class="btn btn-primary">Add bookmark </a>        
        </LoggedInTemplate>
    </asp:LoginView>
     
    <div class="filter">
        <asp:CheckBox  runat="server" Checked="false" Visible="false" id="mostRecentCheckbox" />
        <asp:Button Text="Most recent" runat="server" OnClick="mostRecentBind" CssClass="btn btn-default"/>
        <asp:CheckBox  runat="server" Checked="false" Visible="false" id="mostViewedCheckbox" />
        <asp:Button Text="Most viewed" runat="server"  OnClick="mostViewedBind" CssClass="btn btn-default"/>

    </div>
    
                 
    <div class="mainDisplay">
            <asp:ListView runat="server" ID="ListView"
            GroupItemCount="4"
            DataKeyNames="Id" OnPagePropertiesChanging="OnPagePropertiesChanging">
            <LayoutTemplate>
            <table runat="server">
              <tr runat="server">
                  <td runat="server">
                      <table id="groupPlaceholderContainer"  runat="server" border="1" style="border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                          <tr id="groupPlaceholder" runat="server">
                          </tr>
                      </table>
                  </td>
              </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                          <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView" PageSize="12 ">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonCssClass="myPager" ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                                <asp:NumericPagerField ButtonType="Link" NumericButtonCssClass="myNumericPager"/>
                                <asp:NextPreviousPagerField ButtonCssClass="myPager" ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton = "false" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
          </LayoutTemplate>
                <%-- 2nd item --%>
                <AlternatingItemTemplate>
                    <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                        <asp:HyperLink ID="hyperlink" runat="server" NavigateUrl='<%# string.Format("~/Bookmark.aspx?id={0}", Eval("Id"))  %>' >
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img") %>' Width="150px" Height="150px"/>
                        </asp:HyperLink>
                        <br />
                        Id:
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        URL:
                        <asp:HyperLink ID="URLLabel" runat="server" NavigateUrl='<%# Eval("URL") %>'  Text='<%# Eval("URL") %>'> </asp:HyperLink>
                        <br />
                        description:
                        <asp:Label ID="descriptionLabel" runat="server" Text='<%# FormatDescription((String)(Eval("description"))) %>' />
                        <br />
                        tags:
                        <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                        <br />
                        date_added:
                        <asp:Label ID="date_addedLabel" runat="server" Text='<%# Eval("date_added") %>' />
                        <br />
                        <asp:Button id="likeButton" CssClass="like btn btn-info" Visible="false" runat="server" text="Like" CommandName="like" OnCommand="commandclick" CommandArgument='<%# Eval("Id") %>'/>
                        Likes:
                        <asp:Label ID="likesLabel" runat="server" Text='<%# Eval("likes") %>' />
                        <br />
                        <asp:Button id="dislikeButton" CssClass="like btn btn-info" Visible="false" runat="server" text="Dislike" CommandName="dislike" OnCommand="commandclick" CommandArgument='<%# Eval("Id") %>'/>
                        Dislikes:
                        <asp:Label ID="dislikesLabel" runat="server" Text='<%# Eval("dislikes") %>' />
                        <br />
                        <asp:Button ID="saveButton2" CssClass="btn btn-warning" Visible="false" runat="server" Text="Save bookmark" CommandName="saveBookmark" OnCommand="commandclick"  CommandArgument='<%# Eval("Id") %>' />
                        <asp:Button ID="deleteBookmark" CssClass="btn btn-warning" Visible="false" Text="Delete bookmark" runat="server" CommandName="DeleteBookmark" OnCommand="commandclick" CommandArgument='<%# Eval("Id") %>'/>
                    </td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="background-color: #999999;">Id:
                        <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        description:
                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                        <br />
                        tags:
                        <asp:TextBox ID="tagsTextBox" runat="server" Text='<%# Bind("tags") %>' />
                        <br />
                        likes:
                        <asp:TextBox ID="likesTextBox" runat="server" Text='<%# Bind("likes") %>' />
                        <br />
                        dislikes:
                        <asp:TextBox ID="dislikesTextBox" runat="server" Text='<%# Bind("dislikes") %>' />
                        <br />
                        date_added:
                        <asp:TextBox ID="date_addedTextBox" runat="server" Text='<%# Bind("date_added") %>' />
                        <br />
                        URL:
                        <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        <br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <div class="emptyDataListViewDiv">
                    <p> 
                No data was found.
                   </p>
                </div>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
          <GroupTemplate>
            <tr runat="server" id="itemPlaceholderContainer">
              <td runat="server" id="itemPlaceholder">
              </td>
            </tr>
          </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">title:
                        <asp:HyperLink ID="hyperlink" runat="server" NavigateUrl='<%# string.Format("~/Bookmark.aspx?id={0}", Eval("Id"))  %>' >
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img") %>' Width="150px" Height="150px"/>
                        </asp:HyperLink>
                        <br />
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        URL:
                        <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                        <br />
                        description:
                        <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                        <br />
                        tags:
                        <asp:TextBox ID="tagsTextBox" runat="server" Text='<%# Bind("tags") %>' />
                        <br />
                        likes:
                        <asp:TextBox ID="likesTextBox" runat="server" Text='<%# Bind("likes") %>' />
                        <br />
                        dislikes:
                        <asp:TextBox ID="dislikesTextBox" runat="server" Text='<%# Bind("dislikes") %>' />
                        <br />
                        date_added:
                        <asp:TextBox ID="date_addedTextBox" runat="server" Text='<%# Bind("date_added") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        <br />

                    </td>
                </InsertItemTemplate>
          <ItemTemplate>
            <td style="background-color: #E0FFFF; color: #333333;" runat="server">
                <asp:HyperLink ID="hyperlink" runat="server" NavigateUrl='<%# string.Format("~/Bookmark.aspx?id={0}", Eval("Id"))  %>' >
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img") %>' Width="150px" Height="150px"/>
                </asp:HyperLink>
                <br />
                Id:
              <asp:Label id="IdLabel" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                <br />
                title:
              <asp:Label id="titleLabel" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                <br />
                URL:
                <asp:HyperLink ID="URLLabel" runat="server" NavigateUrl='<%# Eval("URL") %>'  Text='<%# Eval("URL") %>'> </asp:HyperLink>

                <br />
                description:
              <asp:Label id="descriptionLabel" runat="server" Text='<%# FormatDescription((String)(Eval("description"))) %>'></asp:Label>
                <br />                            
                tags:
                <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                <br />
                date_added:
                <asp:Label ID="date_addedLabel" runat="server" Text='<%# Eval("date_added") %>' />
                <br />
                <asp:Button id="likeButton" CssClass="like btn btn-info" Visible="false" runat="server" Text="Like" CommandName="like" OnCommand="commandclick" CommandArgument='<%# Eval("Id") %>'/>
                Likes:
                <asp:Label ID="likesLabel" runat="server" Text='<%# Eval("likes") %>' />
                <br />
                <asp:Button id="dislikeButton" CssClass="like btn btn-info" Visible="false" runat="server" text="Dislike" CommandName="dislike" OnCommand="commandclick" CommandArgument='<%# Eval("Id") %>'/>
                Dislikes:
                <asp:Label ID="dislikesLabel" runat="server" Text='<%# Eval("dislikes") %>' />
                <br />
                <asp:Button ID="saveButton2" CssClass="btn btn-warning" Visible="false" runat="server" Text="Save bookmark" CommandName="saveBookmark" OnCommand="commandclick"  CommandArgument='<%# Eval("Id") %>' />
                <asp:Button ID="deleteBookmark" CssClass="btn btn-warning" Visible="false" Text="Delete bookmark" runat="server" CommandName="DeleteBookmark" OnCommand="commandclick" CommandArgument='<%# Eval("Id") %>'/>
                 
            </td>
          </ItemTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                        <asp:HyperLink ID="hyperlink" runat="server" NavigateUrl='<%# string.Format("~/Bookmark.aspx?id={0}", Eval("Id"))  %>' >
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img") %>' Width="150px" Height="150px"/>
                        </asp:HyperLink>
                         <br />
                        Id:
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        description:
                        <asp:Label ID="descriptionLabel" runat="server" Text='<%# FormatDescription((String)(Eval("description"))) %>' />
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
                </SelectedItemTemplate>
</asp:ListView>            


    </div>

    <h1> Searching motor </h1>
    <div class="searchDisplay">
        
        
        <asp:TextBox runat="server" id="searchTextbox" /> 
        <asp:Button Text="Search" runat="server" OnClick="SearchBind"  CssClass="btn btn-default"/>    


   
        <asp:DropDownList ID="DropDownList" runat="server" AutoPostBack="False"  >
            <asp:ListItem>title</asp:ListItem>
            <asp:ListItem>description</asp:ListItem>
            <asp:ListItem>tags</asp:ListItem>
        </asp:DropDownList>


        <asp:ListView ID="searchList" runat="server" DataKeyNames="Id" GroupItemCount="4" OnPagePropertiesChanging="searchList_PagePropertiesChanging">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                    <asp:HyperLink ID="hyperlink" runat="server" NavigateUrl='<%# string.Format("~/Bookmark.aspx?id={0}", Eval("Id"))  %>' >
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img") %>' Width="150px" Height="150px"/>
                        </asp:HyperLink>
                    <br />
                    Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />description:
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                    <br />tags:
                    <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                    <br />likes:
                    <asp:Label ID="likesLabel" runat="server" Text='<%# Eval("likes") %>' />
                    <br />dislikes:
                    <asp:Label ID="dislikesLabel" runat="server" Text='<%# Eval("dislikes") %>' />
                    <br />date_added:
                    <asp:Label ID="date_addedLabel" runat="server" Text='<%# Eval("date_added") %>' />
                    <br />URL:
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("URL") %>'  Text='<%# Eval("URL") %>'> </asp:HyperLink>
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">Id:
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    <br />title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                    <br />tags:
                    <asp:TextBox ID="tagsTextBox" runat="server" Text='<%# Bind("tags") %>' />
                    <br />likes:
                    <asp:TextBox ID="likesTextBox" runat="server" Text='<%# Bind("likes") %>' />
                    <br />dislikes:
                    <asp:TextBox ID="dislikesTextBox" runat="server" Text='<%# Bind("dislikes") %>' />
                    <br />date_added:
                    <asp:TextBox ID="date_addedTextBox" runat="server" Text='<%# Bind("date_added") %>' />
                    <br />URL:
                    <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                    <br />img:
                    <asp:TextBox ID="imgTextBox" runat="server" Text='<%# Bind("img") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <div class="emptyDataListViewDiv">
                   <p> 
                No data was found.
                   </p>
                </div>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" Text='<%# Bind("description") %>' />
                    <br />tags:
                    <asp:TextBox ID="tagsTextBox" runat="server" Text='<%# Bind("tags") %>' />
                    <br />likes:
                    <asp:TextBox ID="likesTextBox" runat="server" Text='<%# Bind("likes") %>' />
                    <br />dislikes:
                    <asp:TextBox ID="dislikesTextBox" runat="server" Text='<%# Bind("dislikes") %>' />
                    <br />date_added:
                    <asp:TextBox ID="date_addedTextBox" runat="server" Text='<%# Bind("date_added") %>' />
                    <br />URL:
                    <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                    <br />img:
                    <asp:TextBox ID="imgTextBox" runat="server" Text='<%# Bind("img") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #E0FFFF;color: #333333;">
                      <asp:HyperLink ID="hyperlink" runat="server" NavigateUrl='<%# string.Format("~/Bookmark.aspx?id={0}", Eval("Id"))  %>' >
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img") %>' Width="150px" Height="150px"/>
                        </asp:HyperLink>
                    <br />
                    Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />description:
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                    <br />tags:
                    <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                    <br />likes:
                    <asp:Label ID="likesLabel" runat="server" Text='<%# Eval("likes") %>' />
                    <br />dislikes:
                    <asp:Label ID="dislikesLabel" runat="server" Text='<%# Eval("dislikes") %>' />
                    <br />date_added:
                    <asp:Label ID="date_addedLabel" runat="server" Text='<%# Eval("date_added") %>' />
                    <br />URL:
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("URL") %>'  Text='<%# Eval("URL") %>'> </asp:HyperLink>
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                   <asp:NextPreviousPagerField ButtonCssClass="myPager" ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                                   <asp:NumericPagerField ButtonType="Link" NumericButtonCssClass="myNumericPager"/>
                                   <asp:NextPreviousPagerField ButtonCssClass="myPager" ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton = "false" />
                            </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />description:
                    <asp:Label ID="descriptionLabel" runat="server" Text='<%# Eval("description") %>' />
                    <br />tags:
                    <asp:Label ID="tagsLabel" runat="server" Text='<%# Eval("tags") %>' />
                    <br />likes:
                    <asp:Label ID="likesLabel" runat="server" Text='<%# Eval("likes") %>' />
                    <br />dislikes:
                    <asp:Label ID="dislikesLabel" runat="server" Text='<%# Eval("dislikes") %>' />
                    <br />date_added:
                    <asp:Label ID="date_addedLabel" runat="server" Text='<%# Eval("date_added") %>' />
                    <br />URL:
                    <asp:Label ID="URLLabel" runat="server" Text='<%# Eval("URL") %>' />
                    <br />img:
                    <asp:Label ID="imgLabel" runat="server" Text='<%# Eval("img") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>

       
    </div>
</asp:Content>