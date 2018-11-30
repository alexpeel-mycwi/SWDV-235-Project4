<%@ Page Title="borrower" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="borrower.aspx.cs" Inherits="borrower" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
  <div class="container row table-title">
    <h2 class="col-sm-12 text-center">Borrowers</h2>
    <br />
    <br />

  <%-- borrower Table --%>
    <asp:ListView ID="ListView1" runat="server"
      DataSourceID="SqlDataSource1" DataKeyNames="borrower_ID"
      InsertItemPosition="LastItem">
       <ItemTemplate>
        <tr class="item-row">
          <td>
            <asp:Label Text='<%# Eval("first_name") %>' runat="server" ID="first_nameLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("last_name") %>' runat="server" ID="last_nameLabel" /></td>
          <td>
            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton"  CssClass="btn btn-primary" CausesValidation="False" />
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
            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CssClass="btn btn-primary" CausesValidation="False" />
            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" CssClass="btn btn-primary" CausesValidation="False" />
          </td>
        </tr>
      </AlternatingItemTemplate>
      <EditItemTemplate>
        <tr class="">
          <td>
            <asp:TextBox Text='<%# Bind("first_name") %>' runat="server" ID="first_nameTextBox" /> <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="first_nameTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
          </td>
          <td>
            <asp:TextBox Text='<%# Bind("last_name") %>' runat="server" ID="last_nameTextBox" /> <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="last_nameTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
          </td>
            <td>
              <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton"  CssClass="btn btn-primary" CausesValidation="False"/>
              <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" CssClass="btn btn-primary" CausesValidation="False" />
          </td>
        </tr>
      </EditItemTemplate>
      <InsertItemTemplate>
        <tr class="">
          <td>
            <asp:TextBox Text='<%# Bind("first_name") %>' runat="server" ID="first_nameTextBox" /> <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="first_nameTextBox" Display="Dynamic" CssClass="edit_error" ViewStateMode="Inherit"></asp:RequiredFieldValidator>
          </td>
          <td>
            <asp:TextBox Text='<%# Bind("last_name") %>' runat="server" ID="last_nameTextBox" /> <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="last_nameTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
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
              <table style="" class="table table-bordered table-responsive table-striped">
                <tr runat="server" style="">
                  <th runat="server">First Name</th>
                  <th runat="server">Last Name</th>
                  <th runat="server"></th>
                </tr>
                <tr runat="server" id="itemPlaceholder"></tr>
              </table>
            </td>
          </tr>
          <tr runat="server">
            <td runat="server" style="padding-bottom: 20px; text-align: center;">
              <asp:DataPager ID="DataPager2" runat="server" PageSize="15">
                <Fields>
                  <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-primary" />
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
            <asp:Label Text='<%# Eval("borrower_ID") %>' runat="server" ID="borrower_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("first_name") %>' runat="server" ID="first_nameLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("last_name") %>' runat="server" ID="last_nameLabel" /></td>
      </SelectedItemTemplate>
    </asp:ListView>
  <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:disk_inventoryConnectionString %>' 
    DeleteCommand="EXEC spDeleteBorrower @borrower_ID" 
    InsertCommand="EXEC spInsertborrower @first_name, @last_name" 
    SelectCommand="SELECT * FROM [borrower] ORDER BY [last_name]" 
    UpdateCommand="EXEC spUpdateborrower @borrower_ID, @first_name, @last_name">
    <DeleteParameters>
      <asp:Parameter Name="borrower_ID" Type="Int32"></asp:Parameter>
    </DeleteParameters>
    <InsertParameters>
      <asp:Parameter Name="first_name" Type="String"></asp:Parameter>
      <asp:Parameter Name="last_name" Type="String"></asp:Parameter>
    </InsertParameters>
    <UpdateParameters>
      <asp:Parameter Name="first_name" Type="String"></asp:Parameter>
      <asp:Parameter Name="last_name" Type="String"></asp:Parameter>
      <asp:Parameter Name="borrower_ID" Type="Int32"></asp:Parameter>
    </UpdateParameters>
  </asp:SqlDataSource>
      </div>
</asp:Content>