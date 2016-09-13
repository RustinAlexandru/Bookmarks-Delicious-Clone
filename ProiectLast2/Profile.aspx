<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ProiectLast2.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <script>    
        $(document).ready(function () {
            var heights = $(".listItemdDiv").map(function () {
                return $(this).height();
            }).get(),

            maxHeight = Math.max.apply(null, heights);

            $(".listItemdDiv").height(maxHeight);
        });

    </script>
    
    
    <div id="usertitle" > <H1> Current user profile  </H1>  </div>
    <div id="usernameHolder"> <h2> <asp:Label id="usernameLabel" runat="server" > </asp:Label> </h2> </div>
    <div id="savedbookmarksHolder">  <h3 class="text-primary"> Saved bookmarks </h3> </div>

        <asp:ListView ID="ProfileListView" runat="server" DataKeyNames="Id" GroupItemCount="3" OnPagePropertiesChanging="ProfileListView_PagePropertiesChanging">
       
            <ItemTemplate>
                <div runat="server" class="listItem col-md-4 col-sm-6 col-xs-6" style="background-color: #0071E0;color: #333333;">
                <div runat="server" class="listItemdDiv" style="background-color: #E0FFFF">
                    <asp:HyperLink ID="hyperlink" runat="server" NavigateUrl='<%# string.Format("~/Bookmark.aspx?id={0}", Eval("Id"))  %>' >
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img") %>'  Height="150px" Width="150px"/>
                        </asp:HyperLink>
                        <br />
                        Id:
                        <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        URL:
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("URL") %>'  Text='<%# Eval("URL") %>'> </asp:HyperLink>
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
                </div>
                </div>

            </ItemTemplate>
            <GroupTemplate>
                <div class="row row-top-margin">
                    <div id="itemPlaceholder" runat="server">
 
                    </div>
                </div>
            </GroupTemplate>
            <LayoutTemplate>
                     <div class="listItemsContainer">
                         <div runat="server" id="groupPlaceholder" />
                     </div>
                        
                <br />
                <br />

                      <div runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonCssClass="myPager" ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" />
                                    <asp:NumericPagerField ButtonType="Link" NumericButtonCssClass="myNumericPager"/>
                                    <asp:NextPreviousPagerField ButtonCssClass="myPager" ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton = "false" />
                                 </Fields>
                            </asp:DataPager>
                        </div>
            </LayoutTemplate>
            
        </asp:ListView>
        
       


</asp:Content>
