package dao;

import java.util.List;

import model.HoaDonBan;

public interface ITFHoaDonBanDao {
	
	boolean insert(HoaDonBan hdb);
	
	boolean update(HoaDonBan hdb);
	
	boolean delete(int soHDB);
	
	List<HoaDonBan> dsDonHangTheoTinhTrang(String tinhTrangDH);
	
	List<HoaDonBan> dsDonHangTheoKhachHang(int maKH);
	
	List<HoaDonBan> dsDonHang();
}
