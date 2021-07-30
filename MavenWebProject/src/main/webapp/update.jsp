<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dbconn.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update</title>
</head>
<%
Connection con=null;
PreparedStatement ps=null;
String uname=(String)session.getAttribute("uname");
String email=request.getParameter("email");
String password=request.getParameter("password");
String contact=request.getParameter("contact");
try{
	DBConn dbConn=DBConn.getInstance();
	con=dbConn.getConnection();
	ps=con.prepareStatement("Update user set uemail=?,password=?,contact=? where uname=?");
	ps.setString(1, email);
	ps.setString(2, password);
	ps.setString(3, contact);
	ps.setString(4, uname);
	int x=ps.executeUpdate();
	if(x>0)
	{
		response.sendRedirect("welcome.jsp");
	}
}catch(SQLException e)
{
	e.printStackTrace();
}
%>
</html>