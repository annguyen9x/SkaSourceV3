package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.LoaiSach;

public class LoaiSachDao implements ITFLoaiSachDao{
	private KetNoiDatabase ketNoiDatabase;
	private Connection conn;
	private PreparedStatement pStatement;
	private ResultSet rs;
	private ResultSetMetaData rsmData;
	
	@Override
	public boolean insert(LoaiSach ls) {
		return false;
	}

	@Override
	public boolean update(LoaiSach ls) {
		return false;
	}

	@Override
	public boolean delete(LoaiSach ls) {
		return false;
	}

	@Override
	public LoaiSach getLoaiSach(String maLS) {
		ketNoiDatabase = new KetNoiDatabase();
		LoaiSach loaiSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaLoaiSach, TenLoaiSach From LoaiSach Where MaLoaiSach=?";
			pStatement = conn.prepareStatement(sql);
			pStatement.setString(1, maLS);
			rs = pStatement.executeQuery();
			if( rs.next() ) {
				loaiSach = new LoaiSach();
				loaiSach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				loaiSach.setTenLoaiSach(rs.getNString("TenLoaiSach"));
			}
			conn.commit();
			return loaiSach;
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn danh sách LoaiSach: " + e.toString());
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
	public List<LoaiSach> getDSLoaiSach() {
		ketNoiDatabase = new KetNoiDatabase();
		List<LoaiSach> dsLoaiSach = null;
		try {
			conn = KetNoiDatabase.getConn();
			conn.setAutoCommit(false);
			String sql = "Select MaLoaiSach, TenLoaiSach From LoaiSach";
			pStatement = conn.prepareStatement(sql);
			rs = pStatement.executeQuery();
			dsLoaiSach = new ArrayList<LoaiSach>();
			while( rs.next() ) {
				LoaiSach loaiSach = new LoaiSach();
				loaiSach.setMaLoaiSach(rs.getString("MaLoaiSach"));
				loaiSach.setTenLoaiSach(rs.getNString("TenLoaiSach"));
				dsLoaiSach.add(loaiSach);
			}
			conn.commit();
			return dsLoaiSach;
		} catch (SQLException e) {
			System.out.println("Lỗi truy vấn danh sách LoaiSach: " + e.toString());
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
	public List<LoaiSach> hienThiMenuDoc() {
		List<LoaiSach> dsLoaiSach = this.getDSLoaiSach();
		if( dsLoaiSach != null ) {
			return dsLoaiSach;
		}
		return null;
	}

}
