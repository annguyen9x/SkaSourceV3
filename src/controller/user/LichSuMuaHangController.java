package controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HoaDonBanDao;
import model.HoaDonBan;
import model.KhachHang;

@WebServlet(name = "LichSuMuaHang", urlPatterns = { "/LichSuMuaHang" })
public class LichSuMuaHangController extends HttpServlet {
	HoaDonBanDao hoaDonBanDao = new HoaDonBanDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		KhachHang khachHang = (KhachHang)session.getAttribute("TaiKhoan");
		if(khachHang != null ) {
			List<HoaDonBan> dsDonHang = hoaDonBanDao.dsDonHangTheoKhachHang(khachHang.getMaKH());
			request.setAttribute("DanhSachHoaDon", dsDonHang);
			request.getRequestDispatcher("/view/user/view/lichsu_muahang.jsp").forward(request, response);;
		}else {
			PrintWriter writer = response.getWriter();
			writer.print("<script type='text/javascript'>");
			writer.print("alert('Vui lòng đăng nhập tài khoản trước !');");
			writer.print("location='userTrangChu';");
			writer.print("</script>");
		}
	}

}
