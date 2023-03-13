<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyCourse.aspx.cs" Inherits="MyCourse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Khóa Học Đã Đăng Ký</title>
    <style type="text/css">
        body
        {
        	background-color:#FFFFCC;
        }
        .style1
        {
            width: 100%;
            height: 667px;
        }
        .style4
        {
            width: 290px;
            height: 405px;
        }
        .style5
        {
            width: 909px;
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
            width: 909px;
            height: 66px;
        }
        .style9
        {
            height: 66px;
            width: 792px;
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
                        Text="DANH SÁCH KHÓA HỌC ĐÃ ĐĂNG KÝ" Font-Size="XX-Large"></asp:Label>
                    </td>
                </center>
                    
                <td class="style9" bgcolor="#0099CC">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                        ID="Label2" runat="server" Text="Xin chào " Font-Italic="False" 
                        ForeColor="White" Font-Bold="True" Font-Size="Large"></asp:Label>
                    
                    &nbsp;
                    
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Yellow"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                        ID="Label7" runat="server" Text="Số Coin : " ForeColor="White"></asp:Label>
&nbsp;
                    <asp:Label ID="Label8" runat="server" ForeColor="Yellow"></asp:Label>
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="cmdLogout" runat="server" onclick="cmdLogout_Click" 
                        Text="Đăng xuất" />
                </td>
            </tr>
            <tr>
                <td class="style4" bgcolor="#336699">
                    <asp:Button ID="cmdCourse" runat="server" onclick="cmdCourse_Click" 
                        Text="Khóa Học" Height="73px" Width="294px" />
                    <br />
                    <asp:Button ID="cmdMycourse" runat="server" onclick="cmdMycourse_Click" 
                        Text="Khóa Học Đã Đăng ký" Height="73px" Width="294px" 
                        BackColor="#FF9900" />
                    <br />
                    <asp:Button ID="cmdBill" runat="server" Height="73px" onclick="cmdBill_Click" 
                        Text="Hóa Đơn" Width="294px" />
                    <br />
                    <asp:Button ID="cmdinfo" runat="server" Height="73px" onclick="cmdinfo_Click" 
                        Text="Thông Tin Cá Nhân" Width="294px" />
                    <br />
                    </td>
                <td class="style5">
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        Width="558px" Height="100px" 
                        >
                        <Columns>
                            <asp:BoundField DataField="MaLop" HeaderText="Mã Lớp" SortExpression="MaLop" />
                            <asp:BoundField DataField="TenMon" HeaderText="Tên Môn Học" 
                                SortExpression="TenMon" />
                            <asp:BoundField DataField="HoTen" HeaderText="Giảng Viên" 
                                SortExpression="HoTen" />
                            <asp:BoundField DataField="Xu" HeaderText="Xu" SortExpression="Xu" >
                                <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
                        </Columns>
                    </asp:GridView>
                </td>
                <td class="style6">
&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" 
                        Text="Môn học"></asp:Label>
                    &nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Height="40px">
                    </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="linkDocument" runat="server" onclick="linkDocument_Click" 
                        BackColor="#990033" BorderColor="#993333" BorderWidth="5px" Font-Bold="True" 
                        ForeColor="White" >Vào Học</asp:LinkButton>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label10" runat="server" 
                        Text="Bạn đã học xong ? Hãy cho chúng tôi biết chất lượng môn học bằng cách chọn môn học và gửi đánh giá "></asp:Label>
                    <br />
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                        <asp:ListItem Value="5">5</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                    <asp:Button ID="cmdRate" runat="server" onclick="cmdRate_Click" 
                        Text="Đánh Giá" />
                    <br />
                    <asp:Label ID="Label11" runat="server"></asp:Label>
                </td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
