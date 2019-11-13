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
		String maSach = request.getParameter("MaSach");
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
			Map<String, Integer> chiTiet = null;
			SachDao sachDao = new SachDao();
			Sach sach = sachDao.getSachTheoMaSach(maSach);
			
			if( gioHang == null ) {
				danhSachChiTietGioHang = new HashMap<String, Object>();
				
				chiTiet = new HashMap<String, Integer>();
				chiTiet.put("SoLuongDB", sach.getSoLuong() - soLuong);
				chiTiet.put("SoLuong", soLuong);
				
				danhSachChiTietGioHang.put(maSach, chiTiet);
				
				GioHangMoi = new HashMap<String, Object>();
				GioHangMoi.put("DanhSachChiTietGioHang", danhSachChiTietGioHang);
				session.setAttribute("GioHang", GioHangMoi);
			}else {
				danhSachChiTietGioHang = (Map)gioHang.get("DanhSachChiTietGioHang");
				if( danhSachChiTietGioHang.get(maSach) == null ) {
					chiTiet = new HashMap<String, Integer>();
					chiTiet.put("SoLuongDB", sach.getSoLuong() - soLuong);
					chiTiet.put("SoLuong", soLuong);
					
					danhSachChiTietGioHang.put(maSach, chiTiet);
				}
				else {
					chiTiet = (Map)danhSachChiTietGioHang.get(maSach);
					int soLuongDBMoi = chiTiet.get("SoLuongDB") - soLuong;
					int soLuongMoi = chiTiet.get("SoLuong") + soLuong;
					chiTiet.put("SoLuongDB", soLuongDBMoi);
					chiTiet.put("SoLuong", soLuongMoi);
					
					danhSachChiTietGioHang.put(maSach, chiTiet);
				}
				gioHang.put("DanhSachChiTietGioHang", danhSachChiTietGioHang);
				session.setAttribute("GioHang", gioHang);
			}
			
			//In Giỏ hàng để test
			if( gioHang != null ) {
				System.out.println("\n--------- Giỏ Hàng ---------\n");
				for(int i = 0; i < gioHang.size(); i++) {
					danhSachChiTietGioHang = (Map<String, Object>)gioHang.get("DanhSachChiTietGioHang");
					Iterator iterator =  danhSachChiTietGioHang.entrySet().iterator();
					while (iterator.hasNext()) {
						Map.Entry ketQua = (Map.Entry)iterator.next();
						System.out.println(ketQua.getKey() +":" + ketQua.getValue());
					}
				}
			}
			
			//Phần chuyển hướng
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
