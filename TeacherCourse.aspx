<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherCourse.aspx.cs" Inherits="TeacherCourse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Khóa Học Của Tôi</title>
    <style type="text/css">
        body
        {
        	background-color:#FFFFCC;
        }
        .style1
        {
            width: 100%;
            height: 666px;
        }
        .style3
        {
            width: 294px;
            height: 312px;
        }
        .style4
        {
            height: 312px;
        }
        .style8
        {
            height: 312px;
            width: 811px;
        }
        .style10
        {
            width: 294px;
            height: 32px;
        }
        .style11
        {
            width: 811px;
            height: 32px;
        }
        .style12
        {
            height: 32px;
        }
    </style>
        <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
        <script src="Scripts/ScrollableGridPlugin.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript">
        $(document).ready(function() {
        $('#<%=GridView1.ClientID %>').Scrollable();
        }
        )
        </script>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style10" bgcolor="#CCFFFF">
                <asp:Label ID="Label1" runat="server" Text="Giảng Viên" Font-Bold="True" 
                    Font-Italic="True" ForeColor="#339966"></asp:Label>
&nbsp;<asp:Label ID="lblGV" runat="server" Font-Size="X-Large" Font-Bold="True" 
                    ForeColor="#000099"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="ID" Font-Bold="True" 
                    ForeColor="#009999"></asp:Label>
&nbsp;
                <asp:Label ID="lblID" runat="server"></asp:Label>
                <br />
            </td>
            <td class="style11" bgcolor="#FFCC66">
                <center>
                <asp:Label ID="Label8" runat="server" BackColor="#FFCC66" Font-Bold="True" 
                    Font-Size="XX-Large" Text="DANH SÁCH MÔN HỌC" BorderColor="#0066FF" 
                        BorderStyle="Solid" BorderWidth="5px"></asp:Label>
                </center>
            </td>
            <td class="style12" bgcolor="#FFCC66">
                <asp:Button ID="Button5" runat="server" Text="Đăng Xuất" 
                    onclick="Button5_Click" />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3" bgcolor="#000066">
                <asp:Button ID="Button1" runat="server" Height="75px" Text="Quản lý học viên" 
                    Width="294px" onclick="Button1_Click" />
                <br />
                <asp:Button ID="Button2" runat="server" Height="75px" Text="Khóa Học Của Tôi" 
                    Width="294px" BackColor="#FFCC00" />
                <br />
                <asp:Button ID="Button3" runat="server" Height="75px" Text="Xem Đánh Giá" 
                    Width="294px" onclick="Button3_Click" />
                <br />
                <asp:Button ID="Button4" runat="server" Height="75px" Text="Thông Tin Cá Nhân" 
                    Width="294px" onclick="Button4_Click" />
                <br />
            </td>
            <td class="style8" bgcolor="#FFFFCC">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="MaLop" HeaderText="Mã Lớp" SortExpression="MaLop">
                            <ItemStyle Width="90px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenMon" HeaderText="Tên Môn" SortExpression="TenMon">
                            <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Xu" HeaderText="Xu" SortExpression="Xu">
                            <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Link" HeaderText="Tài Liệu" SortExpression="Link">
                            <ItemStyle Width="400px" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </td>
             <td class="style4" bgcolor="#FFFFCC">
                <asp:Label ID="Label3" runat="server" Text="Môn Học"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Mã Lớp"></asp:Label>
&nbsp;
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Tên Môn"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Xu"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Tài Liệu"></asp:Label>
&nbsp; <asp:TextBox ID="txtLink" runat="server"></asp:TextBox>
                <br />
                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="cmdUpdate" runat="server" Text="Sửa" 
                    onclick="cmdUpdate_Click" />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="cmdAdd" runat="server" Text="Tạo" 
                    onclick="cmdcmdAdd_Click" />
                 <br />
                 <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblKQ" runat="server"></asp:Label>
            </td>
        </tr>
        </table>
</form>
</body>
</html>
