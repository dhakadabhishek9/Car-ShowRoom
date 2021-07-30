<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.*,java.sql.*,dbconn.*,javax.mail.*,javax.mail.internet.*" %>
<%
String email=request.getParameter("email");
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
String passwd=null;
try{
	DBConn dbcon=DBConn.getInstance();
	con=dbcon.getConnection();
	ps=con.prepareStatement("Select password from user where uemail=?");
	ps.setString(1, email);
	rs=ps.executeQuery();
	if(rs.next())
	{
		passwd=rs.getString("password");
		
		Properties p=new Properties();
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "25");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.user", "admin@gmail.com");
		
		Session ses=Session.getDefaultInstance(p);
		Message m=new MimeMessage(ses);
		String username="dhakadabhishek9@gmail.com";
		String password="Abhi@41099";
		
		m.setFrom(new InternetAddress(username));
		InternetAddress[] toAddress={new InternetAddress(email)};
		m.setRecipients(Message.RecipientType.TO, toAddress);
		m.setSubject("Find Password");
		m.setText("Your Password is: "+passwd);
		
		Transport transport=ses.getTransport("smtp");
		transport.connect(username,password);
		transport.sendMessage(m,m.getAllRecipients());
		transport.close();
		response.sendRedirect("login.jsp?=Mail+Sent");
	}
	else
	{
		out.println("<script type=\"text/javascript\">");
		   out.println("alert('Email Not Found ;(');");
		   out.println("location='forgot.jsp';");
		   out.println("</script>");
	}
}
catch(SQLException e)
{
	out.println(e.getMessage());
}

%>