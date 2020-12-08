package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "GiaoHangTrangChu", urlPatterns = { "/GiaoHangTrangChu" })
public class GiaoHangTrangChuController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if( session.getAttribute("DsDonHangChon") != null ) {
			session.removeAttribute("DsDonHangChon");
		}
		response.sendRedirect("/view/admin/view/giaohang_trangchu.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8"); 
		
		String dsDonHangChon = (String)request.getParameter("DsDonHangChon");
		HttpSession session = request.getSession();
		if( session.getAttribute("DsDonHangChon") != null ) {
			session.removeAttribute("DsDonHangChon");
		}
		session.setAttribute("DsDonHangChon", dsDonHangChon);
		response.sendRedirect("/view/admin/view/giaohang_trangchu.jsp");
	}

}
