package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.Users;

/**
 * Servlet implementation class RegServlet
 */
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Users users;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String contact=request.getParameter("contact");
		try {
			users=new Users(uname, email, password, contact);
			String res=DAO.regUser(users);
			if(res.equals("SUCCESS"))
			{
				response.sendRedirect("login.jsp?=Registration+Successful");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
