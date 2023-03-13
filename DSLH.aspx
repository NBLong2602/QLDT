<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DSLH.aspx.cs" Inherits="DSLH" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Danh Sách Lớp Học </title>
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
            height: 46px;
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
            height: 46px;
        }
        .style8
        {
            height: 327px;
            width: 811px;
        }
        .style9
        {
            height: 46px;
        }
    </style>
        <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
        <script src="Scripts/ScrollableGridPlugin.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript">
        $(document).ready(function() {
        $('#<%=GridView1.ClientID %>').Scrollable();
        $('#<%=GridView2.ClientID %>').Scrollable();
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
                        ForeColor="Lime" Text="Danh Sách Học Viên"></asp:Label>
            </center>
                </td>
            <td bgcolor="#666666" class="style9">
                <asp:Label ID="Label1" runat="server" Text="Quản trị" ForeColor="#FF6600"></asp:Label>
&nbsp;<asp:Label ID="lblAD" runat="server" Font-Bold="True" ForeColor="Aqua"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;<br />
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
                <br />
                <asp:Button ID="Button1" runat="server" Height="75px" Text="Quản lý học viên" 
                    Width="294px" onclick="Button1_Click" />
                <br />
                <asp:Button ID="Button7" runat="server" Height="75px" Text="Danh Sách Lớp Học" 
                    Width="294px"  BackColor="#33CCCC" onclick="Button7_Click" />
                <br />
                <asp:Button ID="Button2" runat="server" Height="75px" Text="Quản lý giảng viên" 
                    Width="294px" onclick="Button2_Click"  />
                <br />
                <asp:Button ID="Button3" runat="server" Height="75px" Text="Quản lý khóa học" 
                    Width="294px"  style="margin-right: 0px" onclick="Button3_Click" />
                <br />
                <asp:Button ID="Button4" runat="server" Height="75px" Text="Quản Lý Tài Khoản" 
                    Width="294px" onclick="Button4_Click"  />
                <br />
                <asp:Button ID="Button6" runat="server" Height="75px" Text="Thống Kê" 
                    Width="294px" onclick="Button6_Click" />
                <br />
                <br />
            </td>
            <td class="style8">
                <asp:Label ID="Label19" runat="server" Font-Size="X-Large" ForeColor="Aqua" 
                    Font-Bold="True"></asp:Label>
                <br />
                <center>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    ForeColor="White" Font-Size="Large">
                    <Columns>
                        <asp:BoundField DataField="TOTAL" HeaderText="Số Học Viên" 
                            SortExpression="TOTAL" />
                        <asp:BoundField DataField="MaLop" HeaderText="MÃ LỚP" SortExpression="MaLop" />
                        <asp:BoundField DataField="TenMon" HeaderText="Tên Môn" 
                            SortExpression="TenMon" />
                    </Columns>
                </asp:GridView>
                </center>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    ForeColor="White">
                    <Columns>
                        <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" SortExpression="HoTen" >
                            <ItemStyle Width="170px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" 
                            SortExpression="NgaySinh" >
                            <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="GioiTinh" HeaderText="Giới Tính" 
                            SortExpression="GioiTinh" />
                        <asp:BoundField DataField="Gmail" HeaderText="Gmail" SortExpression="Gmail" >
                            <ItemStyle Width="165px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="SDT" HeaderText="SDT" SortExpression="SDT" >
                            <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="QueQuan" HeaderText="Quê quán" 
                            SortExpression="QueQuan" >
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </td>
             <td class="style4">
                <asp:DropDownList ID="ddlTenMon" runat="server" Height="40px">
                </asp:DropDownList>
                 <br />
                 <asp:Button ID="cmdSearch" runat="server" onclick="cmdSearch_Click" 
                    Text="Tìm Kiếm" Height="43px" Width="133px" />
            </td>
        </tr>
        </table>
</form>
</body>
</html>


