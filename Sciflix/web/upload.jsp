<!DOCTYPE html>
<html>
    <head>
        <title>Upload movie</title>
        <link rel="stylesheet" type="text/css" href="css/welcome.css">
        <link rel="stylesheet" type="text/css" href="css/dashboard.css">
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
        <style>
            body{
                background: black;
                color:white;
            }
            b{
                align-content: center;
            }
            input[type="reset"]{
                 border: none;
                 outline: none;
                 background: rgb(255, 21, 21);
                 color: #fff;
                 font-size: 22px;
                 position: absolute;
                 font-family: 'impact';
                 padding:6.5px;
            }
            input[type="reset"]:hover{
              background: #fff;
                 color: rgb(255, 21, 21);  
            }
        </style>
    </head>
    <body>
        <%
        HttpSession user_session=request.getSession();
        String user=(String)user_session.getAttribute("username");
        if(user==null){
            response.sendRedirect("Admin_login.html");
         }%>
        <form method="post" action="Upload" enctype="multipart/form-data">
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
        
            <br><br><br><center>
            <h1>Upload Movie</h1>
            Type: <select name="typo" required="required">
            <option name="typo" value="no">Scifi</option>
            <option name="typo" value="yes">Animated</option>
              </select><br><br>
        Movie Name:<input type="text" name="movie_name" required="required">
        IMDb Ratings: <input type="text" name="ratings" required="required"><br><br>
        Year released: <input type="text" name="year_released" required="required">
        Cast: <input type="text" name="cast" required="required"><br><br>
        Runtime: <input type="text" name="runtime" required="required">
        Director: <input type="text" name="director" required="required"><br><br>
        Genres: <input type="text" name="genres" required="required">
        Description: <input type="text" name="description" required="required"><br><br>
        Production: <input type="text" name="alt_name" required="required"><br><br>
        Movie poster: <input type="file" name="poster" required="required">
        Movie cover: <input type="file" name="cover" required="required">
        Movie: <input type="file" name="movie"><br><br>
        Trailer link: <input type="text" name="trailer" required="required">(Note: Search your movie trailer on youtube then click on share->embed->select only the URL specified within " ")<br><br>
        </center><input type="submit" value="Upload">&nbsp;&nbsp;
        <input type="reset" value="Reset">
        </form>
    </body>
</html>