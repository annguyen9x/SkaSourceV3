package dao;

import java.util.List;
import java.util.Map;

import model.Sach;

public interface ITFSachDao {
	
	boolean insert(Sach sach);
	
	boolean update(Sach sach);
	
	boolean delete(Sach sach);
	
	Sach getSachTheoMaSach(String maSach);
	
	List<Sach> dsSachNoiBat(int soLuong);
	
	List<Sach> dsSachMoi(int soLuong);
	
	List<Sach> dsTenSachTheoLoaiSach(String maLoaiSach);
	
	List<Sach> dsSachTheoTenSach(String tenSach);
	
	Map<Integer, List<Sach>> hienThiSachTheoLoaiSach(String maLoaiSach);
	
	List<Sach> timKiemSach(String tenSach);
	
}
