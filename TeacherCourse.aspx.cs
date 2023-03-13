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

public partial class TeacherCourse : System.Web.UI.Page
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
            string sql = string.Format(@"SELECT MaLop,TenMon,Xu,Link from DsachMonHoc where id_GV = {0}", Session["id_user"]);
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            if (!IsPostBack)
            {
                DropDownList1.DataSource = tb;
                DropDownList1.DataTextField = "TenMon";
                DropDownList1.DataValueField = "TenMon";
                DropDownList1.DataBind();
            }
            con.Close();
            lblKQ.Text = "Click để sửa";
        }
    }
    public void clearTXT()
    {
        txtLink.Text = string.Empty;
        TextBox1.Text = string.Empty;
        TextBox2.Text = string.Empty;
        TextBox3.Text = string.Empty;
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
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("TeacherInfo.aspx");
    }
    protected void cmdUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        try
        {
            if (txtLink.Text.Trim() != "")
            {
                string sql = string.Format(@"update DsachMonHoc set Link = '{0}' where TenMon = '{1}'", txtLink.Text, DropDownList1.SelectedValue);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                lblKQ.Text = "Sửa Thành Công";
                
            }
            if (TextBox1.Text.Trim() != "")
            {
                string sql = string.Format(@"update DsachMonHoc set MaLop = '{0}' where TenMon = '{1}'", TextBox1.Text, DropDownList1.SelectedValue);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                lblKQ.Text = "Sửa Thành Công";
               
            }
            if (TextBox2.Text.Trim() != "")
            {
                string sql = string.Format(@"update DsachMonHoc set TenMon = '{0}' where TenMon = '{1}'", TextBox2.Text, DropDownList1.SelectedValue);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                lblKQ.Text = "Sửa Thành Công";
               
            }
            if (TextBox3.Text.Trim() != "")
            {
                string sql = string.Format(@"update DsachMonHoc set Xu = {0} where TenMon = '{1}'", TextBox3.Text, DropDownList1.SelectedValue);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                lblKQ.Text = "Sửa Thành Công";
                
            }
            clearTXT();
            con.Close();
        }
        catch
        {
            lblKQ.Text = "Sửa Thất Bại / Trùng Dữ Liệu";
        }
        
        

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Teacher_Feedback.aspx");
    }
    protected void cmdcmdAdd_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "" && TextBox3.Text.Trim() != "" && txtLink.Text.Trim() != "")
        {
            try
            {
                string sql = string.Format(@"insert into DsachMonHoc(MaLop,TenMon,id_GV,Xu,Link) values('{0}','{1}',{2},{3},'{4}')", TextBox1.Text, TextBox2.Text, Session["id_user"], TextBox3.Text, txtLink.Text);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.ExecuteNonQuery();
                lblKQ.Text = "Them Thanh Cong";
            }
            catch
            {
                lblKQ.Text = "Trùng Mã Lớp / Tên Môn Học";
            }
            clearTXT();
        }
    }
}
