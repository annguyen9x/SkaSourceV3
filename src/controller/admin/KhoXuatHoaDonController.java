package controller.admin;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.KetNoiDatabase;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.export.ExporterInput;
import net.sf.jasperreports.export.OutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;
import net.sf.jasperreports.export.SimplePdfExporterConfiguration;

@WebServlet("/KhoXuatHoaDon")
public class KhoXuatHoaDonController extends HttpServlet {
	protected static Connection conn;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String soHD = request.getParameter("soHD").trim();
		String IDNN = request.getParameter("IDNN").trim();
		
		try {
			String user = "sa";
			String password = "123456";
			String url = "jdbc:sqlserver://localhost:1433; databaseName=SachKyAnh";
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			conn = DriverManager.getConnection(url, user, password);

			JasperReport jasperReport = null;
			JasperDesign jasperDesign = null;
			
			Map parameters = new HashMap();
			parameters.put("soHD", soHD);
			parameters.put("IDNN", IDNN);
	
			String path = getServletContext().getRealPath("/WEB-INF/");
			jasperDesign = JRXmlLoader.load(path + "/HoaDon.jrxml");
			jasperReport = JasperCompileManager.compileReport(jasperDesign);
			byte[] byteStream = JasperRunManager.runReportToPdf(jasperReport, parameters, conn);
			OutputStream outStream = response.getOutputStream();
			response.setContentType("application/pdf");
			response.setContentLength(byteStream.length);
			outStream.write(byteStream, 0, byteStream.length);
			
		} catch (ClassNotFoundException e) {
			System.out.println("Loi load driver: " + e.toString());
		} catch (SQLException e) {
			 System.out.println("Loi duong dan sqlserver: " + e.toString());
		} catch (JRException e) {
			e.printStackTrace();
		}
	}

}
