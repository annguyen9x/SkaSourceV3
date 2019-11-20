package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.HoaDon;
import model.NguoiNhanHang;
import util.KiemTraNgayThang;

public class HoaDonDao implements ITFHoaDonDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	
	
	@Override
	public int insert(HoaDon hd) {
		ketNoiDatabase = new KetNoiDatabase();
		try {
			conn = ketNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Insert into HoaDon(IDNN, PhiGiaoHang, TongTien, NgayDat, TinhTrangDH, MaKH) Values(?,?,?,?,?,?)";
			pStatement = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pStatement.setInt(1, hd.getIdNN());
			pStatement.setFloat(2, hd.getPhiGiaoHang());
			pStatement.setFloat(3, hd.getTongTien());
			SimpleDateFormat dateFormat = new SimpleDateFormat(KiemTraNgayThang.DATE_FORMAT);
			pStatement.setString(4, dateFormat.format(hd.getNgayDat()));
			pStatement.setNString(5, hd.getTinhTrangDH());
			if( hd.getMaKH() == 0 ) {
				pStatement.setNull(6, java.sql.Types.INTEGER);
			}else {
				pStatement.setInt(6, hd.getMaKH());
			}
			pStatement.executeUpdate();
			int soHD = -1;
			rs = pStatement.getGeneratedKeys();
			if( rs.next() ) {
				soHD = rs.getInt(1);
			}
			conn.commit();
			return soHD;
		} catch (SQLException e) {
			System.out.println("Loi insert HoaDon: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		return -1;
	}

	@Override
	public boolean update(HoaDon hd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int soHD) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<HoaDon> dsDonHangTheoTinhTrang(String tinhTrangDH) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Object> dsDonHangTheoKhachHang(int maKH) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Object> dsDonHang = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select SoHD, HoaDon.IDNN, TenNN, Email, DienThoai, DiaChi, PhiGiaoHang, TongTien, NgayDat, NgayGiao, TinhTrangDH, MaNVGiao, MaKH " + 
						 "From HoaDon Join NguoiNhanHang " + 
						 "On HoaDon.IDNN = NguoiNhanHang.IDNN And MaKH=? ";
			pStatement = conn.prepareStatement(sql);
			pStatement.setInt(1, maKH);
			rs = pStatement.executeQuery();
			dsDonHang = new ArrayList<Object>();
			while( rs.next() ) {
				Map<String, Object>  chiTietDonHang = new HashMap<String, Object>();
				
				NguoiNhanHang nguoiNhanHang = new NguoiNhanHang();
				nguoiNhanHang.setIdNN(rs.getInt("IDNN"));
				nguoiNhanHang.setTenNN((rs.getString("TenNN")));
				nguoiNhanHang.setEmail(rs.getString("Email"));
				nguoiNhanHang.setDienThoai(rs.getString("DienThoai"));
				nguoiNhanHang.setDiaChi(rs.getString("DiaChi"));
				
				HoaDon hdb = new HoaDon();
				hdb.setSoHD(rs.getInt("SoHD"));
				hdb.setIdNN(rs.getInt("IDNN"));
				hdb.setPhiGiaoHang(rs.getFloat("PhiGiaoHang"));
				hdb.setTongTien(rs.getFloat("TongTien"));
				hdb.setNgayDat(rs.getDate("NgayDat"));
				hdb.setNgayGiao(rs.getDate("NgayGiao"));
				hdb.setTinhTrangDH(rs.getString("TinhTrangDH"));
				hdb.setMaNVGiao(rs.getInt("MaNVGiao"));
				hdb.setMaKH(rs.getInt("MaKH"));
				
				chiTietDonHang.put("HoaDon",hdb);
				chiTietDonHang.put("NguoiNhanHang",nguoiNhanHang);
				dsDonHang.add(chiTietDonHang);
			}
			conn.commit();
			return dsDonHang;
		} catch (SQLException e) {
			System.out.println("Loi truy van danh sach DonHang theo MaKH: " + e.toString());
			try {
                conn.rollback();
            } catch (SQLException ex1) {
                System.out.println("Loi rollback");
            }
		}finally {
			try {
				pStatement.close();
			} catch (SQLException e) {
				System.out.println("Loi dong ket noi PreparedStatement: " + e.toString());
			}
			ketNoiDatabase.closeConnection(conn);
		}
		
		return null;
	}

	@Override
	public List<HoaDon> dsDonHang() {
		// TODO Auto-generated method stub
		return null;
	}

}
