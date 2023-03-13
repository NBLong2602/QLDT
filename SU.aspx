<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SU.aspx.cs" Inherits="SU" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Quán Lý Tài Khoản</title>
    <style type="text/css">
        body
        {
        	background-color:Black;
        }
        .style1
        {
            width: 100%;
            height: 700px;
        }
        .style2
        {
            width: 294px;
            height: 58px;
        }
        .style3
        {
            width: 294px;
            height: 327px;
        }
        .style4
        {
            height: 327px;
        }
        .style7
        {
            width: 762px;
            height: 58px;
        }
        .style8
        {
            height: 327px;
            width: 762px;
        }
        .style10
        {
            height: 58px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2" bgcolor="#666666">
            <center>
                <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                 ForeColor="Lime" Text="ACADEMY"></asp:Label>
            </center>
                </td>
            <td class="style7" bgcolor="#666666">
            <center>
                <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                        ForeColor="Lime" Text="QUẢN LÝ TÀI KHOẢN"></asp:Label>
            </center>
                </td>
            <td bgcolor="#666666" class="style10">
                <asp:Label ID="Label1" runat="server" Text="Quản trị" ForeColor="#FF6600"></asp:Label>
&nbsp;<asp:Label ID="lblAD" runat="server" Font-Bold="True" ForeColor="Aqua"></asp:Label>
                <br />
                <asp:Label ID="Label2" runat="server" Text="ID" ForeColor="#FF6600"></asp:Label>
&nbsp;
                <asp:Label ID="lblID" runat="server" ForeColor="White"></asp:Label>
                <br />
                <asp:Button ID="Button5" runat="server" Text="Đăng Xuất" 
                    onclick="Button5_Click" />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3" bgcolor="#666666">
                <asp:Button ID="Button1" runat="server" Height="75px" Text="Quản lý học viên" 
                    Width="294px" onclick="Button1_Click" />
                <br />
                <asp:Button ID="Button7" runat="server" Height="75px" 
                    onclick="Button7_Click" Text="Danh Sách Lớp Học" Width="294px" />
                <br />
                <asp:Button ID="Button2" runat="server" Height="75px" Text="Quản lý giảng viên" 
                    Width="294px" onclick="Button2_Click" />
                <br />
                <asp:Button ID="Button3" runat="server" Height="75px" Text="Quản lý khóa học" 
                    Width="294px" onclick="Button3_Click" />
                <br />
                <asp:Button ID="Button4" runat="server" Height="75px" Text="Quản Lý Tài Khoản" 
                    Width="294px" BackColor="#33CCCC" />
                <br />
                <asp:Button ID="Button8" runat="server" Height="75px" Text="Thống Kê" 
                    Width="294px" onclick="Button8_Click" />
                <br />
            </td>
            <td class="style8">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Text="Role" ForeColor="White"></asp:Label>
                (*)
                <asp:TextBox ID="txtRole" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" 
                    Text="Tạo Tài Khoản" ForeColor="White"></asp:Label>
                &nbsp;<asp:RadioButton ID="RadioButton1" runat="server" />
                <br />
                <asp:Label ID="Label13" runat="server" Text="(Nhập Role, Tên DN, Pass)" 
                    ForeColor="White"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Text="Tên ĐN" ForeColor="White"></asp:Label>
                <asp:TextBox ID="txtTenDN" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" 
                    Text="Đổi Mật Khẩu" ForeColor="White"></asp:Label>
                &nbsp;<asp:RadioButton ID="RadioButton2" runat="server" />
                <br />
                <asp:Label ID="Label12" runat="server" Text="(Nhập Tên DN và Pass)" 
                    ForeColor="White"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" Text="Pass" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &nbsp;&nbsp;
                <asp:Button ID="cmdADD" runat="server" onclick="cmdADD_Click" 
                    style="margin-left: 0px;" Text="Xác Nhận" Width="120px" Height="30px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="#CCFF66"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" Font-Italic="True" Font-Underline="True" 
                    ForeColor="#CCFFFF" Text="* Role 1 là Học Viên, 2 là Giảng Viên" 
                    Font-Bold="True" Font-Size="X-Large"></asp:Label>
            </td>
            <td class="style4">
                &nbsp;<br />
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="Large" 
                    Text="Xóa Tài Khoản" ForeColor="White"></asp:Label>
                &nbsp;<br />
                <asp:Label ID="Label11" runat="server" Text="Tên ĐN" ForeColor="White"></asp:Label>
                <asp:TextBox ID="txtTenDN_del" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button6" runat="server" onclick="Button6_Click" Text="Xóa" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="cmdBlock" runat="server" onclick="cmdBlock_Click" Text="Chặn" />
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="cmdDissBlock" runat="server" Text="Mở" 
                    onclick="cmdDissBlock_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
                <asp:Label ID="Label15" runat="server" ForeColor="#FFFFCC"></asp:Label>
                <br />
                &nbsp;
                <br />
                <br />
            </td>
        </tr>
        </table>
</form>
</body>
</html>
