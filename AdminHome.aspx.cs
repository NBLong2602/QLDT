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

public partial class AdminHome : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public void loadHV()
    {
        if ((string)Session["check"] != "true")
            Response.Redirect("Default.aspx");
        else
        {
            lblAD.Text = (string)Session["name"];
            lblID.Text = Session["id_user"].ToString();
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            //OleDbConnection con = new OleDbConnection();
            //con.ConnectionString = pf.connectDB;
            //con.Open();
            string sql = string.Format(@"SELECT TaiKhoan.ID, TaiKhoan.TenDN, TaiKhoan.Pass, TaiKhoan.SDT, HocVien.Xu,TaiKhoan.Gmail,TaiKhoan.HoTen
                                        FROM TaiKhoan INNER JOIN HocVien ON TaiKhoan.ID = HocVien.ID
                                        ORDER BY TaiKhoan.ID ASC;
                                        ");
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            con.Close();
        }
        Label8.Text = "Click để cập nhật Coin ";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadHV();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        loadHV();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("QLGV.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("QLKH.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("SU.aspx");
    }
    protected void cmdUpXu_Click(object sender, EventArgs e)
    {
        if (id.Text.Trim() != "" && xu.Text.Trim() != "")
        {
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string check_hv = string.Format(@"select count(*) from HocVien where ID = {0}",id.Text);
            SqlCommand cmd0 = new SqlCommand(check_hv,con);
            int row = (int)cmd0.ExecuteScalar();
            if (row > 0)
            {
                string sql = string.Format(@"update HocVien set Xu = {0} where HocVien.ID = {1}", xu.Text, id.Text);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                Label8.Text = "Cập nhật thành công";
            } else Label8.Text = "ID không khả dụng";
            id.Text = string.Empty;
            xu.Text = string.Empty;
        } else Label8.Text = "Cập nhật thất bại";
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
        string sql = string.Format(@"SELECT TaiKhoan.ID, TaiKhoan.TenDN, TaiKhoan.Pass, TaiKhoan.SDT, HocVien.Xu,TaiKhoan.Gmail,TaiKhoan.HoTen
                                        FROM TaiKhoan, HocVien 
                                        WHERE TaiKhoan.ID = HocVien.ID and TaiKhoan.TenDN like '%{0}%'
                                        ORDER BY  TaiKhoan.ID ASC;
                                        ",TextBox1.Text);
        SqlDataAdapter ad = new SqlDataAdapter(sql, con);
        DataTable tb = new DataTable();
        ad.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
    }
}
