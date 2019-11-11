package dao;

import java.util.List;

import model.LoaiSach;

public interface ITFLoaiSachDao {
	
	boolean insert(LoaiSach ls);
	
	boolean update(LoaiSach ls);
	
	boolean delete(LoaiSach ls);
	
	LoaiSach getLoaiSach(String maLS);
	
	List<LoaiSach> getDSLoaiSach();
	
	List<LoaiSach> hienThiMenuDoc();
}
