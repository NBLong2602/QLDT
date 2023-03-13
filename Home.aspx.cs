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

public partial class Home : System.Web.UI.Page
{
    PublicFunction pf = new PublicFunction();
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public void loadPage()
    {
        int totalCoin;
        if ((string)Session["check"] != "true")
            Response.Redirect("Default.aspx");
        else
        {
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            //gridview DsachMonHoc
            SqlDataAdapter ad = new SqlDataAdapter(pf.getDSMH, con);
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
            //show Xu
            string getCoin = string.Format(pf.getXu, Session["id_user"]);
            SqlCommand cmd0 = new SqlCommand(getCoin, con);
            totalCoin = (int)cmd0.ExecuteScalar();
            Session["totalCoin"] = totalCoin;
            Label8.Text = Session["totalCoin"].ToString();
            con.Close();
        }
        Label1.Text = (string)Session["name"];
        Label6.Text = "Chọn Khóa Học Bạn Muốn Đăng Ký";

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        loadPage();
    }
    protected void cmdMycourse_Click(object sender, EventArgs e)
    {
        Response.Redirect("MyCourse.aspx");
    }
    protected void cmdCourse_Click(object sender, EventArgs e)
    {
        loadPage();
    }
    protected void cmdAddcourse_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.Open();
        //convert tenMon -> MaLop
        string sql2 = string.Format(pf.getMaLop, DropDownList1.SelectedValue);
        SqlCommand cmd2 = new SqlCommand(sql2, con);
        string ml = (string)cmd2.ExecuteScalar();
        //check course registed
        string sql5 = string.Format(pf.checkCourse, Session["id_user"], ml);
        SqlCommand cmd5 = new SqlCommand(sql5, con);
        int check = (int)cmd5.ExecuteScalar();
        if (check == 0)
        {//creat and add bill
            //check xu cua khoa hoc DANG dang ki
            string sql = string.Format(pf.XuCourse, DropDownList1.SelectedValue);
            SqlCommand cmd = new SqlCommand(sql, con);
            int purchaseCash = (int)cmd.ExecuteScalar();
            //Xu of user
            string getCoin = string.Format(pf.getXu, Session["id_user"]);
            SqlCommand cmd8 = new SqlCommand(getCoin, con);
            int totalCash = (int)cmd8.ExecuteScalar();
            int cash = totalCash - purchaseCash;
            if (cash >= 0)
            {
                //creat bill
                string sql1 = string.Format(pf.creatBill, purchaseCash);
                SqlCommand cmd1 = new SqlCommand(sql1, con);
                cmd1.ExecuteNonQuery();
                //get id_bill
                string sql4 = string.Format(pf.getID_bill);
                SqlCommand cmd4 = new SqlCommand(sql4, con);
                int id_bill = (int)cmd4.ExecuteScalar();
                // add register course 
                string sql3 = string.Format(pf.addCourse, Session["id_user"], ml, id_bill);
                SqlCommand cmd3 = new SqlCommand(sql3, con);
                cmd3.ExecuteNonQuery();
                Label6.Text = "Đăng kí thành công, nhấn F5 để load lại Coin";
                //Refresh Xu
                string sql7 = string.Format(pf.updateXu, cash, Session["id_user"]);
                SqlCommand cmd7 = new SqlCommand(sql7, con);
                cmd7.ExecuteNonQuery();
            }
            else Label6.Text = "Không đủ Coin để thanh toán";
        }
        else Label6.Text = "Bạn Đã Đăng Ký Môn Học Này";
        con.Close();
    }
    protected void cmdLogout_Click(object sender, EventArgs e)
    {
        //Not work when clicked event cmdAddcourse 
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
    protected void cmdBill_Click(object sender, EventArgs e)
    {
        Response.Redirect("BillCourse.aspx");
    }
    protected void cmdinfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentsInfo.aspx");
    }
}
