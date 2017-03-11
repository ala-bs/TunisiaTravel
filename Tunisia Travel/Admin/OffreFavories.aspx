﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OffreFavories.aspx.cs" Inherits="Tunisia_Travel.Admin.WebForm9" %>
<asp:Content ID="connexion" ContentPlaceHolderID="connexion" runat="server">
    <asp:LoginView ID="utilisateur" runat="server">
        <LoggedInTemplate>
             <asp:LoginName ID="msg" runat="server" FormatString="Bonjour {0} !"/><br />
             <asp:HyperLink ID="Hyperlnk" runat="server" NavigateUrl="/Users/Profil.aspx#profil">Votre profil</asp:HyperLink><br />
             <asp:LoginStatus ID="satut" runat="server" />
        </LoggedInTemplate>
        <RoleGroups>
            <asp:RoleGroup Roles="admin">
                <ContentTemplate>
                <asp:LoginName ID="msg" runat="server" FormatString="Bonjour {0} !"/><br />
                <asp:HyperLink ID="Hyperlien" runat="server" NavigateUrl="/Admin/Administration.aspx#Admino">Administration</asp:HyperLink><br />
                <asp:HyperLink ID="Hyperlnk" runat="server" NavigateUrl="/Users/Profil.aspx#profil">Votre profil</asp:HyperLink><br />
             <asp:LoginStatus ID="satut" runat="server" />
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
        <AnonymousTemplate>
            <asp:Login ID="cnx" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" 
            BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
            Font-Size="0.8em" ForeColor="#333333" Height="109px" Width="289px" 
                DestinationPageUrl="~/Accueil.aspx">
            <TextBoxStyle Font-Size="0.8em" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
                <LayoutTemplate>
                    <table border="0" cellpadding="4" cellspacing="0" 
                        style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0" style="height:109px;width:289px;">
                                    <tr>
                                        <td align="center" colspan="2" 
                                            style="color:White;background-color:#153481;font-size:0.9em;font-weight:bold;">
                                            
 Se connecter</td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nom d&#39;utilisateur&nbsp;:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                ControlToValidate="UserName" ErrorMessage="Un nom d'utilisateur est requis." 
                                                ToolTip="Un nom d'utilisateur est requis." ValidationGroup="ctl03$cnx">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Mot de passe&nbsp;:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="Password" ErrorMessage="Un mot de passe est requis." 
                                                ToolTip="Un mot de passe est requis." ValidationGroup="ctl03$cnx">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="RememberMe" runat="server" 
                                                Text="Mémoriser le mot de passe." />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">

                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="../Inscription.aspx" Text="Pas encore inscrit">Pas encore inscrit</asp:HyperLink>
                                        </td>
                                        <td align="right">
                                            <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" 
                                                BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" Text="Se connecter" 
                                                ValidationGroup="ctl03$cnx" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TitleTextStyle BackColor="#153481" Font-Bold="True" Font-Size="0.9em" 
                ForeColor="White" />
            </asp:Login>
        </AnonymousTemplate>
    </asp:LoginView>
</asp:Content>
<asp:Content ID="tdbord" ContentPlaceHolderID="tdbord" runat="server">
    <center>
    <asp:SqlDataSource ID="LesOffresFavories" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CnxOffres %>" 
        SelectCommand="SELECT [titreOffre], [nbLikes] FROM [Offres] ORDER BY [nbLikes] DESC"></asp:SqlDataSource>
        <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        DataSourceID="LesOffresFavories" PageSize="16" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3">
        <RowStyle ForeColor="#000066" />
        <Columns>
            <asp:BoundField DataField="titreOffre" HeaderText="Le Titre de l'Offre" 
                SortExpression="titreOffre" />
            <asp:BoundField DataField="nbLikes" HeaderText="Le nombre de J'aime" 
                SortExpression="nbLikes" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    </asp:GridView>  
</center>
</asp:Content>
