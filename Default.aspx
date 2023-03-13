<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cheetah Academy</title>
    <style type="text/css">
        .bgr_login
        {
        	background-image: url("https://oes.vn/wp-content/uploads/2020/12/khoa-hoc-4-1.jpg");
        	
        }
        .style1
        {
            width: 100%;
            height: 749px;
        }
        .style2
        {
            width: 701px;
        }
        .style3
        {
            height: 122px;
        }
        .style4
        {
            width: 701px;
            height: 122px;
        }
        .style5
        {
            height: 47px;
        }
        .style6
        {
            width: 701px;
            height: 47px;
        }
        .style7
        {
            height: 183px;
        }
        .style8
        {
            width: 701px;
            height: 183px;
        }
        .style9
        {
            height: 183px;
            width: 434px;
        }
        .style10
        {
            height: 47px;
            width: 434px;
        }
        .style11
        {
            height: 122px;
            width: 434px;
        }
        .style12
        {
            width: 434px;
        }
        .style13
        {
            height: 162px;
            width: 434px;
        }
        .style14
        {
            width: 701px;
            height: 162px;
        }
        .style15
        {
            height: 162px;
        }
    </style>
</head>
<body>
   <div class="bgr_login">
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style9">
            </td>
            <td class="style8">
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    Text="ĐĂNG NHẬP TÀI KHOẢN"></asp:Label>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="style7">
            </td>
        </tr>
        <tr>
            <td class="style10">
            </td>
            <td class="style6">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Tài Khoản" BackColor="Yellow" 
                    BorderColor="#99CCFF" BorderStyle="Solid" BorderWidth="3px" 
                    Font-Bold="True" Width="105px"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtUser" runat="server" Height="30px" Width="230px"></asp:TextBox>
            </td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td class="style11">
            </td>
            <td class="style4">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text="Mật Khẩu" BackColor="Yellow" 
                    BorderColor="#99CCFF" BorderStyle="Solid" BorderWidth="3px" 
                    Font-Bold="True" Width="105px"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPass" runat="server" Height="30px" Width="230px" TextMode=Password ></asp:TextBox>
            </td>
            <td class="style3">
            </td>
        </tr>
        <tr>
            <td class="style13">
            </td>
            <td class="style14">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="cmdLogin" runat="server" Font-Bold="True" Font-Size="Large" 
                    Height="70px" Text="Đăng nhập" Width="163px" BackColor="#CCFFCC" 
                    BorderColor="#99CCFF" BorderWidth="5px" onclick="cmdLogin_Click" />
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" BackColor="#CCFFFF" Font-Bold="True" 
                    Font-Size="Large" ForeColor="Black" Text="Bạn chưa có tài khoản ? Hãy"></asp:Label>
                <asp:Button ID="cmdRegister" runat="server" Height="30px" 
                    onclick="cmdRegister_Click" Text="Đăng ký" Width="108px" />
                <br />
            </td>
            <td class="style15">
            </td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
    </div>
</body>
</html>
