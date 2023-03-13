<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentsInfo.aspx.cs" Inherits="StudentsInfo" %>

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
            height: 666px;
        }
        .style4
        {
            width: 282px;
            height: 405px;
        }
        .style5
        {
            width: 633px;
            height: 405px;
        }
        .style6
        {
            height: 405px;
            width: 460px;
        }
        .style7
        {
            width: 282px;
            height: 66px;
        }
        .style8
        {
            width: 633px;
            height: 66px;
        }
        .style9
        {
            height: 66px;
            width: 460px;
        }
        #linkDocument
        {
        	text-decoration:none;
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
    <div>
        <table class="style1">
            <tr>
                <td class="style7" bgcolor="#000099">
                    <center>
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                        ForeColor="#CCFFFF" Text="ACADEMY"></asp:Label>
                    </center>
                    </td>
                <td class="style8">
                <center>
                <asp:Label ID="Label9" runat="server" 
                        BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" ForeColor="#333399" 
                        Text="THÔNG TIN CỦA TÔI" Font-Size="XX-Large"></asp:Label>
                    </td>
                </center>
                    
                <td class="style9" bgcolor="#0099CC">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                        ID="Label2" runat="server" Text="Xin chào" Font-Italic="False" 
                        ForeColor="White" meta:resourcekey="Label2Resource1" Font-Bold="True" 
                        Font-Size="Large"></asp:Label>
                    
                    &nbsp;
                    
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                         meta:resourcekey="Label1Resource1" ForeColor="Yellow"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                         ID="Label7" runat="server" Text="Số Coin : " 
                        meta:resourcekey="Label7Resource1" ForeColor="White"></asp:Label>
&nbsp;
                    <asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" 
                        ForeColor="Yellow"></asp:Label>
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="cmdLogout" runat="server" onclick="cmdLogout_Click" 
                        Text="Đăng xuất" meta:resourcekey="cmdLogoutResource1" />
                </td>
            </tr>
            <tr>
                <td class="style4" bgcolor="#336699">
                    <asp:Button ID="cmdCourse" runat="server" onclick="cmdCourse_Click" 
                        Text="Khóa Học" Height="73px" Width="294px" />
                    <br />
                    <asp:Button ID="cmdMycourse" runat="server" onclick="cmdMycourse_Click" 
                        Text="Khóa Học Đã Đăng ký" Height="73px" Width="294px" />
                    <br />
                    <asp:Button ID="cmdBill" runat="server" Height="73px" onclick="cmdBill_Click" 
                        Text="Hóa Đơn" Width="294px" />
                    <br />
                    <asp:Button ID="cmdinfo" runat="server" Height="73px" onclick="cmdinfo_Click" 
                        Text="Thông Tin Cá Nhân" Width="295px" BackColor="#FF9900" />
                    <br />
                    </td>
                <td class="style5">
                    <br />
                    <center>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    Height="40px">
                    <Columns>
                        <asp:BoundField DataField="HoTen" HeaderText="Họ Tên" SortExpression="HoTen">
                            <ItemStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" 
                            SortExpression="NgaySinh" />
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
                    <asp:Label ID="Label16" runat="server" Text="Doi Mat Khau"></asp:Label>
&nbsp;&nbsp;
                    <asp:TextBox ID="txtPass" runat="server"></asp:TextBox>
&nbsp;&nbsp;
                    <asp:Button ID="cmdChangePass" runat="server" onclick="Button1_Click" 
                        Text="Xac nhan" />
                    <br />
                    <asp:Label ID="Label17" runat="server"></asp:Label>
                </td>
                <td class="style6">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label15" runat="server" Text="Họ Tên"></asp:Label>
                    &nbsp; <asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;<br />
                    &nbsp;
                    <br />
&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Text="Ngày Sinh"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtNgaySinh" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;<br />
                <br />
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label6" runat="server" Text="Giới Tính"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtSex" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label11" runat="server" Text="SĐT"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtSDT" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;<br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label10" runat="server" Text="Gmail"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtGmail" runat="server"></asp:TextBox>
                <br />
                <br />
                &nbsp;
                <asp:Label ID="Label3" runat="server" Text="Quê Quán"></asp:Label>
                    &nbsp;<asp:TextBox ID="txtQueQuan" runat="server" ></asp:TextBox>
                    &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <asp:Label ID="Label18" runat="server"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="cmdUpdate" runat="server" Text="Cập Nhật" 
                        onclick="cmdUpdate_Click" />
                    <br />
                </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
