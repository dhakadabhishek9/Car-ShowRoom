package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dbconn.DBConn;
import model.Admin;
import model.Users;

public class DAO {
	private static Connection con=null;
	private static PreparedStatement ps=null;
	private static ResultSet rs=null;
	private static DBConn dbConn=DBConn.getInstance();
	
	public static String regUser(Users user)
	{
		
		String uname=user.getUname();
		String email=user.getUemail();
		String pass=user.getUpass();
		String contact=user.getUcontact();
		
		try {
			con=dbConn.getConnection();
			ps=con.prepareStatement("Insert into user(uname,uemail,password,contact,image) values(?,?,?,?,LOAD_FILE('C:/Users/hp/Downloads/user.jpg'))");
			ps.setString(1, uname);
			ps.setString(2, email);
			ps.setString(3, pass);
			ps.setString(4, contact);
			int x=ps.executeUpdate();
			if(x>0)
			{
				return "SUCCESS";
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return "User Already Exists";
		
	}
	
	public static String loginUser(Users user) {
		String email=user.getUemail();
		String pass=user.getUpass();
		try {
			con=dbConn.getConnection();
			ps=con.prepareStatement("Select * from user where uemail=? and password=?");
			ps.setString(1, email);
			ps.setString(2, pass);
			rs=ps.executeQuery();
			if(rs.next())
				return rs.getString("uname");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public static String loginAdmin(Admin admin)
	{
		String email=admin.getEmail();
		String password=admin.getPassword();
		try {
			con=dbConn.getConnection();
			ps=con.prepareStatement("Select * from admin where uemail=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next())
				return "Admin";
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
}
