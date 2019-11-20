package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.SachDao;
import model.Sach;
import util.KiemTraKieuSo;

@WebServlet(name = "ThemSachVaoGioHang", urlPatterns = { "/ThemSachVaoGioHang" })
public class ThemSachVaoGioHangController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		String maSach = request.getParameter("MaSach").trim();
		int soLuong = Integer.parseInt(request.getParameter("SoLuong").trim());
		
		HttpSession session = request.getSession();
		Map<String, Object> gioHang = (Map)session.getAttribute("GioHang");//khachHang, dsChiTietGH
		
		if( session.getAttribute("CapNhatDonHang") != null ) {
			if(gioHang != null ) {
				session.removeAttribute("GioHang");//Xóa giỏ hàng nếu đang mua hàng, tạo giỏ hàng mới
			}
			session.removeAttribute("CapNhatDonHang");
			//Đổ dữ liệu từ đơn hàng sang giỏ hàng, rồi cập nhật trên đơn hàng sau đó lưu database
		}else {
			Map<String, Object> GioHangMoi = null;
			Map<String, Object> danhSachChiTietGioHang = null;
			Map<String, Object> chiTietGioHang = null;
			
			SachDao sachDao = new SachDao();
			
			if( gioHang == null ) {
				danhSachChiTietGioHang = new HashMap<String, Object>();
				
				Sach sach = sachDao.getSachTheoMaSach(maSach);
				
				chiTietGioHang = new HashMap<String, Object>();
				chiTietGioHang.put("TenSach", sach.getTenSach());
				chiTietGioHang.put("UrlHinh", sach.getUrlHinh());
				chiTietGioHang.put("DonGia", sach.getDonGia());
				chiTietGioHang.put("SoLuongDB", sach.getSoLuong() - soLuong);
				chiTietGioHang.put("TongSoLuongDB", sach.getSoLuong());
				chiTietGioHang.put("SoLuong", soLuong);
				
				danhSachChiTietGioHang.put(maSach, chiTietGioHang);
				
				GioHangMoi = new HashMap<String, Object>();
				GioHangMoi.put("DanhSachChiTietGioHang", danhSachChiTietGioHang);
				session.setAttribute("GioHang", GioHangMoi);
			}else {
				danhSachChiTietGioHang = (Map)gioHang.get("DanhSachChiTietGioHang");
				if( danhSachChiTietGioHang.get(maSach) == null ) {
					Sach sach = sachDao.getSachTheoMaSach(maSach);
					
					chiTietGioHang = new HashMap<String, Object>();
					chiTietGioHang.put("TenSach", sach.getTenSach());
					chiTietGioHang.put("UrlHinh", sach.getUrlHinh());
					chiTietGioHang.put("DonGia", sach.getDonGia());
					chiTietGioHang.put("SoLuongDB", sach.getSoLuong() - soLuong);
					chiTietGioHang.put("TongSoLuongDB", sach.getSoLuong());
					chiTietGioHang.put("SoLuong", soLuong);
					
					danhSachChiTietGioHang.put(maSach, chiTietGioHang);
				}
				else {
					
					Sach sach = sachDao.getSachTheoMaSach(maSach);
					
					chiTietGioHang = (Map)danhSachChiTietGioHang.get(maSach);
					int soLuongDBMoi;
					int soLuongDBTrongGioHang = (int)chiTietGioHang.get("SoLuongDB");
					if( soLuongDBTrongGioHang > sach.getSoLuong() ) {
						soLuongDBMoi = sach.getSoLuong()-soLuong;
					}else {
						soLuongDBMoi = ((int)chiTietGioHang.get("SoLuongDB") - soLuong);
					}
					chiTietGioHang.put("SoLuongDB", soLuongDBMoi);
					chiTietGioHang.put("TongSoLuongDB", sach.getSoLuong());
					
					int soLuongMoi = (int)chiTietGioHang.get("SoLuong") + soLuong;
					chiTietGioHang.put("SoLuong", soLuongMoi);
					
					danhSachChiTietGioHang.put(maSach, chiTietGioHang);
				}
				gioHang.put("DanhSachChiTietGioHang", danhSachChiTietGioHang);
				session.setAttribute("GioHang", gioHang);
			}
			
			//In Giỏ hàng để test
			if( gioHang != null ) {
				System.out.println("\n--------- Gio Hang  ---------\n");
				for(int i = 0; i < gioHang.size(); i++) {
					danhSachChiTietGioHang = (Map<String, Object>)gioHang.get("DanhSachChiTietGioHang");
					Iterator iterator =  danhSachChiTietGioHang.entrySet().iterator();
					while (iterator.hasNext()) {
						Map.Entry ketQua = (Map.Entry)iterator.next();
						System.out.println(ketQua.getKey() +":" + ketQua.getValue());
					}
				}
			}
			
			//Phần chuyển trang
			String url = request.getParameter("DuongDan");
			if( url != null &&  url.equals("/view/user/view/chitiet_sp.jsp")) {
				response.sendRedirect("/SachKyAnh/ChiTietSach?MaSach="+maSach);
			}
			else if( url != null && url.equals("/view/user/view/sp_cungloai.jsp")) {
				String maLoaiSach = sachDao.getSachTheoMaSach(maSach).getMaLoaiSach();
				response.sendRedirect("/SachKyAnh/SachTheoLoaiSach?MaLoaiSach="+maLoaiSach);
			}
			else {
				response.sendRedirect("/SachKyAnh/userTrangChu");
			}
		}
		
	}

}
