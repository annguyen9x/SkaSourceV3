package controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CapNhatGioHang", urlPatterns = { "/CapNhatGioHang" })
public class CapNhatGioHangController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().print("Cap nhat Gio Hang");
		System.out.println("Cap nhat Gio Hang");
	}

}
