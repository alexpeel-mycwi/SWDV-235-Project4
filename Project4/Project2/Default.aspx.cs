using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CheckoutButton_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=SRVF1804A\SQLDEV01;Initial Catalog=disk_inventory;Persist Security Info=True;User ID=sa;Password=Pa$$w0rd");
        SqlCommand cmd = new SqlCommand("update CD set status = @status Where CD_ID = @CD_ID", con);
        cmd.Parameters.AddWithValue("status", "Borrowed");
        cmd.Parameters.AddWithValue("cd_id", DropDownList.SelectedItem.Value);
        SqlCommand cmd1 = new SqlCommand("update CD_Borrowed set borrower_id = @borrower_id Where borrower_id = @borrower_id", con);
        cmd.Parameters.AddWithValue("borrower_id", DropDownList.SelectedItem.Value);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
    }
}