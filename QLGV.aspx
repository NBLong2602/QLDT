<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QLGV.aspx.cs" Inherits="QLGV" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Quản lý Giảng Viên </title>
    <style type="text/css">
        body
        {
        	background-color:Black;
        }
        .style1
        {
            width: 100%;
            height: 699px;
        }
        .style2
        {
            width: 294px;
            height: 40px;
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
            height: 40px;
        }
        .style8
        {
            height: 327px;
            width: 811px;
        }
        .style10
        {
            height: 40px;
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
            <td class="style2" bgcolor="#666666">
                    <center>
             <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                        ForeColor="Lime" Text="ACADEMY"></asp:Label>
            </center>  
                </td>
            <td class="style7" bgcolor="#666666">
            <center>
            <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                        ForeColor="Lime" Text="QUẢN LÝ GIÁO VIÊN"></asp:Label>
            </center>       
                </td>
            <td bgcolor="#666666" class="style10">
                <asp:Label ID="Label1" runat="server" Text="Quản trị" ForeColor="#FF6600"></asp:Label>
&nbsp;<asp:Label ID="lblAD" runat="server" Font-Bold="True" ForeColor="Aqua"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="Label2" runat="server" Text="ID" ForeColor="#FF6600"></asp:Label>
&nbsp;
                <asp:Label ID="lblID" runat="server" ForeColor="White"></asp:Label>
                <br />
                <asp:Button ID="Button5" runat="server" Text="Đăng Xuất" 
                    onclick="Button5_Click" />
            </td>
        </tr>
        <tr>
            <td class="style3" bgcolor="#666666">
                <asp:Button ID="Button1" runat="server" Height="75px" Text="Quản lý học viên" 
                    Width="294px" onclick="Button1_Click" />
                <br />
                <asp:Button ID="Button7" runat="server" Height="75px" Text="Danh Sách Lớp Học" 
                    Width="294px" onclick="Button7_Click" />
                <br />
                <asp:Button ID="Button2" runat="server" Height="75px" Text="Quản lý giảng viên" 
                    Width="294px" onclick="Button2_Click" BackColor="#33CCCC" />
                <br />
                <asp:Button ID="Button3" runat="server" Height="75px" Text="Quản lý khóa học" 
                    Width="294px" onclick="Button3_Click" />
                <br />
                <asp:Button ID="Button4" runat="server" Height="75px" Text="Quản Lý Tài Khoản" 
                    Width="294px" onclick="Button4_Click" />
                <br />
                <asp:Button ID="Button6" runat="server" Height="75px" Text="Thống Kê" 
                    Width="294px" onclick="Button6_Click" />
                <br />
            </td>
            <td class="style8">
                <asp:Label ID="Label19" runat="server" BackColor="Aqua" BorderColor="Aqua" 
                    BorderStyle="Solid" BorderWidth="5px" Text="Tên Dăng Nhập"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="cmdSearch" runat="server" onclick="cmdSearch_Click" Text="Tìm Kiếm" />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    ForeColor="White">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                        <asp:BoundField DataField="TenDN" HeaderText="Tên DN" SortExpression="TenDN" >
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Pass" HeaderText="Pass" SortExpression="Pass" >
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HoTen" HeaderText="HoTen" SortExpression="HoTen">
                            <ItemStyle Width="170px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Luong" HeaderText="Luong" 
                            SortExpression="Luong" >
                            <ItemStyle Width="60px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rank" HeaderText="HH/HV" SortExpression="Rank" >
                            <ItemStyle Width="110px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SDT" HeaderText="SDT" SortExpression="SDT" />
                    </Columns>
                </asp:GridView>
            </td>
            <td class="style4">
                <asp:Label ID="Label10" runat="server" Text="ID" ForeColor="White"></asp:Label>
                <br />
                <asp:TextBox ID="id" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Cập Nhật Lương" ForeColor="White"></asp:Label>
                <br />
                <asp:TextBox ID="luong" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="cmdUpLuong" runat="server" onclick="cmdUpLuong_Click" 
                    Text="Xác nhận" />
                <br />
                <br />
                <asp:Label ID="Label8" runat="server" ForeColor="#FFFFCC"></asp:Label>
                <br />
            </td>
        </tr>
        </table>
</form>
</body>
</html>
