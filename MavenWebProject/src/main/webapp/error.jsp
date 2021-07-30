<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Error</title>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<%@include file="navbar.jsp"%>
<p class="text-center font-serif text-blue-600 text-4xl"><%=getServletContext().getAttribute("msg") %></p>
<%@include file="footer.jsp" %>
</body>
</html>