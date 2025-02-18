using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebQLDaoTao.Models
{
	public class KetQuaDAO
	{
		public List<KetQua> getByMaMH(string mamh)
		{
			List<KetQua> dsKetQua = new List<KetQua>();
			SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
			conn.Open();
			SqlCommand cmd = new SqlCommand("Select ID,KetQua.MaSV,MaMH,Diem,HoSV,TenSV from KetQua inner join SinhVien on KetQua.MaSV=SinhVien.MaSV where mamh=@mamh", conn);
			cmd.Parameters.AddWithValue("@mamh", mamh);
			SqlDataReader dr = cmd.ExecuteReader();
			while (dr.Read())
			{
				KetQua kq = new KetQua();
				kq.Id = int.Parse(dr["Id"].ToString());
				kq.MaSV = dr["MaSV"].ToString();
				kq.MaMH = dr["mamh"].ToString();
				kq.Diem = string.IsNullOrEmpty(dr["diem"].ToString()) ? 0 : float.Parse(dr["diem"].ToString());
				kq.HoTenSV = dr["hosv"] + "" + dr["tensv"];
				dsKetQua.Add(kq);
			}
			return dsKetQua;

		}		
	}
}