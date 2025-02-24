using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btLogin_Click(object sender, EventArgs e)
        {
            string tenDN = txtTenDN.Text.Trim();
            string matKhau = txtMatKhau.Text.Trim();

            TaiKhoanDAO tkDAO = new TaiKhoanDAO();
            TaiKhoan tk = tkDAO.KiemTra(tenDN, matKhau);

            if (tk != null)
            {
                Session["TaiKhoan"] = tk;
                Session["TenDN"] = tk.TenDN;
                Response.Redirect("Default.aspx"); // Chuyển hướng sau khi đăng nhập thành công
            }

        }
    }
}