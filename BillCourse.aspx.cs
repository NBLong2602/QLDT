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

public partial class BillCourse : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public void loadData()
    {
        if ((string)Session["check"] != "true")
            Response.Redirect("Default.aspx");
        else
        {
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            string sql = string.Format(pf.showBill, Session["id_user"]);
            SqlDataAdapter ad = new SqlDataAdapter(sql, con);
            DataTable tb = new DataTable();
            ad.Fill(tb);
            GridView1.DataSource = tb;
            GridView1.DataBind();

            //show Xu
            string getCoin = string.Format(pf.getXu, Session["id_user"]);
            SqlCommand cmd0 = new SqlCommand(getCoin, con);
            int totalCoin = (int)cmd0.ExecuteScalar();
            Session["totalCoin"] = totalCoin;
            Label8.Text = Session["totalCoin"].ToString();
            con.Close();
        }
        Label1.Text = (string)Session["name"];
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadData();
    }
    protected void cmdLogout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
    protected void cmdCourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void cmdBill_Click(object sender, EventArgs e)
    {
        Response.Redirect("BillCourse.aspx");
    }
    protected void cmdMycourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("Mycourse.aspx");
        
    }
    protected void cmdinfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentsInfo.aspx");
    }
}
