package model;

import java.sql.Date;

public class HoaDonNhap {
	private String maHDN;
	private String tenNCC;
	private Date ngayNhap;
	private float tongTienNhap;
	private int maNVKho;
	
	public HoaDonNhap() {
	
	}
	
	public HoaDonNhap(String maHDN, String tenNCC, Date ngayNhap, float tongTienNhap, int maNVKho) {
		super();
		this.maHDN = maHDN;
		this.tenNCC = tenNCC;
		this.ngayNhap = ngayNhap;
		this.tongTienNhap = tongTienNhap;
		this.maNVKho = maNVKho;
	}

	public String getMaHDN() {
		return maHDN;
	}
	public void setMaHDN(String maHDN) {
		this.maHDN = maHDN;
	}
	public String getTenNCC() {
		return tenNCC;
	}
	public void setTenNCC(String tenNCC) {
		this.tenNCC = tenNCC;
	}
	public Date getNgayNhap() {
		return ngayNhap;
	}
	public void setNgayNhap(Date ngayNhap) {
		this.ngayNhap = ngayNhap;
	}
	public float getTongTienNhap() {
		return tongTienNhap;
	}
	public void setTongTienNhap(float tongTienNhap) {
		this.tongTienNhap = tongTienNhap;
	}
	public int getMaNVKho() {
		return maNVKho;
	}
	public void setMaNVKho(int maNVKho) {
		this.maNVKho = maNVKho;
	}
	
}
