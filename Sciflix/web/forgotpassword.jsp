<%@page import="java.sql.*"%>
<%@page import="javax.servlet.RequestDispatcher.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String username=request.getParameter("username");
            String email=request.getParameter("email");
      
         try
        {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           PreparedStatement ps = con.prepareStatement("select upass from user where uname=? and uemail=?");
           ps.setString(1, username);
           ps.setString(2, email);
           ResultSet rs=ps.executeQuery();
           
           RequestDispatcher rd=request.getRequestDispatcher("Resetpassword.html");
            
         while(rs.next())
         {
            rd.forward(request,response); 
         }
         
         response.sendRedirect("forgotpassword.html");
         ps.close();   
         con.close();
        }
         
        catch(Exception e)
        {
            e.printStackTrace();
        }
         
  %>

