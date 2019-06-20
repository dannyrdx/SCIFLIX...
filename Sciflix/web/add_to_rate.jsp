<!DOCTYPE html>
<html>
    <head>
        <title>Add movie to rate</title>
        <link rel="shortcut icon" href="sciflix.ico"/>
        <link rel="stylesheet" type="text/css" href="css/welcome.css">
        <link rel="stylesheet" type="text/css" href="css/dashboard.css">
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
    </head>
    <body style="color: white">
        <%
        HttpSession user_session=request.getSession();
        String user=(String)user_session.getAttribute("username");
        if(user.equals("danny.rdx")){
            
         %>
        <div id="navbar">
         <div class="logo"><a href="admin_dashboard.jsp"><p>Sciflix</p></a></div>
         <a href="admin_scifi.jsp">Scifi</a>
         <a href="admin_animated.jsp">Animated</a>
         <a href="logout.jsp">Exit Panel</a> 
         <% }else{response.sendRedirect("Admin_log.jsp");}%>
        <div class="admin_profile">&nbsp;&nbsp;<a href="">Welcome <%=user%></a></div>
     </div>
        <form action="add_to_rating.jsp">
            <br><br><br><br>
        <center>
        <h1>Set movie for Rating</h1>
        Select type of movie: <select name="type">
            <option value="Scifi">Scifi</option>
            <option value="Animated">Animated</option>
                                </select><br><br>
        Enter movie name as inserted into the database:
        <input type="text" name="movie_name" required="required"></center><br>
        <input type="submit" value="Set">
        
        </form>
    </body>
</html>
