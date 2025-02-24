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
        KetQuaDAO kqDAO = new KetQuaDAO();
        protected void Page_Load(object sender, EventArgs e)
		{
            if (Session["TaiKhoan"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btLuu_Click(object sender, EventArgs e)
        {
            int count = gvKetQua.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                int id = int.Parse(gvKetQua.DataKeys[i].Value.ToString());
                float diem = float.Parse(((TextBox)gvKetQua.Rows[i].FindControl("txtDiem")).Text);
                kqDAO.Update(id, diem);
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            int count = gvKetQua.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                bool checkxoa = ((CheckBox)gvKetQua.Rows[i].FindControl("chkChon")).Checked;
                if (checkxoa)
                {
                    int id = int.Parse(gvKetQua.DataKeys[i].Value.ToString());
                    kqDAO.Delete(id);
                }
            }
            gvKetQua.DataBind();
        }

        protected void chkAll_CheckedChanged(object sender, EventArgs e)
        {
            bool check = ((CheckBox)gvKetQua.FooterRow.FindControl("chkAll")).Checked;
            int count = gvKetQua.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                ((CheckBox)gvKetQua.Rows[i].FindControl("chkChon")).Checked=check;
            }
        }
    }
}