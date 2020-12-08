package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import util.ConnectDBUtil;

public class KetNoiDatabase {
	protected static Connection conn;
	
	public KetNoiDatabase() {
		
		try {
			Class.forName(ConnectDBUtil.DBProperties.HEROKU_POSTGRESQL_DRIVER);
			conn = DriverManager.getConnection(ConnectDBUtil.DBProperties.HEROKU_POSTGRESQL_URL, ConnectDBUtil.DBProperties.HEROKU_POSTGRESQL_USER, ConnectDBUtil.DBProperties.HEROKU_POSTGRESQL_PASSWORD);
		} catch (ClassNotFoundException e) {
			System.out.println("Loi load driver: " + e.toString());
		} catch (SQLException e) {
			 System.out.println("Loi duong dan sql: " + e.toString());
		}
	}
	
	public static void closeConnection(Connection conn) {
		try {
			conn.close();
		} catch (SQLException e) {
			System.out.println("Loi dong ket noi");
		}
	}
	
	public static Connection getConn() {
		return conn;
	}

	public static void setConn(Connection conn) {
		KetNoiDatabase.conn = conn;
	}
	
}
