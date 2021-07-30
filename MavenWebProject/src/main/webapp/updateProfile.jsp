<%
if(session.getAttribute("uname")!=null)
{
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dbconn.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link href="css/style.css" rel="stylesheet">
<title>Profile</title>
</head>
<body>
<header class="text-gray-600 body-font">
  <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
    <a class="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="w-10 h-10 text-white p-2 bg-indigo-500 rounded-full" viewBox="0 0 24 24">
        <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"></path>
      </svg>
      <span class="ml-3 text-xl">CarDekho.com</span>
    </a>
    <nav class="md:mr-auto md:ml-4 md:py-1 md:pl-4 md:border-l md:border-gray-400	flex flex-wrap items-center text-base justify-center">
      <a class="mr-5 hover:text-gray-900" href="welcome.jsp">Home</a>
      <a class="mr-5 hover:text-gray-900" href="about.jsp">About</a>
      <a class="mr-5 hover:text-gray-900" href="LogoutServlet">Logout</a>
    </nav>
    <div class="rounded">
    <img class= "object-cover relative rounded-full border
          border-gray-100 shadow-sm" src="DisplayImage" />
  </div>
    <button class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0"><a href="updateProfile.jsp"><%=session.getAttribute("uname") %></a>
    </button>
     
  </div>
</header>
	<%
	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	try{
		String uname=(String)session.getAttribute("uname");
		DBConn dbConn=DBConn.getInstance();
		con=dbConn.getConnection();
		stmt=con.createStatement();
		rs=stmt.executeQuery("Select * from user where uname='"+uname+"'");
		if(rs.next())
		{
			%>
			<section class="text-gray-600 body-font">
<div class="container px-5 py-24 mx-auto flex flex-wrap">
    <div class="lg:w-1/2 w-full mb-10 lg:mb-0 rounded-lg overflow-hidden">
      <img alt="feature" class="object-cover object-center h-full w-full" src="https://indiaautoz.in/wp-content/uploads/2018/03/Tata-H5X.jpg">
    </div>
	<div class="lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
      <h2 class="text-gray-900 text-lg font-medium title-font mb-5">Profile</h2>
      <form action="update.jsp" method="POST">
      <div class="relative mb-4">
        <label for="full-name" class="leading-7 text-sm text-gray-600">Name</label>
        <input type="text" id="email" name="name" value="<%=rs.getString("uname") %>" class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"/>
      </div>
      <div class="relative mb-4">
        <label for="full-name" class="leading-7 text-sm text-gray-600">Email</label>
        <input type="email" id="email" name="email" value="<%=rs.getString("uemail") %>" class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"/>
      </div>
      <div class="relative mb-4">
        <label for="email" class="leading-7 text-sm text-gray-600">Password</label>
        <input type="password" id="email" name="password" value="<%=rs.getString("password") %>"class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"/>
      </div>
      <div class="relative mb-4">
        <label for="full-name" class="leading-7 text-sm text-gray-600">Contact</label>
        <input type="text" id="email" name="contact" value="<%=rs.getString("contact") %>" class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"/>
      </div>
      <button type="submit" class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg" >Update</button>
     </form>
     <form action="UpdateServlet" method="POST" enctype="multipart/form-data">
     	
     <div class="relative mb-4">
        <label for="full-name" class="leading-7 text-sm text-gray-600">Image</label>
        <input type="file" id="email" name="image" class="w-full bg-white rounded border border-gray-300 focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 leading-8 transition-colors duration-200 ease-in-out"/>
      </div>
     	<button type="submit" class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg" >Update Picture</button>
     </form>
    </div>
    </div>
    </section>
			<%
		}
	}catch(SQLException e)
	{
		System.out.println(e.getMessage());
	}
	%>
<%@include file="footer.jsp" %>
</body>
</html>
<%
if(session.getMaxInactiveInterval()>3*60)
{
	session.invalidate();
	ServletContext context=getServletContext();
	context.setAttribute("msg","Session Expired..");
	response.sendRedirect("error.jsp");
}
}

else{
	session.invalidate();
	ServletContext context=getServletContext();
	context.setAttribute("msg","Error...Login Again");
	response.sendRedirect("error.jsp");
}

%>