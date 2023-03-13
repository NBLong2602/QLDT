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

public partial class MyCourse : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public void loadData()
    {
        if ((string)Session["check"] != "true")
            Response.Redirect("Default.aspx");
        else
        {
            //show Courses of user
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql = string.Format(pf.userCourse, Session["id_user"]);
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();
            //dropdownlist data
            SqlDataAdapter ad2 = new SqlDataAdapter(sql, con);
            DataTable tb2 = new DataTable();
            ad2.Fill(tb2);
            if (!IsPostBack)
            {
                DropDownList1.DataSource = tb2;
                DropDownList1.DataTextField = "TenMon";
                DropDownList1.DataValueField = "TenMon";
                DropDownList1.DataBind();
            }
            //show xu
            string getCoin = string.Format(pf.getXu, Session["id_user"]);
            SqlCommand cmd0 = new SqlCommand(getCoin, con);
            int totalCoin = (int)cmd0.ExecuteScalar();
            Session["totalCoin"] = totalCoin;
            Label8.Text = Session["totalCoin"].ToString();
            con.Close();
            RadioButtonList1.RepeatDirection = RepeatDirection.Horizontal;
        }
        Label1.Text = (string)Session["name"];
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadData();
    }
    protected void cmdMycourse_Click(object sender, EventArgs e)
    {
        loadData();
    }
    protected void cmdCourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void cmdBill_Click(object sender, EventArgs e)
    {
        Response.Redirect("BillCourse.aspx");
    }
    protected void cmdLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
    protected void linkDocument_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        string ac = string.Format(pf.getLink, Session["id_user"], DropDownList1.SelectedValue);
            SqlCommand cm = new SqlCommand(ac, con);
            string save = (string)cm.ExecuteScalar();
            string src = string.Format(@"{0}", save);
            Response.Redirect(src);
       
        /*
        try
        {
            string save = (string)cm.ExecuteScalar();
            string src = string.Format(@"{0}", save);
            Response.Redirect(src);
        }
        catch
        {
                Response.Redirect("Error.aspx");
        }
        */
        con.Close();
    }
    protected void cmdinfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentsInfo.aspx");
    }
    protected void cmdRate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(connectstr);
        con.Open();
        try
        {
            string sql0 = string.Format(@"select MaLop from DsachMonHoc where TenMon = '{0}'", DropDownList1.SelectedValue);
            SqlCommand cmd0 = new SqlCommand(sql0, con);
            string ML = (string)cmd0.ExecuteScalar();
            string sql = string.Format(@"update Lop set Rate = {0} where MaLop = '{1}'", RadioButtonList1.SelectedValue, ML);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            Label11.Text = "Cảm ơn bạn đã đánh giá khóa học " + RadioButtonList1.SelectedValue + " sao";
        }
        catch
        {
            Label11.Text = "Đánh giá lỗi, vui lòng chọn lại";
        }
    }
}
