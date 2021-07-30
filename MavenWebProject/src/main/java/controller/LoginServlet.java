package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import dao.DAO;
import model.Admin;
import model.Users;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Users users;
	private Admin admin;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		try {
			users=new Users(email, password);
			admin=new Admin(email, password);
			String res=DAO.loginUser(users);
			String res1=DAO.loginAdmin(admin);
			String msg=null;
			if(res!=null)
			{
				HttpSession session=request.getSession(true);
				session.setAttribute("uname", res);
				Cookie c1=new Cookie("uname", res);
				response.addCookie(c1);
				c1.setMaxAge(3*0);
				session.setMaxInactiveInterval(3*60);
				request.getRequestDispatcher("welcome.jsp").forward(request, response);
			}
			else if(res1!=null)
			{
				HttpSession session=request.getSession(true);
				session.setAttribute("Admin", res1);
				request.getRequestDispatcher("admin.jsp").forward(request, response);;
			}
			else
			{
				msg="Invalid Credentials/User Not Exists.";
				ServletContext context=getServletContext();
				context.setAttribute("msg", msg);
				response.sendRedirect("error.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
