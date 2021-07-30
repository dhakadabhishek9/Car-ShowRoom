<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>
<%@include file="navbar.jsp" %>
<section class="text-gray-600 body-font">
<div class="container px-5 py-24 mx-auto flex flex-wrap">
    <div class="lg:w-1/2 w-full mb-10 lg:mb-0 rounded-lg overflow-hidden">
      <img alt="feature" class="object-cover object-center h-full w-full" 
      src="https://indiaautoz.in/wp-content/uploads/2018/03/Tata-H5X.jpg">
    </div>
    <div class="lg:w-2/6 md:w-1/2 bg-gray-100 rounded-lg p-8 flex flex-col md:ml-auto w-full mt-10 md:mt-0">
      <h2 class="text-gray-900 text-lg font-medium title-font mb-5">Forgot Password</h2>
      <form action="mail.jsp" method="POST">
      <div class="relative mb-9">
        <label for="full-name" class="leading-7 text-sm text-gray-600">Enter Email</label>
        <input type="email" id="email" name="email" 
        class="w-full bg-white rounded border border-gray-300 
        focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 text-base outline-none text-gray-700 py-1 px-3 
        leading-8 transition-colors duration-200 ease-in-out" required/>
      </div>
      <button type="submit" 
      class="text-white bg-indigo-500 border-0 py-2 px-8 focus:outline-none hover:bg-indigo-600 rounded text-lg" >SEND</button>
     </form>
     <p >Haven't Registered? <a class="text-indigo-500 inline-flex items-center mt-3" href="register.jsp"> Sign Up</a> Here.</p>
     <a class="text-indigo-500 inline-flex items-center mt-3" href="login.jsp">Login Here</a>
    </div>
  </div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>