package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KetNoiDatabase {
	protected static Connection conn;
	
	public KetNoiDatabase() {
		
		//Connect to postgresql local
//		String user = "sa";
//		String password = "123456";
//		String url = "jdbc:sqlserver://localhost:1433; databaseName=SachKyAnh";
		
		//Connect to postgresql local
//		String user = "postgres";
//		String password = "123456";
//		String url = "jdbc:postgresql://localhost/SachKyAnh";
		
		//Connect to postgresql heroku
		String host = "ec2-52-201-184-16.compute-1.amazonaws.com";
		String port = "5432";
		String db = "dat5h0nfceu4d8";
		String user = "qgdojvwxrnvobp";
		String password = "5b85a636b97b408a936720286738451de370ef1be96b22df635affb35860aaba";
		String url = "jdbc:postgresql://" + host + ":"+port+"/" + db;
		try {
			//Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection(url, user, password);
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
