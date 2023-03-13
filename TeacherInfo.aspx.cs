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

public partial class TeacherInfo : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public void loadData()
    {
        if ((string)Session["check"] != "true")
            Response.Redirect("Default.aspx");
        else
        {
            lblGV.Text = (string)Session["name"];
            lblID.Text = Session["id_user"].ToString();
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql = string.Format(@"SELECT HoTen,NgaySinh,Rank,GioiTinh,SDT,Gmail,QueQuan from GiangVien,TaiKhoan where TaiKhoan.ID = GiangVien.ID and GiangVien.ID = {0}", Session["id_user"]);
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            con.Close();
        }
    }
    public void clearTXT()
    {
        txtSex.Text = string.Empty;
        txtSDT.Text = string.Empty;
        txtRank.Text = string.Empty;
        txtQueQuan.Text = string.Empty;
        txtHoTen.Text = string.Empty;
        txtGmail.Text = string.Empty;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadData();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("TeacherHome.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("TeacherCourse.aspx");
    }
    protected void cmdUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
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
        if (txtRank.Text.Trim() != "")
        {
            string sql = string.Format(@"update GiangVien set Rank = '{0}' where ID = {1}", txtRank.Text, Session["id_user"]);
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
            string sql = string.Format(@"update TaiKhoan set Sex = '{0}' where ID = {1}", txtSex.Text, Session["id_user"]);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
        }
        con.Close();
        clearTXT();
        loadData();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher_Feedback.aspx");
    }
}
