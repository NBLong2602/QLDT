<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherInfo.aspx.cs" Inherits="TeacherInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Thông Tin Cá Nhân</title>
    <style type="text/css">
        body
        {
        	background-color:#FFFFCC;
        }
        .style1
        {
            width: 100%;
            height: 700px;
            margin-bottom: 0px;
        }
        .style2
        {
            width: 294px;
            height: 71px;
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
            width: 811px;
            height: 71px;
        }
        .style8
        {
            height: 327px;
            width: 811px;
        }
        .style9
        {
            height: 71px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style2" bgcolor="#CCFFFF">
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
                <br />
                </td>
            <td class="style7" bgcolor="#FFCC66">
                <center>
                <asp:Label ID="Label11" runat="server" BackColor="#FFCC66" Font-Bold="True" 
                    Font-Size="XX-Large" Text="THÔNG TIN CÁ NHÂN" BorderColor="#0066FF" 
                        BorderStyle="Solid" BorderWidth="5px"></asp:Label>
                </center>
                          </td>
            <td bgcolor="#FFCC66" class="style9">
                &nbsp;<asp:Button ID="Button5" runat="server" Text="Đăng Xuất" 
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
                <br />
                <asp:Button ID="Button1" runat="server" Height="75px" Text="Quản lý học viên" 
                    Width="294px" onclick="Button1_Click" />
                <br />
                <asp:Button ID="Button2" runat="server" Height="75px" Text="Khóa Học Của Tôi" 
                    Width="294px" onclick="Button2_Click" />
                <br />
                <asp:Button ID="Button3" runat="server" Height="75px" Text="Xem Đánh Giá" 
                    Width="294px" onclick="Button3_Click" />
                <br />
                <asp:Button ID="Button4" runat="server" Height="75px" Text="Thông Tin Cá Nhân" 
                    Width="294px" BackColor="#FFCC00" />
                <br />
                <br />
                <br />
            </td>
            <td class="style8">
            <center>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Height="40px">
                    <Columns>
                        <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" SortExpression="HoTen">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" 
                            SortExpression="NgaySinh" />
                        <asp:BoundField DataField="Rank" HeaderText="HH/HV" SortExpression="Rank">
                            <ItemStyle Width="70px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GioiTinh" HeaderText="Giới Tính" 
                            SortExpression="GioiTinh" />
                        <asp:BoundField DataField="SDT" HeaderText="SDT" SortExpression="SDT">
                            <ItemStyle Width="85px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Gmail" HeaderText="Gmail" SortExpression="Gmail">
                            <ItemStyle Width="175px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="QueQuan" HeaderText="Quê Quán" 
                            SortExpression="QueQuan">
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </center>
            </br>
                <asp:Label ID="Label3" runat="server" Text="Họ Tên"></asp:Label>
&nbsp;<asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Text="Ngày Sinh"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label5" runat="server" Text="Trình Độ"></asp:Label>
&nbsp;<asp:TextBox ID="txtRank" runat="server"></asp:TextBox>
&nbsp;<br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="Giới Tính"></asp:Label>
&nbsp;<asp:TextBox ID="txtSex" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" Text="SĐT"></asp:Label>
&nbsp;<asp:TextBox ID="txtSDT" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label10" runat="server" Text="Gmail"></asp:Label>
&nbsp;<asp:TextBox ID="txtGmail" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Quê Quán"></asp:Label>
&nbsp;<asp:TextBox ID="txtQueQuan" runat="server" ></asp:TextBox>
&nbsp;<br />
<center>
 <asp:Button ID="cmdUpdate" runat="server" Text="Cập Nhật" 
                    onclick="cmdUpdate_Click" />
</center>
               
            <br />
            </td>
            <td class="style4">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        </table>
</form>
</body>
</html>

