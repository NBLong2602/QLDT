<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Teacher_Feedback.aspx.cs" Inherits="Teacher_Feedback" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Feedback</title>
    <style type="text/css">
        body
        {
        	background-color:#FFFFCC;
        }
        .style1
        {
            width: 100%;
            height: 581px;
        }
        .style2
        {
            width: 269px;
            height: 61px;
        }
        .style3
        {
            width: 269px;
            height: 327px;
        }
        .style4
        {
            height: 327px;
        }
        .style7
        {
            width: 780px;
            height: 61px;
        }
        .style8
        {
            height: 327px;
            width: 780px;
        }
        #form1
        {
            height: 665px;
        }
        .style10
        {
            height: 61px;
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
            </td>
            <td class="style7" bgcolor="#FFCC66">
                <center>
                <asp:Label ID="Label3" runat="server" BackColor="#FFCC66" Font-Bold="True" 
                    Font-Size="XX-Large" Text="ĐÁNH GIÁ CỦA HỌC VIÊN" BorderColor="#0066FF" 
                        BorderStyle="Solid" BorderWidth="5px"></asp:Label>
                </center>
            </td>
            <td bgcolor="#FFCC66" class="style10">
                &nbsp;<asp:Button ID="cmdLogout" runat="server" Text="Đăng Xuất" onclick="cmdLogout_Click" 
                     />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3" bgcolor="#000066">
                <asp:Button ID="Button1" runat="server" Height="75px" Text="Quản lý học viên" 
                    Width="294px" BorderStyle="None" onclick="Button1_Click" />
                <br />
                <asp:Button ID="cmdMycourse" runat="server" Height="75px" Text="Khóa Học Của Tôi" 
                    Width="294px" onclick="cmdMycourse_Click"  />
                <br />
                <asp:Button ID="Button3" runat="server" Height="75px" Text="Xem Đánh Giá" 
                    Width="294px" BackColor="#FFCC00" />
                <br />
                <asp:Button ID="cmdCRUD" runat="server" Height="75px" Text="Thông Tin Cá Nhân" 
                    Width="294px" onclick="cmdCRUD_Click"  />
                <br />
            </td>
            <td class="style8" bgcolor="#FFFFCC">
                <center>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="MaLop" HeaderText="Mã Lớp" SortExpression="MaLop" >
                            <ItemStyle Width="70px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="TenMon" HeaderText="Môn Học" 
                            SortExpression="TenMon" >
                            <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
                        <asp:BoundField DataField="ID" HeaderText="ID Học Viên" SortExpression="ID" />
                    </Columns>
                </asp:GridView>
                </center>
                
            </td>
            <td class="style4" bgcolor="#FFFFCC">
                <asp:Label ID="Label4" runat="server" Text="Môn Học"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                </asp:DropDownList>
                <br />
                <asp:Button ID="cmdSearch" runat="server" Text="Tìm Kiếm" 
                    onclick="cmdSearch_Click" />
            </td>
        </tr>
        </table>
</form>
</body>
</html>

