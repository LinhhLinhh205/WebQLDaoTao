using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebQLDaoTao.Models;

namespace WebQLDaoTao
{
	public partial class SecurePage : System.Web.UI.Page
	{
		TaiKhoanDAO tkDao = new TaiKhoanDAO();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["TenDN"] == null)
			{
				Response.Redirect("Login.aspx");
			}
			else
			{
				string username = (string)Session["TenDN"];
				TaiKhoan taikhoan = tkDao.FindByUserName(username);

                if (taikhoan.ChucVu.Trim() != "CBDT")
				{
					Response.Redirect("TuChoi.aspx");
				}
			}
		}
	}
}