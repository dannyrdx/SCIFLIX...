package forgotpassword;

import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.ejb.EJB;

public class _Verification_Mail extends HttpServlet {
    
    static String a;
    
    @EJB 
    private Mail mail;
    
   @Override
   @SuppressWarnings("ConvertToTryWithResources")
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
       String to;
       String from;
       String username;
       String password;
       
       from = "sciflixsu@gmail.com";
       password = "sciflixadmin3306";
        
         try(PrintWriter out=response.getWriter())
        {
            
        username=request.getParameter("username");   
        to=request.getParameter("email");
        
        ResultSet rs ;
        PreparedStatement ps;
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           ps = con.prepareStatement("select upass from user where uname=? and uemail=?");
           ps.setString(1, username);
           ps.setString(2, to);
           rs = ps.executeQuery();
            
         while(rs.next())
         {     
                  a = rs.getString("upass");
                  out.print("<h1>Mail sent successfully</h1>");

         }         
                  
         
        }
         
        catch(SQLException|ClassNotFoundException e)
        {
            out.print(e);
        }
        
    }
    
    
}