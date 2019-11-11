package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.LoaiSach;
import model.Sach;

public class SachDao implements ITFSachDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	
	@Override
	public boolean insert(Sach sach) {
		return false;
	}

	@Override
	public boolean update(Sach sach) {
		return false;
	}

	@Override
	public boolean delete(Sach sach) {
		return false;
	}

	@Override
	public Sach getSachTheoMaSach(String maSach) {
		ketNoiDatabase = new KetNoiDatabase();
		Sach sach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaSach, TenSach, DonGiaNhap, DonGiaBan, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaHDN, MaLoaiSach " + 
						 "From Sach " + 
						 "Where MaSach= ?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maSach);
			rs = pStatement.executeQuery();
			sach = new Sach ();
			if( rs.next() ) {
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGiaNhap(rs.getFloat("DonGiaNhap"));
				sach.setDonGiaBan(rs.getFloat("DonGiaBan"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaHDN(rs.getString("MaHDN"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));
			}
			conn.commit();
			return sach;
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn sách trong table Sach: " + e.toString());
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
	public List<Sach> dsSachNoiBat(int soLuong) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsSachNoiBat = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select Top "+ soLuong +" MaSach, TenSach, DonGiaNhap, DonGiaBan, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaHDN, MaLoaiSach " + 
						 "From Sach " + 
						 "Order By DonGiaBan DESC ";
			pStatement = conn.prepareStatement(sql);
			rs = pStatement.executeQuery();
			dsSachNoiBat = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGiaNhap(rs.getFloat("DonGiaNhap"));
				sach.setDonGiaBan(rs.getFloat("DonGiaBan"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaHDN(rs.getString("MaHDN"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				
				dsSachNoiBat.add(sach);
			}
			conn.commit();
			return dsSachNoiBat;
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn danh sách SachNoiBat: " + e.toString());
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
	public List<Sach> dsSachMoi(int soLuong) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsSachMoi = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select Top "+ soLuong +" MaSach, TenSach, DonGiaNhap, DonGiaBan, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaHDN, MaLoaiSach " + 
						 "From Sach " + 
						 "Order By NamXB DESC ";
			pStatement = conn.prepareStatement(sql);
			rs = pStatement.executeQuery();
			dsSachMoi = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGiaNhap(rs.getFloat("DonGiaNhap"));
				sach.setDonGiaBan(rs.getFloat("DonGiaBan"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaHDN(rs.getString("MaHDN"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				
				dsSachMoi.add(sach);
			}
			conn.commit();
			return dsSachMoi;
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn danh sách SachMoi: " + e.toString());
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
	public List<Sach> dsTenSachTheoLoaiSach(String maLoaiSach) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsTenSachTheoLoaiSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select TenSach " + 
						 "From Sach " + 
						 "Where MaLoaiSach= ? "+
						 "Group By TenSach";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maLoaiSach);
			rs = pStatement.executeQuery();
			dsTenSachTheoLoaiSach = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setTenSach(rs.getNString("TenSach"));

				dsTenSachTheoLoaiSach.add(sach);
			}
			conn.commit();
			return dsTenSachTheoLoaiSach;
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn danh sách TenSachTheoLoaiSach: " + e.toString());
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
	public List<Sach> dsSachTheoTenSach(String tenSach) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsSachTheoTenSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaSach, TenSach, DonGiaNhap, DonGiaBan, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaHDN, MaLoaiSach " + 
						 "From Sach " + 
						 "Where TenSach=? " +
						 "Order By DonGiaBan ASC";
			pStatement = conn.prepareStatement(sql);
			pStatement.setNString(1, tenSach);
			rs = pStatement.executeQuery();
			dsSachTheoTenSach = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGiaNhap(rs.getFloat("DonGiaNhap"));
				sach.setDonGiaBan(rs.getFloat("DonGiaBan"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaHDN(rs.getString("MaHDN"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				
				dsSachTheoTenSach.add(sach);
			}
			conn.commit();
			return dsSachTheoTenSach;
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn danh sách SachTheoTenSach: " + e.toString());
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
	public Map<Integer, List<Sach>> hienThiSachTheoLoaiSach(String maLoaiSach) {
		
		List<Sach> sTen = this.dsTenSachTheoLoaiSach(maLoaiSach);
		if( sTen != null ) {
			Map<Integer, List<Sach>> mapSach = new HashMap<>();
			for(int i = 0; i < sTen.size(); i++ ) {
				List<Sach> sChiTiet = this.dsSachTheoTenSach(sTen.get(i).getTenSach());
				if(sChiTiet != null) {
					
					List<Sach> listSach = new ArrayList<>();
					for(int j = 0; j < sChiTiet.size(); j++) {
						Sach sach = new Sach();
						sach.setMaSach(sChiTiet.get(j).getMaSach());
						sach.setTenSach(sChiTiet.get(j).getTenSach());
						sach.setDonGiaNhap(sChiTiet.get(j).getDonGiaNhap());
						sach.setDonGiaBan(sChiTiet.get(j).getDonGiaBan());
						sach.setSoLuong(sChiTiet.get(j).getSoLuong());
						sach.setUrlHinh(sChiTiet.get(j).getUrlHinh());
						sach.setNoiDung(sChiTiet.get(j).getNoiDung());
						sach.setTacGia(sChiTiet.get(j).getTacGia());
						sach.setNamXB(sChiTiet.get(j).getNamXB());
						sach.setnXB(sChiTiet.get(j).getnXB());
						sach.setMaHDN(sChiTiet.get(j).getMaHDN());
						sach.setMaLoaiSach(sChiTiet.get(j).getMaLoaiSach());
						
						listSach.add(sach);
					}
					mapSach.put(i, listSach);
				}
			}
			return mapSach;
		}
		return null;
	}

	@Override
	public List<Sach> timKiemSach(String tenSach) {
		ketNoiDatabase = new KetNoiDatabase();
		List<Sach> dsSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaSach, TenSach, DonGiaNhap, DonGiaBan, SoLuong, UrlHinh, NoiDung, TacGia, NamXB, NXB, MaHDN, MaLoaiSach " + 
						 "From Sach " + 
						 "Where TenSach like ? ";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1,"%"+ tenSach +"%");
			rs = pStatement.executeQuery();
			dsSach = new ArrayList<Sach>();
			while( rs.next() ) {
				Sach sach = new Sach();
				sach.setMaSach(rs.getString("MaSach"));
				sach.setTenSach(rs.getNString("TenSach"));
				sach.setDonGiaNhap(rs.getFloat("DonGiaNhap"));
				sach.setDonGiaBan(rs.getFloat("DonGiaBan"));
				sach.setSoLuong(rs.getInt("SoLuong"));
				sach.setUrlHinh(rs.getString("UrlHinh"));
				sach.setNoiDung(rs.getString("NoiDung"));
				sach.setTacGia(rs.getString("TacGia"));
				sach.setNamXB(rs.getInt("NamXB"));
				sach.setnXB(rs.getString("NXB"));
				sach.setMaHDN(rs.getString("MaHDN"));
				sach.setMaLoaiSach(rs.getString("MaLoaiSach"));

				dsSach.add(sach);
			}
			conn.commit();
			return dsSach;
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn danh sách TimKiem: " + e.toString());
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
