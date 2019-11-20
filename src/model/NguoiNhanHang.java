package model;

public class NguoiNhanHang {
	private int idNN;
	private String tenNN;
	private String email;
	private String dienThoai;
	private String diaChi;
	
	public NguoiNhanHang() {
	}
	
	public NguoiNhanHang(String tenNN, String email, String dienThoai, String diaChi) {
		super();
		this.tenNN = tenNN;
		this.email = email;
		this.dienThoai = dienThoai;
		this.diaChi = diaChi;
	}

	public NguoiNhanHang(int idNN, String tenNN, String email, String dienThoai, String diaChi) {
		super();
		this.idNN = idNN;
		this.tenNN = tenNN;
		this.email = email;
		this.dienThoai = dienThoai;
		this.diaChi = diaChi;
	}

	public int getIdNN() {
		return idNN;
	}

	public void setIdNN(int idNN) {
		this.idNN = idNN;
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
	
}
