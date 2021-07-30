<%
if(session.getAttribute("Admin")!=null)
{
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="dbconn.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
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
      <a class="mr-5 hover:text-gray-900" href="LoginServlet">Home</a>
      <a class="mr-5 hover:text-gray-900" href="contact.jsp">Contact</a>
      <a class="mr-5 hover:text-gray-900" href="">Logout</a>
    </nav>
    <button class="inline-flex items-center bg-gray-100 border-0 py-1 px-3 focus:outline-none hover:bg-gray-200 rounded text-base mt-4 md:mt-0"><%=session.getAttribute("Admin") %>
    </button>
  </div>
</header>
    <div class="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
      <div class="flex flex-wrap w-full  py-32 px-10 relative mb-4">
        <img alt="banner" class="w-full object-cover h-full object-center absolute inset-4" src="https://c.wallhere.com/photos/6e/fe/digital_art_artwork_collage_vehicle_car-48145.jpg!d">
      </div>
      </div>
      <div class="container mx-auto flex flex-wrap p-5 flex-col items-center">
    <table class="shadow-lg bg-white mx-auto">
  <thead>
    <tr>
    <th class="bg-blue-100 border text-left px-8 py-4">Name</th>
      <th class="bg-blue-100 border text-left px-8 py-4">Email</th>
      <th class="bg-blue-100 border text-left px-8 py-4">Contact</th>
      <th class="bg-blue-100 border text-left px-8 py-4">Action</th>
    </tr>
     </thead>
  <tbody>
  <%
  try {
	  DBConn dbConn=DBConn.getInstance();
		Connection con=dbConn.getConnection();
		PreparedStatement ps=con.prepareStatement("Select * from user");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			%>
			<tr>
			<td class="border px-8 py-4"><%=rs.getString("uname") %></td>
			<td class="border px-8 py-4"><%=rs.getString("uemail") %></td>
			<td class="border px-8 py-4"><%=rs.getString("contact") %></td>
			<td class="border px-8 py-4"><button class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg" >Edit</button>
			<button class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg" >Delete</button>
			</td>
			</tr>
			<%
		}
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	} %>
 </tbody>
</table>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
<%
}
else{
	session.invalidate();
	ServletContext context=getServletContext();
	context.setAttribute("msg","Error");
	response.sendRedirect("error.jsp");
}

%>