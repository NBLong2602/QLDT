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

public partial class DSLH : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public void loadDT()
    {
        if ((string)Session["check"] != "true")
            Response.Redirect("Default.aspx");
        else
        {
            lblAD.Text = (string)Session["name"];
            lblID.Text = Session["id_user"].ToString();
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql = string.Format(@"SELECT COUNT(Lop.MaLop) AS TOTAL, DsachMonHoc.MaLop,DsachMonHoc.TenMon
FROM Lop, DsachMonHoc
Where Lop.MaLop = DsachMonHoc.MaLop
GROUP BY DsachMonHoc.TenMon, DsachMonHoc.MaLop
ORDER BY COUNT(Lop.MaLop) DESC");
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            GridView2.Visible = true;
            GridView1.Visible = false;
            GridView2.DataSource = tb;
            GridView2.DataBind();
            string sql_1 = string.Format(@"SELECT count(*) from HocVien ");
            SqlCommand cmd = new SqlCommand(sql_1, con);
            string hv = cmd.ExecuteScalar().ToString();
            Label19.Text = "Số Học Viên Trên Hệ Thống : " + hv + " user";
            
            if (!IsPostBack)
            {
                ddlTenMon.DataSource = tb;
                ddlTenMon.DataTextField = "TenMon";
                ddlTenMon.DataValueField = "TenMon";
                ddlTenMon.DataBind();
            }
            con.Close();
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadDT();
    }
    protected void cmdSearch_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = pf.connectDB;
        con.Open();
        string sql = string.Format(pf.userOFcousre_2, ddlTenMon.SelectedValue);
        SqlDataAdapter ad = new SqlDataAdapter(sql, con);
        DataTable tb = new DataTable();
        ad.Fill(tb);
        GridView2.Visible = false;
        GridView1.Visible = true;
        GridView1.DataSource = tb;
        GridView1.DataBind();
        con.Close();
        Label19.Text = "Danh Sách Học Viên Môn " + ddlTenMon.SelectedValue;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHome.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("QLGV.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("QLKH.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("SU.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("ThongKe.aspx");
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        loadDT();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
}
