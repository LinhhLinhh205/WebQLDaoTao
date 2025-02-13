using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLSinhVien : System.Web.UI.Page
    {
        KhoaDAO khDao = new KhoaDAO();
        SinhVienDAO svDao = new SinhVienDAO();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            string masv = txtMaSV.Text;
            string hosv = txtMaSV.Text;
            string tensv = txtTenSV.Text;
            Boolean gioitinh = rdNam.Checked ? true : false;
            DateTime ngaysinh = DateTime.Parse(txtNgaysinh.Text);
            string noisinh = txtNoiSinh.Text;
            string diachi = txtDiaChi.Text;

            string makh = ddlMaKhoa.SelectedValue;
            //them sinh vien vao CSDL
            svDao.Insert(masv, hosv, tensv, gioitinh, ngaysinh, noisinh, diachi, makh);
            gvSinhVien.DataSource = svDao.getAll();
            gvSinhVien.DataBind();
        }
    }
}