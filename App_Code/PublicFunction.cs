using System;
using System.Data;
using System.Data.OleDb;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for PublicFunction
/// </summary>
public class PublicFunction
{
    public string connectDB = @"Provider=Microsoft.ACE.OLEDB.12.0;Server=sql.bsite.net\MSSQL2016;Datatable=nblongdev_QLDT;User id=nblongdev_QLDT;password=Longbo88";
    public string login = @"SELECT count(*) from TaiKhoan where TenDN = '{0}' AND Pass = '{1}'";
    public string getHoTen = @"SELECT HoTen from TaiKhoan where TenDN = '{0}' AND Pass = '{1}'";
    public string getID = @"SELECT ID from TaiKhoan where TenDN = '{0}' AND Pass = '{1}'";
    public string getRole = @"SELECT Role from TaiKhoan where TenDN = '{0}' AND Pass = '{1}'";
    public string getBlock = @"SELECT Block from TaiKhoan where TenDN = '{0}' AND Pass = '{1}'";
    public string getDSMH = @"select MaLop,TenMon,TaiKhoan.HoTen,Xu from DsachMonHoc,TaiKhoan,GiangVien where DsachMonHoc.id_GV = GiangVien.ID and GiangVien.ID = TaiKhoan.ID";
    public string getXu = @"SELECT Xu from HocVien where ID = {0}";
    public string updateXu = @"update HocVien set Xu = {0} where ID = {1}";
    public string getMaLop = @"select MaLop from DsachMonHoc where TenMon = '{0}'";
    public string checkCourse = @"SELECT Count(MaLop) FROM Lop WHERE ID = {0} and MaLop = '{1}'";
    public string XuCourse = @"select Xu from DsachMonHoc where TenMon = '{0}'";
    public string creatBill = @"insert into HoaDon(XuPaid) values({0})";
    public string getID_bill = @"SELECT top 1 ID_hdon FROM HoaDon ORDER BY ID_hdon DESC";
    public string addCourse = @"insert into Lop(ID,MaLop,ID_hdon)values({0},'{1}',{2})";
    public string userCourse = @"SELECT Lop.MaLop, DsachMonHoc.TenMon, DsachMonHoc.Xu,TaiKhoan.HoTen,Lop.Rate
                                FROM DsachMonHoc,Lop,TaiKhoan,GiangVien
                                WHERE Lop.ID= {0} and  DsachMonHoc.id_GV = GiangVien.ID and GiangVien.ID = TaiKhoan.ID and DsachMonHoc.MaLop = Lop.MaLop";
    public string showBill = @"SELECT Lop.ID_hdon,DsachMonHoc.TenMon,HoaDon.XuPaid,HoaDon.NgayLap
                                from Lop,HoaDon,DsachMonhoc
                                where Lop.ID_hdon = HoaDon.ID_hdon and Lop.MaLop = DsachMonHoc.MaLop and Lop.ID = {0}
                                order by NgayLap desc";
    public string getLink = @"SELECT DsachMonHoc.Link
                                FROM DsachMonHoc INNER JOIN Lop ON DsachMonHoc.MaLop = Lop.MaLop
                                WHERE Lop.ID = {0} and DsachMonHoc.TenMon = '{1}'";
    public string userOFcousre = @"SELECT TaiKhoan.HoTen,TaiKhoan.NgaySinh,TaiKhoan.GioiTinh,TaiKhoan.Gmail,TaiKhoan.SDT,TaiKhoan.QueQuan
                                    From TaiKhoan,Lop,DsachMonHoc
                                    where TaiKhoan.ID=Lop.ID and Lop.MaLop=DsachMonHoc.MaLop and DsachMonHoc.id_GV ={0} and DsachMonHoc.TenMon = '{1}'";
    public string userOFcousre_2 = @"SELECT TaiKhoan.HoTen,TaiKhoan.NgaySinh,TaiKhoan.GioiTinh,TaiKhoan.Gmail,TaiKhoan.SDT,TaiKhoan.QueQuan
                                    From TaiKhoan,Lop,DsachMonHoc
                                    where TaiKhoan.ID=Lop.ID and Lop.MaLop=DsachMonHoc.MaLop and DsachMonHoc.TenMon = '{0}'";

}
