package model;

import java.sql.Date;

public class HoaDonBan {
	private int soHD;
	private String tenNN;
	private String email;
	private String dienThoai;
	private String diaChi;
	private float phiGiaoHang;
	private float tongTien;
	private Date ngayDat;
	private Date ngayGiao;
	private String tinhTrangDH;
	private int maNVGiao;
	private int maKH;
	
	public HoaDonBan() {
		
	}
	
	public HoaDonBan(int soHD, String tenNN, String email, String dienThoai, String diaChi, float phiGiaoHang,
			float tongTien, Date ngayDat, Date ngayGiao, String tinhTrangDH, int maNVGiao, int maKH) {
		super();
		this.soHD = soHD;
		this.tenNN = tenNN;
		this.email = email;
		this.dienThoai = dienThoai;
		this.diaChi = diaChi;
		this.phiGiaoHang = phiGiaoHang;
		this.tongTien = tongTien;
		this.ngayDat = ngayDat;
		this.ngayGiao = ngayGiao;
		this.tinhTrangDH = tinhTrangDH;
		this.maNVGiao = maNVGiao;
		this.maKH = maKH;
	}

	public int getSoHD() {
		return soHD;
	}
	public void setSoHD(int soHD) {
		this.soHD = soHD;
	}
	public String getTenNN() {
		return tenNN;
	}
	public void setTenNN(String tenNN) {
		this.tenNN = tenNN;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDienThoai() {
		return dienThoai;
	}
	public void setDienThoai(String dienThoai) {
		this.dienThoai = dienThoai;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public float getPhiGiaoHang() {
		return phiGiaoHang;
	}
	public void setPhiGiaoHang(float phiGiaoHang) {
		this.phiGiaoHang = phiGiaoHang;
	}
	public float getTongTien() {
		return tongTien;
	}
	public void setTongTien(float tongTien) {
		this.tongTien = tongTien;
	}
	public Date getNgayDat() {
		return ngayDat;
	}
	public void setNgayDat(Date ngayDat) {
		this.ngayDat = ngayDat;
	}
	public Date getNgayGiao() {
		return ngayGiao;
	}
	public void setNgayGiao(Date ngayGiao) {
		this.ngayGiao = ngayGiao;
	}
	public String getTinhTrangDH() {
		return tinhTrangDH;
	}
	public void setTinhTrangDH(String tinhTrangDH) {
		this.tinhTrangDH = tinhTrangDH;
	}
	public int getMaNVGiao() {
		return maNVGiao;
	}
	public void setMaNVGiao(int maNVGiao) {
		this.maNVGiao = maNVGiao;
	}
	public int getMaKH() {
		return maKH;
	}
	public void setMaKH(int maKH) {
		this.maKH = maKH;
	}
	
}
