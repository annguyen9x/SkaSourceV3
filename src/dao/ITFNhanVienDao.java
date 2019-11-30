package dao;

import java.util.List;

import model.NhanVien;;

public interface ITFNhanVienDao {
	
	boolean insert(NhanVien nv);
	
	boolean update(NhanVien nv);
	
	boolean delete(NhanVien nv);
	
	NhanVien getNhanVien(String email);
	
	NhanVien getNhanVien(int maNV);
	
	List<NhanVien> getDSNhanVienTheoChuVu(String chucVu);
	
	NhanVien dangNhap(String email, String matKhau);
	
	boolean kiemTraEmailTonTai(String email);
	
	boolean kiemTraDienThoaiTonTai(String dienThoai);
}
