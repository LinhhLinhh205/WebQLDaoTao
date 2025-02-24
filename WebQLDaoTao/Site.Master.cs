using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebQLDaoTao
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["TaiKhoan"] != null) 
                {
                    liDangNhap.Visible = false;  
                    liDangXuat.Visible = true;   
                    liTenDN.Visible = true;     
                    lbTen.Text = Session["TenDN"].ToString();
                }
                else
                {
                    liDangNhap.Visible = true;
                    liDangXuat.Visible = false;
                    liTenDN.Visible = false;
                }
            }
        }
    }
}