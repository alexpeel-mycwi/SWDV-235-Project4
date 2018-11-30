<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeFile="CD.aspx.cs" Inherits="CD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
  <div class="container row table-title">
    <h2 class="col-sm-12 text-center">CDs</h2>
    <br />
    <br />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceCDALL" DataKeyNames="CD_ID" InsertItemPosition="LastItem">
      <ItemTemplate>
        <tr class="item-row">
          <td>
            <asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("type_ID") %>' runat="server" ID="type_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("status") %>' runat="server" ID="statusLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("release_year") %>' runat="server" ID="release_yearLabel" /></td>
          <td>
            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CssClass="btn btn-primary" CausesValidation="False" />
            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" CssClass="btn btn-primary" CausesValidation="False" />
          </td>
        </tr>
      </ItemTemplate>
      <AlternatingItemTemplate>
        <tr class="item-row">
          <td>
            <asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("type_ID") %>' runat="server" ID="type_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("status") %>' runat="server" ID="statusLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("release_year") %>' runat="server" ID="release_yearLabel" /></td>
          <td>
            <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" CssClass="btn btn-primary" CausesValidation="False" />
            <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" CssClass="btn btn-primary" CausesValidation="False" />
          </td>
        </tr>
      </AlternatingItemTemplate>
      <EditItemTemplate>
        <tr class="">
          <td>
            <asp:TextBox Text='<%# Bind("title") %>' runat="server" ID="titleTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="titleTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
            </td> 
          <td>
            <asp:TextBox Text='<%# Bind("type_ID") %>' runat="server" ID="type_IDTextBox" /> <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="type_IDTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Must be either 1 or 2" ControlToValidate="type_IDTextBox" CssClass="edit_error" MaximumValue="2" MinimumValue="1" Type="Integer" Display="Dynamic"></asp:RangeValidator>
          </td>
          <td>
            <asp:TextBox Text='<%# Bind("status") %>' runat="server" ID="statusTextBox" /> <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="statusTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
              <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Must be Borrowed or In Library" ControlToValidate="statusTextBox" CssClass="edit_error" MaximumValue="In Library" MinimumValue="Borrowed" Type="String" Display="Dynamic"></asp:RangeValidator>
            </td>
          <td>
            <asp:TextBox Text='<%# Bind("release_year") %>' runat="server" ID="release_yearTextBox" /> <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="release_yearTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Must be 4 digit year" ValidationExpression="^\d{4}$" ControlToValidate="release_yearTextBox" Display="Dynamic" CssClass="edit_error"></asp:RegularExpressionValidator>
            </td>
          <td>
            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" CausesValidation="False" />
            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" CssClass="btn btn-primary" CausesValidation="False" />
          </td>
        </tr>
      </EditItemTemplate>
      <InsertItemTemplate>
        <tr class="">
          <td>
            <asp:TextBox Text='<%# Bind("title") %>' runat="server" ID="titleTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="titleTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
          </td>
          <td>
            <asp:TextBox Text='<%# Bind("type_ID") %>' runat="server" ID="type_IDTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="type_IDTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Must be either 1 or 2" ControlToValidate="type_IDTextBox" CssClass="edit_error" MaximumValue="2" MinimumValue="1" Type="Integer" Display="Dynamic"></asp:RangeValidator>
          </td>
          <td>
            <asp:TextBox Text='<%# Bind("status") %>' runat="server" ID="statusTextBox" /><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="statusTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
              <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Must be Borrowed or In Library" ControlToValidate="statusTextBox" CssClass="edit_error" MaximumValue="In Library" MinimumValue="Borrowed" Type="String" Display="Dynamic"></asp:RangeValidator>
          </td>
          <td>
            <asp:TextBox Text='<%# Bind("release_year") %>' runat="server" ID="release_yearTextBox" /><br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="release_yearTextBox" Display="Dynamic" CssClass="edit_error"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Must be 4 digit year" ValidationExpression="^\d{4}$" ControlToValidate="release_yearTextBox" Display="Dynamic" CssClass="edit_error"></asp:RegularExpressionValidator>
          </td>
          <td>
            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" CssClass="btn btn-primary" CausesValidation="True" />
            <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" CssClass="btn btn-primary" CausesValidation="False"  />
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
                  <th runat="server">Title</th>
                  <th runat="server">CD Type (1=Solo 2=Group)</th>
                  <th runat="server">Status</th>
                  <th runat="server">Release Year</th>
                  <th runat="server"></th>
                </tr>
                <tr runat="server" id="itemPlaceholder"></tr>
              </table>
            </td>
          </tr>
          <tr runat="server">
            <td runat="server" style="padding-bottom: 20px; text-align: center;">
              <asp:DataPager runat="server" ID="DataPager1"  PageSize="15">
                <Fields>
                  <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" ButtonCssClass="btn btn-primary" ></asp:NextPreviousPagerField>
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
            <asp:Label Text='<%# Eval("CD_ID") %>' runat="server" ID="CD_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("type_ID") %>' runat="server" ID="type_IDLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("status") %>' runat="server" ID="statusLabel" /></td>
          <td>
            <asp:Label Text='<%# Eval("release_year") %>' runat="server" ID="release_yearLabel" /></td>
        </tr>
      </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceCDALL" ConnectionString='<%$ ConnectionStrings:disk_inventoryConnectionString %>' 
      DeleteCommand="EXEC spDeleteCD @CD_ID" 
      InsertCommand="EXEC spInsertCD @type_ID, @title, @status, @release_year" 
      SelectCommand="SELECT * FROM [CD] ORDER BY [title]" 
      UpdateCommand="EXEC spUpdateCD @CD_ID, @type_ID, @title, @status, @release_year">
      <DeleteParameters>
        <asp:Parameter Name="CD_ID" Type="Int32"></asp:Parameter>
      </DeleteParameters>
      <InsertParameters>
        <asp:Parameter Name="type_ID" Type="Int32"></asp:Parameter>
        <asp:Parameter Name="title" Type="String"></asp:Parameter>
        <asp:Parameter Name="status" Type="String"></asp:Parameter>
        <asp:Parameter Name="release_year" Type="String"></asp:Parameter>
      </InsertParameters>
      <UpdateParameters>
        <asp:Parameter Name="type_ID" Type="Int32"></asp:Parameter>
        <asp:Parameter Name="title" Type="String"></asp:Parameter>
        <asp:Parameter Name="status" Type="String"></asp:Parameter>
        <asp:Parameter Name="release_year" Type="String"></asp:Parameter>
        <asp:Parameter Name="CD_ID" Type="Int32"></asp:Parameter>
      </UpdateParameters>
    </asp:SqlDataSource>
  </div>
</asp:Content>