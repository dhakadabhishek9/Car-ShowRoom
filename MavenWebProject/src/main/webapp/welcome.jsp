<%
if(session.getAttribute("uname")!=null)
{
%>
<html>
<head>
<title>Welcome</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
 <link href="css/style.css" rel="stylesheet">
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
    
  <p class="text-center font-serif text-blue-600 text-4xl">
 Welcome <%=session.getAttribute("uname") %>
</p>
<%@include file="content.jsp" %>
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