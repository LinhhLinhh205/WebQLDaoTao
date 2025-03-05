using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLSinhVien : SecurePage
    {
        SinhVienDAO svDao = new SinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            try
            {
                string masv = txtMaSV.Text;
               
                if (svDao.findById(masv) != null)
                {
                    Response.Write("<script>alert('Mã sinh viên đã tồn tại. Chọn mã khác nhé.')</script>");

                    return;
                }
                string hosv = txtHoSv.Text;
                string tensv = txtTenSV.Text;
                Boolean gioitinh = rdNam.Checked ? true : false;
                DateTime ngaysinh = DateTime.Parse(txtNgaysinh.Text);
                string noisinh = txtNoiSinh.Text;
                string diachi = txtDiaChi.Text;

                string makh = ddlMaKhoa.SelectedValue;
                SinhVien mhInsert = new SinhVien { MaSV = masv, HoSV = hosv, TenSV = tensv,GioiTinh=gioitinh,NgaySinh=ngaysinh,NoiSinh=noisinh,DiaChi=diachi,MaKH=makh };
                svDao.Insert(mhInsert);
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Thao tác thêm môn học không thành công.')</script>");
            }
            gvSinhVien.DataBind();
        }

        protected void gvSinhVien_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
        }
    }
}