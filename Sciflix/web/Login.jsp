<%@page import="java.sql.*"%>
<%@page import="javax.servlet.RequestDispatcher.*"%>
<%@page import="javax.servlet.http.*"%>
 
<%
            String username=request.getParameter("username"); //getting username from login.html page
            String password=request.getParameter("password"); //getting password from login.html page
            
            if(username.equals("adminusername")&&password.equals("adminpassword"))
            {response.sendRedirect("Admin_log.jsp");}
      
         try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           PreparedStatement ps = con.prepareStatement("select uname,upass from user where uname=? and upass=?");
		ps.setString(1, username);
		ps.setString(2, password);
                ResultSet rs=ps.executeQuery();
           RequestDispatcher rd=request.getRequestDispatcher("Homepage.jsp");
           while(rs.next())//verifying username and password if they are as same as in database then forward user to homepage
         {
              HttpSession user_session=request.getSession();
              user_session.setAttribute("username",username); //ceating and setting sesionname for user
             
              rd.forward(request,response);   
         }
     
        response.sendRedirect("Login.html");//if username and password are not into the database 
                                            //then redirect user to same page and not allowing 
        ps.close();                         //to visit homepage without logging in.
        con.close();
         
        }
         
        catch(Exception e)
        {
            e.printStackTrace();
        }
         
  %>