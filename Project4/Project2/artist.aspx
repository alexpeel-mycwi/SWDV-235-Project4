<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeFile="artist.aspx.cs" Inherits="artist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
   <div class="container row table-title">
    <h2 class="col-sm-12 text-center">Artists</h2>
    <br />
    <br />
     <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceartistALL" DataKeyNames="artist_ID" InsertItemPosition="LastItem">
       <ItemTemplate>
         <tr class="item-row">
           <td>
             <asp:Label Text='<%# Eval("first_name") %>' runat="server" ID="first_nameLabel" /></td>
           <td>
             <asp:Label Text='<%# Eval("last_name") %>' runat="server" ID="last_nameLabel" /></td>
           <td>
             <asp:Label Text='<%# Eval("type_ID") %>' runat="server" ID="type_IDLabel" /></td>
           <td>
             <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CssClass="btn btn-primary" CausesValidation="False" />
             <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" CssClass="btn btn-primary" CausesValidation="False" />
           </td>
         </tr>
       </ItemTemplate>
       <AlternatingItemTemplate>
         <tr class="item-row">
           <td>
             <asp:Label Text='<%# Eval("first_name") %>' runat="server" ID="first_nameLabel" /></td>
           <td>
             <asp:Label Text='<%# Eval("last_name") %>' runat="server" ID="last_nameLabel" /></td>
           <td>
             <asp:Label Text='<%# Eval("type_ID") %>' runat="server" ID="type_IDLabel" /></td>
           <td>
             <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CssClass="btn btn-primary" CausesValidation="False" />
             <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton"  CssClass="btn btn-primary" CausesValidation="False"/>
           </td>
         </tr>
       </AlternatingItemTemplate>
       <EditItemTemplate>
         <tr style="">
           <td>
             <asp:TextBox Text='<%# Bind("first_name") %>' runat="server" ID="first_nameTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="first_nameTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
           </td>
           <td>
             <asp:TextBox Text='<%# Bind("last_name") %>' runat="server" ID="last_nameTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="last_nameTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
           </td>
           <td>
             <asp:TextBox Text='<%# Bind("type_ID") %>' runat="server" ID="type_IDTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="type_IDTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="must be between 1 and 5" ControlToValidate="type_IDTextBox" CssClass="edit_error" MaximumValue="5" MinimumValue="1" Type="Integer" Display="Dynamic"></asp:RangeValidator>
           </td>
           <td>
             <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" CssClass="btn btn-primary" CausesValidation="False" />
             <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" CssClass="btn btn-primary" CausesValidation="False" />
           </td>
         </tr>
       </EditItemTemplate>
       <InsertItemTemplate>
         <tr style="">
           <td>
             <asp:TextBox Text='<%# Bind("first_name") %>' runat="server" ID="first_nameTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="first_nameTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
           </td>
           <td>
             <asp:TextBox Text='<%# Bind("last_name") %>' runat="server" ID="last_nameTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="last_nameTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
           </td>
           <td>
             <asp:TextBox Text='<%# Bind("type_ID") %>' runat="server" ID="type_IDTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="type_IDTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Must be either 1 or 2." ControlToValidate="type_IDTextBox" CssClass="edit_error" MaximumValue="2" MinimumValue="1" Type="Integer" Display="Dynamic"></asp:RangeValidator>
           </td>
           <td>
             <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" CssClass="btn btn-primary" CausesValidation="True" />
             <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" CssClass="btn btn-primary" CausesValidation="False" />
           </td>
         </tr>
       </InsertItemTemplate>
       <EmptyDataTemplate>
         <table runat="server" style="">
           <tr>
             <td>No data was returned.</td>
           </tr>
         </table>
       </EmptyDataTemplate>
       <LayoutTemplate>
         <table runat="server" class="col-sm-12">
           <tr runat="server">
             <td runat="server">
               <table id="itemPlaceholderContainer" class="table table-bordered table-responsive table-striped">
                 <tr runat="server" style="">
                   <th runat="server">First Name / Group</th>
                   <th runat="server">Last Name</th>
                   <th runat="server">Artist Type (1=Solo 2=Group)</th>
                   <th runat="server"></th>
                 </tr>
                 <tr runat="server" id="itemPlaceholder"></tr>
               </table>
             </td>
           </tr>
           <tr runat="server">
             <td runat="server" style="padding-bottom: 20px; text-align: center;">
               <asp:DataPager runat="server" ID="DataPager1">
                 <Fields>
                   <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-primary"></asp:NextPreviousPagerField>
                 </Fields>
               </asp:DataPager>
             </td>
           </tr>
         </table>
       </LayoutTemplate>
       <SelectedItemTemplate>
         <tr style="">
           <td>
             <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
             <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
           </td>
           <td>
             <asp:Label Text='<%# Eval("artist_ID") %>' runat="server" ID="artist_IDLabel" /></td>
           <td>
             <asp:Label Text='<%# Eval("type_ID") %>' runat="server" ID="type_IDLabel" /></td>
           <td>
             <asp:Label Text='<%# Eval("first_name") %>' runat="server" ID="first_nameLabel" /></td>
           <td>
             <asp:Label Text='<%# Eval("last_name") %>' runat="server" ID="last_nameLabel" /></td>
         </tr>
       </SelectedItemTemplate>
     </asp:ListView>
     <asp:SqlDataSource runat="server" ID="SqlDataSourceartistALL" ConnectionString='<%$ ConnectionStrings:disk_inventoryConnectionString %>' DeleteCommand="DELETE FROM [artist] WHERE [artist_ID] = @artist_ID" 
       InsertCommand="INSERT INTO [artist] ([type_ID], [first_name], [last_name]) VALUES (@type_ID, @first_name, @last_name)" SelectCommand="SELECT * FROM [artist] ORDER BY [first_name]" 
         UpdateCommand="UPDATE [artist] SET [type_ID] = @type_ID, [first_name] = @first_name, [last_name] = @last_name WHERE [artist_ID] = @artist_ID">
       <DeleteParameters>
         <asp:Parameter Name="artist_ID" Type="Int32"></asp:Parameter>
       </DeleteParameters>
       <InsertParameters>
         <asp:Parameter Name="type_ID" Type="Int32"></asp:Parameter>
         <asp:Parameter Name="first_name" Type="String"></asp:Parameter>
         <asp:Parameter Name="last_name" Type="String"></asp:Parameter>
       </InsertParameters>
       <UpdateParameters>
         <asp:Parameter Name="type_ID" Type="Int32"></asp:Parameter>
         <asp:Parameter Name="first_name" Type="String"></asp:Parameter>
         <asp:Parameter Name="last_name" Type="String"></asp:Parameter>
         <asp:Parameter Name="artist_ID" Type="Int32"></asp:Parameter>
       </UpdateParameters>
     </asp:SqlDataSource>
       </div>
</asp:Content>