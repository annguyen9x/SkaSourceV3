package util;

public class ConnectDBUtil {
	
	public interface DBProperties{
		
		//Connect to sqlserver local
		String SQLSERVER_USER = "sa";
		String SQLSERVER_PASSWORD = "123456";
		String SQLSERVER_URL = "jdbc:sqlserver://localhost:1433; databaseName=SachKyAnh";
		String SQLSERVER_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		
		//Connect to postgresql local
		String POSTGRESQL_USER = "postgres";
		String POSTGRESQL_PASSWORD = "123456";
		String POSTGRESQL_URL = "jdbc:postgresql://localhost/SachKyAnh";
		
		//Connect to postgresql heroku
		String HEROKU_POSTGRESQL_HOST = "ec2-52-201-184-16.compute-1.amazonaws.com";
		String HEROKU_POSTGRESQL_PORT = "5432";
		String HEROKU_POSTGRESQL_DB = "dat5h0nfceu4d8";
		String HEROKU_POSTGRESQL_USER = "qgdojvwxrnvobp";
		String HEROKU_POSTGRESQL_PASSWORD = "5b85a636b97b408a936720286738451de370ef1be96b22df635affb35860aaba";
		String HEROKU_POSTGRESQL_URL = "jdbc:postgresql://" + HEROKU_POSTGRESQL_HOST + ":" + HEROKU_POSTGRESQL_PORT + "/" + HEROKU_POSTGRESQL_DB;
		String HEROKU_POSTGRESQL_DRIVER = "org.postgresql.Driver";
	}
}
