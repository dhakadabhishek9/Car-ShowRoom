package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {
		res.setHeader("Cache-Control","no-cache"); 
        res.setHeader("Cache-Control","no-store"); 
        res.setDateHeader("Expires", 0); 
        res.setHeader("Pragma","no-cache");
        request.getRequestDispatcher("login.jsp").include(request, res);  
          
        HttpSession session=request.getSession();  
        session.invalidate();
         
	}

}
