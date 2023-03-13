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

public partial class SU : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public void loadData()
    {
        try
        {
            if ((string)Session["check"] != "true" && Session["role"].ToString() != "3")
                Response.Redirect("Default.aspx");
            else
            {
                lblAD.Text = (string)Session["name"];
                lblID.Text = Session["id_user"].ToString();
            }
        }
        catch
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadData();
    }
    protected void cmdADD_Click(object sender, EventArgs e)
    {
        //signup
        if (RadioButton1.Checked == true && RadioButton2.Checked == false)
        {
            if (txtPass.Text.Trim() != "" && txtRole.Text.Trim() != "" && txtTenDN.Text.Trim() != "")
                    {
                        if (txtRole.Text == "2" || txtRole.Text == "1")
                        {
                    SqlConnection con = new SqlConnection(connectstr);
                    con.Open();
                    try
                            {
                                int role, ID_user;
                                string sql = string.Format(@"insert into TaiKhoan(Role,TenDN,Pass,HoTen) values({0},'{1}','{2}','{3}')", txtRole.Text, txtTenDN.Text, txtPass.Text, txtTenDN.Text);
                                SqlCommand cmd = new SqlCommand(sql, con);
                                cmd.ExecuteNonQuery();

                                if (txtRole.Text == "1")
                                {
                                    string sql2 = string.Format(pf.getID, txtTenDN.Text, txtPass.Text);
                                    SqlCommand cmd2 = new SqlCommand(sql2, con);
                                    ID_user = (int)cmd2.ExecuteScalar();
                                    string sql3 = string.Format(@"insert into HocVien(ID) values({0})", ID_user);
                                    SqlCommand cmd1 = new SqlCommand(sql3, con);
                                    cmd1.ExecuteNonQuery();
                                }
                                else if (txtRole.Text == "2")
                                {
                                    string sql4 = string.Format(pf.getID, txtTenDN.Text, txtPass.Text);
                                    SqlCommand cmd4 = new SqlCommand(sql4, con);
                                    ID_user = (int)cmd4.ExecuteScalar();
                                    string sql5 = string.Format(@"insert into GiangVien(ID) values({0})", ID_user);
                                    SqlCommand cmd3 = new SqlCommand(sql5, con);
                                    cmd3.ExecuteNonQuery();
                                }
                                Label8.Text = "Them Thành Công";
                            }
                            catch
                            {
                                Label8.Text = "Tài Khoản Đã Tồn Tại";
                            }
                        }
                        else Label8.Text = "Nhập sai dữ liệu";
                    }
                    else Label8.Text = "Nhập thiếu dữ liệu";
        }
        //change pass
        else if (RadioButton1.Checked == false && RadioButton2.Checked == true)
        {
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            if (txtTenDN.Text.Trim() != "" && txtPass.Text.Trim() != "")
            {
                    string sql1 = string.Format(@"update TaiKhoan set Pass = '{0}' where TenDN = '{1}'",txtPass.Text,txtTenDN.Text);
                    SqlCommand cmd = new SqlCommand(sql1, con);
                    cmd.ExecuteNonQuery();
                    Label8.Text = "Đổi Pass Thành Công";
            }
            else Label8.Text = "Nhập Thiếu Dữ Liệu";

        }
        else Label8.Text = "Chọn 1 chức năng bạn muốn thực hiện";
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
    protected void Button6_Click(object sender, EventArgs e)
    {
        if (txtTenDN_del.Text.Trim() != "")
        {
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql = string.Format(@"delete from TaiKhoan where TenDN ='{0}'", txtTenDN_del.Text);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            Label8.Text = "Xóa Thành Công";
        }
        else Label8.Text = "Nhập thiếu dữ liệu / Tên DN không tồn tại";
    }
    protected void cmdBlock_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        string sql = string.Format(@"update TaiKhoan set Block = 1 where TenDN = '{0}'", txtTenDN_del.Text);
        SqlCommand cmd = new SqlCommand(sql,con);
        cmd.ExecuteNonQuery();
        Label15.Text = "Chặn thành công";
        con.Close();
    }
    protected void cmdDissBlock_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        string sql = string.Format(@"update TaiKhoan set Block = 0  where TenDN = '{0}'", txtTenDN_del.Text);
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.ExecuteNonQuery();
        Label15.Text = "Mở thành công";
        con.Close();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("DSLH.aspx");
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("ThongKe.aspx");
    }
}
