<%@ Page Language="C#" Title="Dashboard" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
  <%-- Checked Out CD Table --%>
  <h2 class="text-center">Checked Out CD</h2>
  <asp:DataList ID="dlBorrowed" runat="server" DataSourceID="SqlDataSourceBorrowed" CssClass="table table-bordered table-striped">
    <HeaderTemplate>
      <span class="col-xs-3">Title</span>
      <span class="col-xs-3">Borrower</span>
      <span class="col-xs-3">Borrow Date</span>
    </HeaderTemplate>
    <ItemTemplate>
      <asp:Label ID="lblTitle" runat="server"
        Text='<%# Eval("title") %>' CssClass="col-xs-3" />
      <asp:Label ID="lblName" runat="server"
        Text='<%# Eval("Borrower") %>' CssClass="col-xs-3" />
      <asp:Label ID="lblBorrowDate" runat="server"
        Text='<%# Eval("borrowed_date", "{0:d}") %>' CssClass="col-xs-3" />
    </ItemTemplate>
    <HeaderStyle CssClass="thead-dark" />
  </asp:DataList>
  <asp:SqlDataSource
    ID="SqlDataSourceBorrowed" runat="server"
    ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>"
    SelectCommand="SELECT CD.title, borrower.first_name + ' ' + borrower.last_name AS 'Borrower', CD_borrowed.borrowed_date 
                   FROM CD 
                     INNER JOIN CD_borrowed ON CD.CD_ID = CD_borrowed.CD_ID 
                     INNER JOIN borrower ON CD_borrowed.borrower_ID = borrower.borrower_ID 
                     
                   WHERE CD.status = 'borrowed' AND CD_borrowed.returned_date IS NULL
                   ORDER BY CD.title"></asp:SqlDataSource>
  <asp:SqlDataSource ID="SqldsBorrowed" runat="server"></asp:SqlDataSource>

    <%-- CD Status Table --%>
  <h2 class="text-center">CD Status</h2>
  <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSourceCDStatus" CssClass="table table-bordered table-striped">
    <HeaderTemplate>
      <span class="col-xs-3">Title</span>
      <span class="col-xs-1">Status</span>
      <span class="col-xs-2">Last Borrower</span>
      <span class="col-xs-2">Borrowed Date</span>
      <span class="col-xs-1">Borrowed</span>
    </HeaderTemplate>
    <ItemTemplate>
      <asp:Label Text='<%# Eval("[CD Title]") %>' runat="server" ID="CD_TitleLabel" class="col-xs-3" />
      <asp:Label Text='<%# Eval("Status") %>' runat="server" ID="StatusLabel" class="col-xs-1" />
      <asp:Label Text='<%# Eval("Borrower") %>' runat="server" ID="BorrowerLabel" class="col-xs-2" />
      <asp:Label Text='<%# Eval("[Borrowed Date]", "{0:d}") %>' runat="server" ID="Borrowed_DateLabel" class="col-xs-2" />
      <asp:Label Text='<%# Eval("[Times Borrowed]") %>' runat="server" ID="Times_BorrowedLabel" class="col-xs-1" />
      <br />
    </ItemTemplate>
    <HeaderStyle CssClass="thead-dark" />
  </asp:DataList>

  <%-- Borrower Table --%>
  <asp:SqlDataSource runat="server" ID="SqlDataSourceCDStatus" ConnectionString='<%$ ConnectionStrings:disk_inventoryConnectionString %>' SelectCommand="-- View library status (requires above function)
SELECT DISTINCT title AS 'CD Title', 
				release_year AS 'Year Released',
				status AS 'Status', 
				(SELECT dbo.BorrowerName(CD_borrowed.borrower_ID) 
				FROM CD_borrowed
				JOIN borrower ON CD_borrowed.borrower_ID = borrower.borrower_ID  
				WHERE CD.CD_ID = CD_borrowed.CD_ID) AS 'Borrower',
				(SELECT borrowed_date 
				FROM CD_borrowed
				JOIN borrower ON CD_borrowed.borrower_ID = borrower.borrower_ID  
				WHERE CD.CD_ID = CD_borrowed.CD_ID) AS 'Borrowed Date',
				(SELECT CD_borrowed.times_borrowed
				 FROM CD_borrowed
				WHERE CD.CD_ID = CD_borrowed.CD_ID) AS 'Times Borrowed'
FROM CD
LEFT JOIN CD_borrowed ON CD.CD_ID = CD_borrowed.CD_ID
ORDER BY title"></asp:SqlDataSource>
    <%-- Checkout Lists --%>
  <asp:DropDownList ID="DropDownList" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource1" DataTextField="title" 
                        DataValueField="cd_id" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>"
                        SelectCommand="SELECT [title], [cd_id] FROM [CD] WHERE ([status] = @status)" 
                        UpdateCommand="UPDATE [CD] SET [status] = @status">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="in library" Name="status" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="status" Type="String" />
                        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSource2" DataTextField="borrower" 
                        DataValueField="borrower_id" CssClass="form-control">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>"
                        SelectCommand="SELECT [borrower_id], first_name + ' ' + last_name AS 'Borrower' FROM borrower "
                        UpdateCommand="UPDATE CD_Borrowed set borrower_id = @borrower_id">
                        <UpdateParameters>
                            <asp:Parameter Name="Borrower" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
    <br />
    <asp:Button runat="server" CommandName="Update" Onclick="CheckoutButton_Click" Text="Checkout" ID="UpdateButton" CssClass="btn btn-primary" CausesValidation="False" />
</asp:Content>