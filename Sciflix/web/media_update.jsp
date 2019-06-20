<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
        <link rel="stylesheet" type="text/css" href="css/welcome.css">
        <title>Update/modify media contents</title>
        <style>
            body{
                color: white;
            }
        </style>
    </head>
    <body>
        <%
            HttpSession user_session=request.getSession(false);
            String user=(String)user_session.getAttribute("username");
            if(user!=null){}
            else{response.sendRedirect("Admin_login.html");}
        %>
        <div id="navbar">
         <div class="logo"><a href="admin_dashboard.jsp"><p>Sciflix</p></a></div>
         <a href="admin_scifi.jsp">Scifi</a>
         <a href="admin_animated.jsp">Animated</a>
         
         <%
        if(user!=null){
        %> <a href="logout.jsp">Exit Panel</a> 
        <% }%>
        <div class="admin_profile">&nbsp;&nbsp;<a href="">Welcome <%=user%></a></div>
     </div>
        
        <form action="media_upload" method="post" enctype="multipart/form-data">
        <br><br><br><br><br><center><h1>Update/Modify media contents</h1><br>
        Select movie type: <select name="type">
                           <option value="scifi">Scifi</option>
                           <option value="animated">Animated</option>
                            </select><br><br>
                            
        Select media type: <select name="media_type">
                           <option value="poster">Poster</option>
                           <option value="cover">Cover</option>
                           <option value="movie">Movie</option>
                           </select><br><br>
                            
                           Enter Movie name: <input type="text" name="movie" required><br><br>
      
        Select file: <input type="file" name="media"><br><br><br>
        </center>
        <input type="submit" value="Update">
        </form>
    </body>
</html>