using System;
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

public partial class _Default : System.Web.UI.Page 
{
    private string connectstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
    public void clrTxt()
    {
        txtUser.Text = string.Empty;
        txtPass.Text = string.Empty;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            txtUser.Focus();
    }
    protected void cmdLogin_Click(object sender, EventArgs e)
    {
        PublicFunction pf = new PublicFunction();
        
        if (txtPass.Text.Trim() != "" && txtUser.Text.Trim() != "")
        {
            string sql,getUsername, getId_user, getRole,getBlock;
            int row,role,id_user,block;
            SqlConnection con = new SqlConnection(connectstr);
            con.Open();
            //check account
            sql = string.Format(pf.login, txtUser.Text, txtPass.Text);
            SqlCommand cmd = new SqlCommand(sql, con);
            row = (int)cmd.ExecuteScalar();
            if (row > 0)
            {
                //Session name
                getUsername = string.Format(pf.getHoTen, txtUser.Text, txtPass.Text);
                SqlCommand cmd1 = new SqlCommand(getUsername, con);
                string txt = (string)cmd1.ExecuteScalar();
                Session["name"] = txt;
                //session id_user
                getId_user = string.Format(pf.getID, txtUser.Text, txtPass.Text);
                SqlCommand cmd2 = new SqlCommand(getId_user, con);
                id_user = (int)cmd2.ExecuteScalar();
                Session["id_user"] = id_user;
                //get role
                getRole = string.Format(pf.getRole, txtUser.Text, txtPass.Text);
                SqlCommand cmd3 = new SqlCommand(getRole, con);
                role = (int)cmd3.ExecuteScalar();
                Session["role"] = role;
                //check block
                getBlock = string.Format(pf.getBlock, txtUser.Text, txtPass.Text);
                SqlCommand cmd4 = new SqlCommand(getBlock, con);
                block = (int)cmd4.ExecuteScalar();
                Session["block"] = block;
                //Login home page

                if (Session["role"].ToString() == "3")
                {

                    //session login
                    string check = "true";
                    Session["check"] = check;
                    //admin
                        Response.Redirect("AdminHome.aspx");
                }
                else if (Session["role"].ToString() == "2" && Session["block"].ToString() == "0")
                {
                    
                    //session login
                    string check = "true";
                    Session["check"] = check;
                    //GiangVien
                    Response.Redirect("TeacherHome.aspx");
                }
                else if (Session["role"].ToString() == "1" && Session["block"].ToString() == "0")
                {
                    
                    //session login
                    string check = "true";
                    Session["check"] = check;
                    Response.Redirect("Home.aspx");
                }
                else Response.Redirect("Error.aspx");

            }
            else
            {
                Label4.Text = "Sai tài khoản / mật khẩu";
                clrTxt();
            }
            con.Close();
        }
        else
        {
            Label4.Text = "Vui lòng nhập tài khoản và mật khẩu";
            clrTxt();
        }
            
    }
    protected void cmdRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}
