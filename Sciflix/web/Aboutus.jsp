
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
         <link rel="stylesheet" type="text/css" href="css/homepage.css">
         <script src="navbar.js"></script>
    </head>
    <body style="color: white">
        
        <div id="navbar">
         <div class="logo"><a href="Homepage.jsp"><p>Sciflix</p></a></div>
         <a href="newscifi.jsp">Sci-fi</a>
         <a href="newanimated.jsp">Animated</a>
         <a href="Aboutus.jsp">About us</a>
         <%
        HttpSession user_session=request.getSession();
        String user=(String)user_session.getAttribute("username");
        if(user!=null){
        %> <a href="logout.jsp">Logout</a> 
        <% }
        else{%><a href="Login.html">Login</a><%}%>
        
     </div><br><br><br><br>
     <h1 style="position: absolute;left: 30px;">About Us</h1><br><br><br>
        <h4 style="position: absolute;left: 30px;width: 1300px;text-align: justify">Welcome to
            Sciflix, your one stop destination for entertainment. We're dedicated to giving
            you the very best of service, with a focus on 
            uniqueness, quality of service and flexibility.
Founded in 2018 by Danish Momin, Sciflix has come a long way from its beginnings in a 
small house.
We now serve customers with all our enthusiasm and are thrilled to
be a part of the global wing of the media streaming industry.

We hope you enjoy our service as much as we enjoy offering them to you. If you have any questions or
comments, please don't hesitate to contact us at, 

'sciflixsu@gmail.com'.<br><br>
Sincerely,
 Danish Momin</h4>
    </body>
</html>
