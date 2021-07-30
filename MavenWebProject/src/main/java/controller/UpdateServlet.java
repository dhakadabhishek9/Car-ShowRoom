package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconn.DBConn;

@MultipartConfig(maxFileSize = 20848820)
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con=null;
	private PreparedStatement ps=null;
	DBConn dbconn=DBConn.getInstance();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		if(session!=null)
		{
			int result=0;
			String uname=(String)session.getAttribute("uname");
			javax.servlet.http.Part par=request.getPart("image");
			if(par!=null)
			{
				try {
					con=dbconn.getConnection();
					ps=con.prepareStatement("Update user set image=? where uname=?");
					InputStream is=par.getInputStream();
					ps.setBlob(1, is);
					ps.setString(2, uname);
					result=ps.executeUpdate();
					if(result>0)
					{
						request.getRequestDispatcher("welcome.jsp").forward(request, response);
					}
					else
					{
						System.out.println("Image not Uploaded");
					}
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}

}
