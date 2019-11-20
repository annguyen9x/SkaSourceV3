package model;

import java.util.Date;

public class HoaDon {
	private int soHD;
	private int idNN;
	private float phiGiaoHang;
	private float tongTien;
	private Date ngayDat;
	private Date ngayGiao;
	private String tinhTrangDH;
	private int maNVGiao;
	private int maKH;
	
	public HoaDon() {
	}
	
	public HoaDon( int idNN, float phiGiaoHang, float tongTien, Date ngayDat, String tinhTrangDH, int maKH) {
		super();
		this.idNN = idNN;
		this.phiGiaoHang = phiGiaoHang;
		this.tongTien = tongTien;
		this.ngayDat = ngayDat;
		this.tinhTrangDH = tinhTrangDH;
		this.maKH = maKH;
	}
	
	public HoaDon(int soHD, int idNN, float phiGiaoHang, float tongTien, Date ngayDat, Date ngayGiao,
			String tinhTrangDH, int maNVGiao, int maKH) {
		super();
		this.soHD = soHD;
		this.idNN = idNN;
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

	public int getIdNN() {
		return idNN;
	}

	public void setIdNN(int idNN) {
		this.idNN = idNN;
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
