package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.HoaDonBan;
import model.KhachHang;
import model.Sach;

public class HoaDonBanDao implements ITFHoaDonBanDao{
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
	public List<HoaDonBan> dsDonHangTheoTinhTrang(String tinhTrangDH) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<HoaDonBan> dsDonHangTheoKhachHang(int maKH) {
		ketNoiDatabase = new KetNoiDatabase();
		List<HoaDonBan> dsDonHang = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select SoHD, TenNN, Email, DienThoai, DiaChi, PhiGiaoHang, TongTien, NgayDat, NgayGiao, TinhTrangDH, MaNVGiao, MaKH " + 
						 "From HoaDonBan " + 
						 "Where MaKH=? ";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, maKH);
			rs = pStatement.executeQuery();
			dsDonHang = new ArrayList<HoaDonBan>();
			while( rs.next() ) {
				HoaDonBan hdb = new HoaDonBan();
				hdb.setSoHD(rs.getInt("SoHD"));
				hdb.setTenNN(rs.getNString("TenNN"));
				hdb.setEmail(rs.getString("Email"));
				hdb.setDienThoai(rs.getString("DienThoai"));
				hdb.setDiaChi(rs.getString("DiaChi"));
				hdb.setPhiGiaoHang(rs.getFloat("PhiGiaoHang"));
				hdb.setTongTien(rs.getFloat("TongTien"));
				hdb.setNgayDat(rs.getDate("NgayDat"));
				hdb.setNgayGiao(rs.getDate("NgayGiao"));
				hdb.setTinhTrangDH(rs.getString("TinhTrangDH"));
				hdb.setMaNVGiao(rs.getInt("MaNVGiao"));
				hdb.setMaKH(rs.getInt("MaKH"));
				
				dsDonHang.add(hdb);
			}
			conn.commit();
			return dsDonHang;
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn danh sách HoaDonBan theo MaKH: " + e.toString());
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

	@Override
	public List<HoaDonBan> dsDonHang() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
