package controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HoaDonDao;
import dao.LoaiSachDao;
import dao.SachDao;
import model.LoaiSach;
import model.NhanVien;
import model.Sach;

@WebServlet(name = "PhanQuyenQuanTri", urlPatterns = { "/PhanQuyenQuanTri" })
public class PhanQuyenQuanTriController extends HttpServlet {
	HoaDonDao hoaDonDao = new HoaDonDao();
	SachDao sachDao = new SachDao();
	LoaiSachDao loaiSachDao = new LoaiSachDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		HttpSession session = request.getSession();
		NhanVien nhanvien = (NhanVien)session.getAttribute("NhanVien");
		if(nhanvien != null ) {
			List<Object> dsDonHangVaKhachHang = hoaDonDao.dsDonHangVaKhachHang();
			session.setAttribute("DsDonHangVaKhachHang", dsDonHangVaKhachHang);
			
			if( "Admin".equals(nhanvien.getChucVu()) ) {
				List<LoaiSach> dsLoaiSach = loaiSachDao.getDSLoaiSach();
				List<Sach> dsSach = sachDao.dsSach();
				session.setAttribute("DsLoaiSach", dsLoaiSach);
				session.setAttribute("DsSach", dsSach);
				
				response.sendRedirect("/SachKyAnh/AdminTrangChu");
			}
			else if("Kho".equals(nhanvien.getChucVu()) ) {
				response.sendRedirect("/SachKyAnh/KhoTrangChu");
			}
			else if("Giao Hàng".equals(nhanvien.getChucVu()) ) {
				response.sendRedirect("/SachKyAnh/GiaoHangTrangChu");
			}
			else {
				response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
			}
		}
		else {
			response.sendRedirect("/SachKyAnh/view/admin/view/quantri_dangnhap.jsp");
		}
	}

}
