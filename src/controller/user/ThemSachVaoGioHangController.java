package controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ThemSachVaoGioHang", urlPatterns = { "/ThemSachVaoGioHang" })
public class ThemSachVaoGioHangController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String maSach = request.getParameter("MaSach");
		int soLuong = Integer.parseInt(request.getParameter("SoLuong"));
		
		
		PrintWriter writer = response.getWriter();
		writer.print("MaSach: " + maSach+", soLuong: " + soLuong);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
