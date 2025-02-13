using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
    public partial class QLMonHoc : System.Web.UI.Page
    {
        MonHocDAO mhDAO = new MonHocDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //lien ket du lieu cho gvMonhoc
                gvMonhoc.DataSource = mhDAO.getAll();
                gvMonhoc.DataBind();
            }
        }

        protected void gvMonhoc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string mamh = gvMonhoc.DataKeys[e.RowIndex].Value.ToString();
            string tenmh = ((TextBox)gvMonhoc.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            int sotiet = int.Parse(((TextBox)gvMonhoc.Rows[e.RowIndex].Cells[2].Controls[0]).Text);
            //b2. cap nhat vao CSDL
            mhDAO.Update(mamh, tenmh, sotiet);
            //b3. chuyen doi trang thai cua dong hien hanh : từ chế độ sửa(edit) sang chế độ xem
            gvMonhoc.EditIndex = -1;
            //b4. lien ket lai du lieu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }

        protected void gvMonhoc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMonhoc.EditIndex = -1;
            //lien ket lai du lieu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();

        }

        protected void gvMonhoc_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                //b1. lấy thông tin mã môn học hiện hành
                string mamh = gvMonhoc.DataKeys[e.RowIndex].Value.ToString();
                //b2. goi phương thức xóa môn học khỏi CSDL của lớp MonHocDAO
                mhDAO.Delete(mamh);
                //b4. lien ket lai du lieu cho gvMonHoc
                gvMonhoc.DataSource = mhDAO.getAll();
                gvMonhoc.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('Không thể xóa môn học này')</script>");
            }
        }

        protected void gvMonhoc_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMonhoc.PageIndex = e.NewPageIndex;
            //lien ket lai du lieu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            try
            {
                string mamh = txtMamh.Text;
                string tenmh = txtTenmh.Text;
                int sotiet = int.Parse(txtsotiet.Text);
                if (mhDAO.findById(mamh) != null)
                {
                    Response.Write("<script>alert('Mã môn học đã tồn tại. Chọn mã khác nhé.')</script>");
                    return;
                }
                MonHoc mhInsert = new MonHoc { MaMH = mamh, TenMH = tenmh, SoTiet = sotiet };
                mhDAO.Insert(mhInsert);
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Thao tác thêm môn học không thành công.')</script>");
            }
            //liên kết dữ liệu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }

        protected void gvMonhoc_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvMonhoc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMonhoc.EditIndex = e.NewEditIndex;
            //lien ket lai du lieu cho gvMonHoc
            gvMonhoc.DataSource = mhDAO.getAll();
            gvMonhoc.DataBind();
        }
    }
}