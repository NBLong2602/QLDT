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

public partial class Teacher_Feedback : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;

    public void loadDT()
    {
        if ((string)Session["check"] != "true")
            Response.Redirect("Default.aspx");
        else
        {
            lblGV.Text = (string)Session["name"];
            lblID.Text = Session["id_user"].ToString();
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql = string.Format(@"SELECT *from DsachMonHoc where id_GV = {0}", Session["id_user"]);
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            if (!IsPostBack)
            {
                DropDownList1.DataSource = tb;
                DropDownList1.DataTextField = "TenMon";
                DropDownList1.DataValueField = "TenMon";
                DropDownList1.DataBind();
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
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        string sql = string.Format(@"SELECT DsachMonHoc.MaLop, DsachMonHoc.TenMon, Lop.Rate, Lop.ID
FROM GiangVien, DsachMonHoc, Lop 
where DsachMonHoc.MaLop = Lop.MaLop and DsachMonHoc.id_GV = Giangvien.ID and Giangvien.ID = {0} and DsachMonHoc.TenMon = '{1}'", Session["id_user"], DropDownList1.SelectedValue);
        SqlDataAdapter ad = new SqlDataAdapter(sql,con);
        DataTable tb = new DataTable();
        ad.Fill(tb);
        GridView1.DataSource = tb;
        GridView1.DataBind();
    }
    protected void cmdLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("TeacherHome.aspx");
    }
    protected void cmdMycourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("TeacherCourse.aspx");
    }
    protected void cmdCRUD_Click(object sender, EventArgs e)
    {
        Response.Redirect("TeacherInfo.aspx");
    }
}
