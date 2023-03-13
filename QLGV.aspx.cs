using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class QLGV : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public void loadGV()
    {
        if ((string)Session["check"] != "true")
            Response.Redirect("Default.aspx");
        else
        {
            lblAD.Text = (string)Session["name"];
            lblID.Text = Session["id_user"].ToString();
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql = string.Format(@"SELECT TaiKhoan.ID, TaiKhoan.TenDN, TaiKhoan.Pass, TaiKhoan.HoTen, TaiKhoan.SDT, GiangVien.Luong, GiangVien.Rank
                                        FROM TaiKhoan INNER JOIN GiangVien ON TaiKhoan.ID = GiangVien.ID
                                        ORDER BY TaiKhoan.ID ASC;
                                        ");
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            con.Close();
        }
        Label8.Text = "Click de cap nhat Luong";

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadGV();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHome.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("QLKH.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("SU.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {

        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("QLGV.aspx");
    }
    protected void cmdUpLuong_Click(object sender, EventArgs e)
    {
        if (id.Text.Trim() != "" && luong.Text.Trim() != "")
        {

            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string check_gv = string.Format(@"select count(*) from GiangVien where ID = {0}",id.Text);
            SqlCommand cmd0 = new SqlCommand(check_gv,con);
            int row = (int)cmd0.ExecuteScalar();
            if (row > 0)
            {
                string sql = string.Format(@"update GiangVien set Luong = {0} where GiangVien.ID = {1}", luong.Text, id.Text);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                Label8.Text = "Cập nhật thành công";
            }
            else Label8.Text = "ID không tồn tại";
        } 
        else Label8.Text = "Cập nhật thất bại";
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("DSLH.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("ThongKe.aspx");
    }
    protected void cmdSearch_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        string sql = string.Format(@"SELECT TaiKhoan.ID, TaiKhoan.TenDN, TaiKhoan.Pass, TaiKhoan.HoTen, TaiKhoan.SDT, GiangVien.Luong, GiangVien.Rank
                                        FROM TaiKhoan, GiangVien WHERE TaiKhoan.ID = GiangVien.ID and TaiKhoan.TenDN like '%{0}%'
                                        ORDER BY TaiKhoan.ID ASC;
                                        ", TextBox1.Text);
        SqlDataAdapter ad = new SqlDataAdapter(sql, con);
        DataTable tb = new DataTable();
        ad.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
    }
}
