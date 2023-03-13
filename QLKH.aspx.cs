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

public partial class QLKH : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

    public void loadCourse()
    {
        if ((string)Session["check"] != "true")
            Response.Redirect("Default.aspx");
        else
        {
            lblAD.Text = (string)Session["name"];
            lblID.Text = Session["id_user"].ToString();
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql = string.Format(@"SELECT DsachMonHoc.MaLop, DsachMonHoc.TenMon,TaiKhoan.HoTen, DsachMonHoc.Xu,DsachMonHoc.Link
                                FROM DsachMonHoc,TaiKhoan
                                WHERE  DsachMonHoc.id_GV =  TaiKhoan.ID");
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            string sql1 = string.Format(@"select TaiKhoan.HoTen
from TaiKhoan, GiangVien
where TaiKhoan.ID = GiangVien.ID");
            SqlDataAdapter ad1 = new SqlDataAdapter(sql1, con);
            DataTable tb1 = new DataTable();
            ad1.Fill(tb1);
            string sql2 = string.Format(@"select TenMon
from DsachMonHoc");
            SqlDataAdapter ad2 = new SqlDataAdapter(sql2, con);
            DataTable tb2 = new DataTable();
            ad2.Fill(tb2);
            if (!IsPostBack)
            {
                DropDownList1.DataSource = tb1;
                DropDownList1.DataTextField = "HoTen";
                DropDownList1.DataValueField = "HoTen";
                DropDownList1.DataBind();
                DropDownList2.DataSource = tb2;
                DropDownList2.DataTextField = "TenMon";
                DropDownList2.DataValueField = "TenMon";
                DropDownList2.DataBind();
                DropDownList3.DataSource = tb1;
                DropDownList3.DataTextField = "HoTen";
                DropDownList3.DataValueField = "HoTen";
                DropDownList3.DataBind();
            }

            //
            con.Close();
            Label6.Text = "Click 'Them' de tao mon hoc";
            Label11.Text = "";
            Label16.Text = "";

        }

    }
    public void clearTXT()
    {
        txtMaLop.Text = String.Empty;
        txtML_up.Text = String.Empty;
        txtTenMon.Text = String.Empty;
        txtTM_del.Text = String.Empty;
        txtTM_up.Text = String.Empty;
        txtXu.Text = String.Empty;
        txtXu_up.Text = String.Empty;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadCourse();
     
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
    protected void cmdAdd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        if (txtTenMon.Text.Trim() != "" && txtMaLop.Text.Trim() != "" && txtXu.Text.Trim() != "")
        {
            string sql0 = string.Format(@"SELECT GiangVien.ID
                                        FROM TaiKhoan, GiangVien 
                                        where TaiKhoan.ID = GiangVien.ID and TaiKhoan.HoTen = '{0}'
                                        ", DropDownList1.SelectedValue);
            SqlCommand cmd0 = new SqlCommand(sql0, con);
            int id_gv = (int)cmd0.ExecuteScalar();
            try
            {
                string sql = string.Format(@"insert into DsachMonHoc(MaLop,TenMon,id_GV,Xu) values('{0}','{1}',{2},{3})", txtMaLop.Text, txtTenMon.Text, id_gv, txtXu.Text);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                Label6.Text = "Them Thanh Cong";
            }
            catch
            {
                Label6.Text = "Trùng Mã Lớp / Tên Môn Học";
            }
            clearTXT();
            
        }
        else
        {
            Label6.Text = "Nhap Thieu Gia Tri";
        }
        con.Close();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("SU.aspx");
    }
    protected void cmdDel_Click(object sender, EventArgs e)
    {
        if (txtTM_del.Text.Trim() != "")
        {
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql = string.Format(@"delete from DsachMonHoc where TenMon = '{0}'", txtTM_del.Text);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            Label11.Text = "Xoa Thanh Cong";
            clearTXT();
        }
        else Label11.Text = "Nhap Thieu Gia Tri";
    }
    protected void cmdUpdate_Click(object sender, EventArgs e)
    {
        if (txtXu_up.Text.Trim() != "" && txtTM_up.Text.Trim() != "" && txtML_up.Text.Trim() != "")
        {
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql2 = string.Format(@"SELECT GiangVien.ID
                                        FROM TaiKhoan, GiangVien 
                                        where TaiKhoan.ID = GiangVien.ID and TaiKhoan.HoTen = '{0}'
                                        ", DropDownList3.SelectedValue);
            SqlCommand cmd2 = new SqlCommand(sql2, con);
            int id_gv = (int)cmd2.ExecuteScalar();
            try
            {
                string sql = string.Format(@"update DsachMonHoc set MaLop = '{0}',TenMon = '{1}',id_GV = {2},Xu = {3} where TenMon = '{4}'", txtML_up.Text, txtTM_up.Text, id_gv, txtXu_up.Text, DropDownList2.SelectedValue);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                Label16.Text = "Sua Thanh Cong";
            }
            catch(Exception ex)
            {
                Label16.Text = "Sua That Bai";
            }
            con.Close();
            clearTXT();
        }
        else Label16.Text = "Thieu du lieu";
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
        string sql = string.Format(@"SELECT DsachMonHoc.MaLop, DsachMonHoc.TenMon,TaiKhoan.HoTen, DsachMonHoc.Xu,DsachMonHoc.Link
                                FROM DsachMonHoc,TaiKhoan
                                WHERE  DsachMonHoc.id_GV =  TaiKhoan.ID and DsachMonHoc.TenMon like '%{0}%'",TextBox1.Text);
        SqlDataAdapter ad = new SqlDataAdapter(sql, con);
        DataTable tb = new DataTable();
        ad.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
    }
}
