using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
	public partial class QLDiem : System.Web.UI.Page
	{
        MonHocDAO mhDao = new MonHocDAO();
        KetQuaDAO kqDAO = new KetQuaDAO();
        protected void Page_Load(object sender, EventArgs e)
		{
            if (!Page.IsPostBack)
            {
                //khoi tao du lieu cho ddlMonHoc
                ddlMonHoc.DataSource = mhDao.getAll();
                ddlMonHoc.DataTextField = "tenmh";
                ddlMonHoc.DataValueField = "mamh";
                ddlMonHoc.DataBind();
                //chèn thêm 1 item để nhắc người dùng chọn môn học
                ddlMonHoc.Items.Insert(0, new ListItem("--Chọn môn học-", ""));
            }
        }

        protected void gvKetQua_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mamh = ddlMonHoc.SelectedValue;
            //truy van ket qua theo ma mon hoc va lien ket cho gvKetQua de hien thi
            gvKetQua.DataSource = kqDAO.getByMaMH(mamh);
            gvKetQua.DataBind();
        }

        protected void btLuu_Click(object sender, EventArgs e)
        {
            int count = gvKetQua.Rows.Count;
            for(int i = 0; i < count; i++)
            {
                int id = int.Parse(gvKetQua.DataKeys[i].Value.ToString());
                float diem = float.Parse(((TextBox)gvKetQua.Rows[i].FindControl("txtDiem")).Text);
                kqDAO.Update(id, diem);
            }
        }
    }
}