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

public partial class ThongKe : System.Web.UI.Page
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
            string sql = string.Format(@"SELECT Lop.ID,DsachMonHoc.TenMon, HoaDon.ID_hdon, HoaDon.XuPaid, HoaDon.NgayLap
                                        FROM HoaDon, Lop, DsachMonHoc
                                        WHERE HoaDon.ID_hdon = Lop.ID_hdon and Lop.MaLop = DsachMonHoc.MaLop
                                        ORDER BY HoaDon.ID_hdon ASC");
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            Label8.Text = string.Empty;
            Label19.Text = string.Empty;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadDT();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
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
    protected void cmdSearch_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        try
        {
            if (Calendar1.SelectedDate.ToShortDateString() != "1/1/0001" && Calendar2.SelectedDate.ToShortDateString() != "1/1/0001")
            {
            
                string sql = string.Format(@"SELECT Lop.ID,DsachMonHoc.TenMon, HoaDon.ID_hdon, HoaDon.XuPaid, HoaDon.NgayLap 
                                            FROM HoaDon, Lop, DsachMonHoc 
                                            WHERE HoaDon.ID_hdon = Lop.ID_hdon and Lop.MaLop = DsachMonHoc.MaLop");
                string dk = " 1 = 1 ";
                string sort = " order by HoaDon.ID_hdon ASC";
                string date1 = Calendar1.SelectedDate.ToShortDateString();
                    dk = dk + string.Format(@" and NgayLap >= #{0}#", date1);
                string date2 = Calendar2.SelectedDate.ToShortDateString();
                    dk = dk + string.Format(@" and NgayLap <= #{0}#", date2);
                sql = sql + " and " + dk + sort;
                SqlDataAdapter ad = new SqlDataAdapter(sql,con);
                DataTable tb = new DataTable();
                ad.Fill(tb);
                GridView1.DataSource = tb;
                GridView1.DataBind();
                //tinh xu 
                string sql_xu = string.Format(@"select sum(HoaDon.XuPaid) from HoaDon where HoaDon.NgayLap >= #{0}# and HoaDon.NgayLap <= #{1}#",date1,date2);
                SqlCommand cmd = new SqlCommand(sql_xu,con);
                string Xu = cmd.ExecuteScalar().ToString();
                Label19.Text = " Tổng Xu từ " + date1 + " đến " + date2 + " là " + Xu + " Xu"; 
                Label8.Text = "Danh sách hóa đơn từ " + date1 + " đến " + date2;
            }
        } catch
            {
            Label8.Text = "Giá trị không hợp lệ / Không có bản ghi";
            }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("DSLH.aspx");
    }
    protected void cmdSearchMD_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        string sql = string.Format(@"SELECT Lop.ID,DsachMonHoc.TenMon, HoaDon.ID_hdon, HoaDon.XuPaid, HoaDon.NgayLap
                                        FROM HoaDon, Lop, DsachMonHoc
                                        WHERE HoaDon.ID_hdon = Lop.ID_hdon and Lop.MaLop = DsachMonHoc.MaLop and HoaDon.ID_hdon like '%{0}'
                                        ORDER BY HoaDon.ID_hdon ASC",TextBox1.Text);
        SqlDataAdapter ad = new SqlDataAdapter(sql, con);
        DataTable tb = new DataTable();
        ad.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
    }
}
