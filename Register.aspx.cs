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

public partial class Register : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label9.Text = "Nhấn 'Tạo' để lập tài khoản";
    }
    protected void cmdAdd_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && TextBox2.Text != "")
        {
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            try
            {
                //creat taikhoan
                int ID_user;
                string sql = string.Format(@"insert into TaiKhoan(Role,TenDN,Pass,HoTen) values(1,'{0}','{1}','{2}')", TextBox1.Text, TextBox2.Text, TextBox1.Text);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                //add hocvien
                string sql2 = string.Format(pf.getID, TextBox1.Text, TextBox2.Text);
                SqlCommand cmd2 = new SqlCommand(sql2, con);
                ID_user = (int)cmd2.ExecuteScalar();
                string sql3 = string.Format(@"insert into HocVien(ID) values({0})", ID_user);
                SqlCommand cmd1 = new SqlCommand(sql3, con);
                cmd1.ExecuteNonQuery();
                Label9.Text = "Đăng kí thành công";
            }
            catch
            {
                Label9.Text = "Đăng kí thất bại / Trùng Tên Đăng Nhập";
            }
        }
        else
        {
            Label9.Text = "Nhập thiêu dữ liệu";
            TextBox1.Text = String.Empty;
            TextBox2.Text = String.Empty;
        }
                
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
