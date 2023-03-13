using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class StudentsInfo : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public void loadData()
    {
        if ((string)Session["check"] != "true")
            Response.Redirect("Default.aspx");
        else
        {
            Label8.Text = Session["totalCoin"].ToString();
            Label1.Text = (string)Session["name"];
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql = string.Format(@"SELECT * from TaiKhoan where TaiKhoan.ID = {0}", Session["id_user"]);
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            con.Close();
        }
        Label17.Text = String.Empty;
        Label18.Text = String.Empty;
    }
    public void clearTXT()
    {
        txtSex.Text = string.Empty;
        txtSDT.Text = string.Empty;
        txtQueQuan.Text = string.Empty;
        txtHoTen.Text = string.Empty;
        txtGmail.Text = string.Empty;
        txtNgaySinh.Text = string.Empty;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadData();
    }
    protected void cmdCourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
protected void  cmdMycourse_Click(object sender, EventArgs e)
{
    Response.Redirect("MyCourse.aspx");
}
protected void  cmdBill_Click(object sender, EventArgs e)
{
    Response.Redirect("BillCourse.aspx");
}
protected void cmdLogout_Click(object sender, EventArgs e)
{
    Session.RemoveAll();
    Response.Redirect("Default.aspx");
}
protected void cmdUpdate_Click(object sender, EventArgs e)
{
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        try
    {
        if (txtQueQuan.Text.Trim() != "")
        {
            string sql = string.Format(@"update TaiKhoan set QueQuan = '{0}' where ID = {1}", txtQueQuan.Text, Session["id_user"].ToString());
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            
        }
        if (txtHoTen.Text.Trim() != "")
        {
            string sql = string.Format(@"update TaiKhoan set HoTen = '{0}' where ID = {1}", txtHoTen.Text, Session["id_user"]);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            
        }
        if (txtSDT.Text.Trim() != "")
        {
            string sql = string.Format(@"update TaiKhoan set SDT = '{0}' where ID = {1}", txtSDT.Text, Session["id_user"]);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            
        }
        if (txtGmail.Text.Trim() != "")
        {
            string sql = string.Format(@"update TaiKhoan set Gmail = '{0}' where ID = {1}", txtGmail.Text, Session["id_user"]);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            
        }
        if (txtSex.Text.Trim() != "")
        {
            string sql = string.Format(@"update TaiKhoan set GioiTinh = '{0}' where ID = {1}", txtSex.Text, Session["id_user"]);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            
        }
        if (txtNgaySinh.Text.Trim() != "")
        {
            string sql = string.Format(@"update TaiKhoan set NgaySinh= '{0}' where ID = {1}", txtNgaySinh.Text, Session["id_user"]);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            
        }
        Label18.Text = "Cap Nhat Thanh Cong";
    }
    catch
    {
        Label18.Text = "Cap Nhat That Bai";
    }
    clearTXT();
    con.Close();
    
}
protected void cmdinfo_Click(object sender, EventArgs e)
{
    Response.Redirect("StudentsInfo.aspx");
}
protected void Button1_Click(object sender, EventArgs e)
{
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        if (txtPass.Text.Trim() != "")
    {
        string sql = string.Format(@"update TaiKhoan set Pass = '{0}' where ID = {1}", txtPass.Text, Session["id_user"]);
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
        Label17.Text = "Doi mat khau thanh cong";
    }
    else Label17.Text = "Doi mat khau that bai";
    con.Close();
}
}
