package dbconn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn {
	public static DBConn dbConn=null;
	public static Connection con=null;
	public static final String URL="jdbc:mysql://localhost:3306/webapp";
	private DBConn() {}
	public static DBConn getInstance()
	{
		if(dbConn==null)
		{
			dbConn=new DBConn();
		}
		return dbConn;
	}
	
	public Connection getConnection()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(URL,"root","");
		} catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return con;
	}
}