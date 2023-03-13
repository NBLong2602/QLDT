<%@ Page Language="C#" AutoEventWireup="true" CodeFile="QLKH.aspx.cs" Inherits="QLKH" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Quản lý Khóa Học</title>
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
            width: 100px;
            height: 94px;
        }
        .style3
        {
            width: 100px;
            height: 580px;
        }
        .style4
        {
            height: 580px;
        }
        .style7
        {
            width: 811px;
            height: 94px;
        }
        .style8
        {
            height: 580px;
            width: 811px;
        }
        .style9
        {
            height: 94px;
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
            <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                        ForeColor="Lime" Text="QUẢN LÝ KHÓA HỌC"></asp:Label>
            </center>                   
                </td>
            <td bgcolor="#666666" class="style9">
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
                    Width="294px" onclick="Button2_Click" />
                <br />
                <asp:Button ID="Button3" runat="server" Height="75px" Text="Quản lý khóa học" 
                    Width="294px" BackColor="#33CCCC" />
                <br />
                <asp:Button ID="Button4" runat="server" Height="75px" Text="Quản Lý Tài Khoản" 
                    Width="294px" onclick="Button4_Click" />
                <br />
                <asp:Button ID="Button6" runat="server" Height="75px" Text="Thống Kê" 
                    Width="294px" onclick="Button6_Click" />
                <br />
            </td>
            <td class="style8">
                <br />
                <asp:Label ID="Label20" runat="server" BackColor="Aqua" BorderColor="Aqua" 
                    BorderStyle="Solid" BorderWidth="5px" Text="Tên Môn"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="cmdSearch" runat="server" onclick="cmdSearch_Click" Text="Tìm Kiếm" />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    ForeColor="White">
                    <Columns>
                        <asp:BoundField DataField="MaLop" HeaderText="Mã Lớp" SortExpression="MaLop" />
                        <asp:BoundField DataField="TenMon" HeaderText="Tên Môn" 
                            SortExpression="TenMon" />
                        <asp:BoundField DataField="HoTen" HeaderText="Giảng viên" 
                            SortExpression="HoTen" />
                        <asp:BoundField DataField="Xu" HeaderText="Xu" SortExpression="Xu" />
                        <asp:BoundField DataField="Link" HeaderText="Tài Liệu" SortExpression="Link" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Xóa Môn Học"></asp:Label>
                <br />
                <asp:Label ID="Label10" runat="server" Text="Tên Môn Học" ForeColor="White"></asp:Label>
&nbsp;
                <asp:TextBox ID="txtTM_del" runat="server"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Button ID="cmdDel" runat="server" onclick="cmdDel_Click" Text="Xóa" />
&nbsp;<asp:Label ID="Label11" runat="server" ForeColor="#FFFF66"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label12" runat="server" Font-Bold="True" Text="Sửa Môn Học" 
                    ForeColor="White"></asp:Label>
                &nbsp;<asp:DropDownList ID="DropDownList2" runat="server">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="Label17" runat="server" ForeColor="White" Text="Mã Lớp "></asp:Label>
                <asp:TextBox ID="txtML_up" runat="server"></asp:TextBox>
&nbsp;&nbsp;
                <asp:Label ID="Label13" runat="server" Text="Tên Môn" ForeColor="White"></asp:Label>
&nbsp;<asp:TextBox ID="txtTM_up" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label14" runat="server" Text="Giảng Viên" ForeColor="White"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList3" runat="server">
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label15" runat="server" Text="Xu" ForeColor="White"></asp:Label>
                <asp:TextBox ID="txtXu_up" runat="server"></asp:TextBox>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="cmdUpdate" runat="server" Text="Sửa" onclick="cmdUpdate_Click" 
                     />
                <br />
                <asp:Label ID="Label16" runat="server" ForeColor="#FFFF66"></asp:Label>
                <br />
                <br />
                <br />
            </td>
            <td class="style4">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Thêm Môn Học" 
                    ForeColor="White"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Mã Lớp" ForeColor="White"></asp:Label>
                <br />
                <asp:TextBox ID="txtMaLop" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label4" runat="server" Text="Tên Môn" ForeColor="White"></asp:Label>
                <br />
                <asp:TextBox ID="txtTenMon" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Giảng Viên" ForeColor="White"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                <br />
                <br />
                <asp:Label ID="Label8" runat="server" Text="Xu" ForeColor="White"></asp:Label>
&nbsp;<asp:TextBox ID="txtXu" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="cmdAdd" runat="server" onclick="cmdAdd_Click" 
                    Text="Thêm" />
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" ForeColor="#FFFF66"></asp:Label>
            </td>
        </tr>
        </table>
</form>
</body>
</html>
