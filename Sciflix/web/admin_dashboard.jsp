<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="shortcut icon" href="sciflix.ico"/>
        <title>Admin Dashboard</title>
        <link rel="stylesheet" type="text/css" href="css/welcome.css">
        <link rel="stylesheet" type="text/css" href="css/dashboard.css">
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
        <script src="navbar.js"></script>
    </head>
    <body>
        <%
           String admin_username="danny.rdx"; 
        HttpSession user_session=request.getSession();
        String user=(String)user_session.getAttribute("username");
        if(user.equals("danny.rdx")){%>

        <div id="navbar">
         <div class="logo"><a href="admin_dashboard.jsp"><p>Sciflix</p></a></div>
         <a href="admin_scifi.jsp">Scifi</a>
         <a href="admin_animated.jsp">Animated</a>
         <a href="logout.jsp">Exit Panel</a> 
        <% }
            else{
                  response.sendRedirect("Admin_log.jsp");
                }
            %>
        <div class="admin_profile">&nbsp;&nbsp;<a href="">Welcome <%=user%></a></div>
     </div>
        
     <div class="heading"><p>Dashboard</p></div><br>
            <%  
             try
        {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           PreparedStatement ps = con.prepareStatement("SELECT (select count(movie_name) from scifi),(select count(movie_name)from animated),(select count(uname) from user) FROM dual");
           ResultSet rs=ps.executeQuery();    
         while(rs.next()){    
        %>
        <br>
        <center><br><br><br><br><br><br><br><br><br>
        <h3 style="color:white">Number of Scifi Movies: <%=rs.getString(1)%></h3>
        <h3 style="color:white">Number of Animated Movies: <%=rs.getString(2)%></h3>
        <h3 style="color:white">Number of Registered Users: <%=rs.getString(3)%></h3></center><br><br><br>
        <div class="upload"><a href="upload.jsp"><p>Upload</p></a></div>
        <div class="modify"><a href="text_update.jsp"><p>Update/Modify</p></a></div>
        
      <%
          }
        }
            catch(Exception e){
             out.print(e);
            }
      
      %>

        <br><br><br>
        
        <div class="footer"><p>&copy; 2018-2019, Sciflix.in, Inc.</p></div><br>
</body>
</html>

