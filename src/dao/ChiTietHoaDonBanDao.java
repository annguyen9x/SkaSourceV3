package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import model.ChiTietHoaDonBan;
import model.HoaDonBan;
import model.KhachHang;
import model.Sach;

public class ChiTietHoaDonBanDao implements ITFChiTietHoaDonBanDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	
	@Override
	public boolean insert(HoaDonBan hdb) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(HoaDonBan hdb) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int soHDB) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public HashMap<String, Object> xemThongTinDonHang(int soHDB) {
		ketNoiDatabase = new KetNoiDatabase();
		HashMap<String, Object> thongTinDH = null;
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select ChiTietHoaDonBan.SoHD, ChiTietHoaDonBan.MaSach, ChiTietHoaDonBan.SoLuong, " +
						 "ChiTietHoaDonBan.DonGia, Sach.TenSach, Sach.UrlHinh, " + 
						 "HoaDonBan.MaKH, HoaDonBan.PhiGiaoHang, HoaDonBan.TongTien, HoaDonBan.TenNN, HoaDonBan.NgayDat, " +
						 "HoaDonBan.NgayGiao, HoaDonBan.DienThoai, HoaDonBan.Email, HoaDonBan.DiaChi, HoaDonBan.TinhTrangDH " + 
						 "From ChiTietHoaDonBan Inner Join HoaDonBan On (ChiTietHoaDonBan.SoHD = HoaDonBan.SoHD And HoaDonBan.SoHD =?)" + 
						 "Inner Join Sach On ChiTietHoaDonBan.MaSach = Sach.MaSach";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, soHDB);
			rs = pStatement.executeQuery();
			thongTinDH = new HashMap<>();
			if( rs.next() ) {
				
				HoaDonBan hdb = new HoaDonBan();
				hdb.setSoHD(rs.getInt("SoHD"));
				hdb.setTenNN(rs.getString("TenNN"));
				hdb.setEmail(rs.getString("Email"));
				hdb.setDienThoai(rs.getString("DienThoai"));
				hdb.setDiaChi(rs.getString("DiaChi"));
				hdb.setPhiGiaoHang(rs.getFloat("PhiGiaoHang"));
				hdb.setTongTien(rs.getFloat("TongTien"));
				hdb.setNgayDat(rs.getDate("NgayDat"));
				hdb.setNgayGiao(rs.getDate("NgayGiao"));
				hdb.setTinhTrangDH(rs.getString("TinhTrangDH"));
				hdb.setMaKH(rs.getInt("MaKH"));
				if(hdb.getMaKH() != 0 ) {
					KhachHangDao khachHangDao = new KhachHangDao();
					KhachHang kh = khachHangDao.getKhachHang(hdb.getMaKH());
					
					hdb.setTenNN(kh.getTenKH());
					hdb.setEmail(kh.getEmail());
					hdb.setDienThoai(kh.getDienThoai());
					hdb.setDiaChi(kh.getDiaChi());
				}
				thongTinDH.put("HoaDonBan", hdb);
				
				List<HashMap> dsChiTietHDB  = new ArrayList<>();
				
				ChiTietHoaDonBan chiTietHoaDon = new ChiTietHoaDonBan();
				chiTietHoaDon.setSoHD(rs.getInt("SoHD"));
				chiTietHoaDon.setMaSach(rs.getString("MaSach"));
				chiTietHoaDon.setSoLuong(rs.getInt("SoLuong"));
				chiTietHoaDon.setDonGia(rs.getFloat("DonGia"));
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));;
				sach.setTenSach(rs.getString("TenSach"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				
				HashMap hashMap = new HashMap<>();
				hashMap.put("ChiTiet", chiTietHoaDon);
				hashMap.put("Sach", sach);
				
				dsChiTietHDB.add(hashMap);
				while(rs.next()) {
					chiTietHoaDon = new ChiTietHoaDonBan();
					chiTietHoaDon.setSoHD(rs.getInt("SoHD"));
					chiTietHoaDon.setMaSach(rs.getString("MaSach"));
					chiTietHoaDon.setSoLuong(rs.getInt("SoLuong"));
					chiTietHoaDon.setDonGia(rs.getFloat("DonGia"));
					
					sach = new Sach();
					sach.setMaSach(rs.getString("MaSach"));;
					sach.setTenSach(rs.getString("TenSach"));
					sach.setUrlHinh(rs.getString("UrlHinh"));
					
					hashMap = new HashMap<>();
					hashMap.put("ChiTiet", chiTietHoaDon);
					hashMap.put("Sach", sach);
					
					dsChiTietHDB.add(hashMap);
				}
				thongTinDH.put("DanhSachChiTietHoaDonBan", dsChiTietHDB);
			}
			
			conn.commit();
			return thongTinDH;
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn tìm kiếm HDB: " + e.toString());
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Lỗi đóng kết nối PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		
		return null;
	}

}
