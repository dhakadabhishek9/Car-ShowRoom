package controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbconn.DBConn;

/**
 * Servlet implementation class DisplayImage
 */
public class DisplayImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con=null;
       PreparedStatement ps=null;
       ResultSet rs=null;
       BufferedInputStream bin=null;
       BufferedOutputStream bout=null;
       InputStream in =null;
       DBConn dbconn=DBConn.getInstance();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpeg");
		ServletOutputStream sout=response.getOutputStream();
		HttpSession session=request.getSession(false);
		try {
			con=dbconn.getConnection();
			ps=con.prepareStatement("Select * from user where uname='"+session.getAttribute("uname")+"'");
			rs=ps.executeQuery();
			if(rs.next()) {
				in=rs.getBinaryStream(6);
			}
			bin=new BufferedInputStream(in);
			bout=new BufferedOutputStream(sout);
			int ch=0;   
            while((ch=bin.read())!=-1)  
                {  
                bout.write(ch);  
            }  
		} catch (SQLException e) {
			// TODO: handle exception
		}
		finally{
	        try{
	            if(bin!=null)bin.close();  
	            if(in!=null)in.close();  
	            if(bout!=null)bout.close();  
	            if(sout!=null)sout.close();
	        }catch(IOException ex){
	            System.out.println("Error : "+ex.getMessage());
	        }
	}
	}
}
