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
			SqlCommand cmd = new SqlCommand("Select ID,KetQua.MaSV,HoSV,TenSV,MaMH,Diem"+" from KetQua inner join SinhVien on KetQua.MaSV=SinhVien.MaSV where mamh=@mamh", conn);
			cmd.Parameters.AddWithValue("@mamh", mamh);
			SqlDataReader dr = cmd.ExecuteReader();
			while (dr.Read())
			{
				KetQua kq = new KetQua();
				kq.Id = int.Parse(dr["Id"].ToString());
				kq.MaSV = dr["MaSV"].ToString();
				kq.MaMH = dr["mamh"].ToString();
				kq.HoTenSV = dr["hosv"] + "" + dr["tensv"];
				if (dr["diem"] != DBNull.Value)
				{
					kq.Diem = double.Parse(dr["diem"].ToString());
				}
				dsKetQua.Add(kq);
			}
			return dsKetQua;

		}
        public int Update(int Id, double diem)
        {
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("update ketqua set diem=@diem where id=@id", conn);
            cmd.Parameters.AddWithValue("@id", Id);
            cmd.Parameters.AddWithValue("@diem", diem);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
        public int Delete(int id)
        {
            //1.Mo ket noi CSDL
            SqlConnection conn = new
            SqlConnection(ConfigurationManager.ConnectionStrings["WebQLDaoTao_ConStr"].ConnectionString);
            conn.Open();
            //2.tao truy van
            SqlCommand cmd = new SqlCommand("delete from ketqua where id=@id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            //3.thuc thi ket qua;
            return cmd.ExecuteNonQuery();
        }
    }
}