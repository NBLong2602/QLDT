<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BillCourse.aspx.cs" Inherits="BillCourse" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>My Bill</title>
    <style type="text/css">
        body
        {
        	background-color:#FFFFCC;
        }
        .style1
        {
            width: 100%;
            height: 665px;
        }
        .style4
        {
            width: 290px;
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
            width: 792px;
        }
        .style7
        {
            width: 290px;
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
            width: 792px;
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
                    <asp:Label ID="Label14" runat="server" 
                        BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" ForeColor="#333399" 
                        Text="DANH SÁCH HÓA ĐƠN" Font-Size="XX-Large" 
                        meta:resourcekey="Label9Resource1"></asp:Label>
                  </center>
                    </td>
                 <td class="style9" bgcolor="#0099CC">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                         ID="Label13" runat="server" Font-Bold="True" Font-Size="Large" 
                         ForeColor="White" Text="Xin chào"></asp:Label>
                    
                    &nbsp;
                    
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                         meta:resourcekey="Label1Resource1" ForeColor="Yellow"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                         ID="Label7" runat="server" Text="Số Coin : " 
                         meta:resourcekey="Label7Resource1" ForeColor="White"></asp:Label>
&nbsp;
                    <asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" 
                         ForeColor="Yellow"></asp:Label>
                     <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="cmdLogout" runat="server" onclick="cmdLogout_Click" 
                        Text="Đăng xuất" meta:resourcekey="cmdLogoutResource1" />
                </td>
            </tr>
            <tr>
                <td class="style4" bgcolor="#336699">
                    <asp:Button ID="cmdCourse" runat="server" onclick="cmdCourse_Click" 
                        Text="Khóa Học" Height="73px" Width="294px" 
                        meta:resourcekey="cmdCourseResource1" />
                    <br />
                    <asp:Button ID="cmdMycourse" runat="server" onclick="cmdMycourse_Click" 
                        Text="Khóa Học Đã Đăng Ký" Height="73px" Width="294px" 
                        meta:resourcekey="cmdMycourseResource1" />
                    <br />
                    <asp:Button ID="cmdBill" runat="server" Height="73px" onclick="cmdBill_Click" 
                        Text="Hóa Đơn" Width="294px" BackColor="#FF9900" 
                        meta:resourcekey="cmdBillResource1" />
                    <br />
                    <asp:Button ID="cmdinfo" runat="server" Height="73px" onclick="cmdinfo_Click" 
                        Text="Thông Tin Cá Nhân" Width="294px" 
                        meta:resourcekey="cmdinfoResource1" />
                    </td>
                <td class="style5">
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        Width="558px" Height="100px" meta:resourcekey="GridView1Resource1">
                        <Columns>
                            <asp:BoundField DataField="ID_hdon" HeaderText="Mã Hóa Đơn" 
                                SortExpression="ID_hdon" meta:resourcekey="BoundFieldResource1" />
                            <asp:BoundField DataField="TenMon" HeaderText="Tên Môn" 
                                SortExpression="TenMon" meta:resourcekey="BoundFieldResource2" />
                            <asp:BoundField DataField="XuPaid" HeaderText="Xu" 
                                SortExpression="XuPaid" meta:resourcekey="BoundFieldResource3" >
                                <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NgayLap" HeaderText="Ngày" 
                                SortExpression="NgayLap" meta:resourcekey="BoundFieldResource4" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td class="style6">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
