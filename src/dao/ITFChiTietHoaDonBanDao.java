package dao;

import java.util.HashMap;

import model.HoaDonBan;

public interface ITFChiTietHoaDonBanDao {
	
	boolean insert(HoaDonBan hdb);
	
	boolean update(HoaDonBan hdb);
	
	boolean delete(int soHDB);
	
	HashMap<String, Object> xemThongTinDonHang(int soHDB);
}
