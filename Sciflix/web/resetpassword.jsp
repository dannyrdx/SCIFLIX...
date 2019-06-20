<%@page import="java.sql.*"%>
<%@page import="javax.servlet.RequestDispatcher.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <%
            
            String confirm_password=request.getParameter("confirm_password");
            String username=request.getParameter("username");
         try
        {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           PreparedStatement ps = con.prepareStatement("update user set upass=? where uname=?");
           
           ps.setString(1, confirm_password);
           ps.setString(2, username);
           int i=ps.executeUpdate();
           
           RequestDispatcher rd=request.getRequestDispatcher("Login.html");
            
         if(i>0)
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

