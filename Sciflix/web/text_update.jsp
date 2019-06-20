<!DOCTYPE html>
<html>
    <head>
        <title>Update/modify text contents</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
        <link rel="stylesheet" type="text/css" href="css/welcome.css">
        <style>
            body{
                color:white;
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
            .media a p{
                color: black;
                background: white;
                left:44.7%;
                position: absolute;
                font-family: 'impact';
                font-size: 20px;
                padding: 5px;
                width: 150px;
                text-align: center;
            }
            .media a p:hover{
                color: white;
                background: black;
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
        <form action="modify.jsp">
           <br><br><br><br><br><center>
        <h1>Update/Modify contents</h1>
        Select movie type: <select name="type" required>
                           <option value="scifi">Scifi</option>
                           <option value="animated">Animated</option>
                            </select><br><br>
                            
        Enter movie name: <input type="text" name="movie" required><br>
        (Note: Enter exact movie name as used while uploading)<br><br>             
                            
        Update text content: <select name="column">
                        <option value="movie_name">Movie name</option>
                        <option value="ratings">Ratings</option>
                        <option value="year_released">Year Released</option>
                        <option value="cast">Cast</option>
                        <option value="runtime">Runtime</option>
                        <option value="director">Director</option>
                        <option value="genres">Genres</option>
                        <option value="description">Description</option>
                        <option value="alt_name">Alternate name</option>
                        <option value="trailer">Trailer link</option>
                       </select><br><br>
                       
                       Content to be updated:<input type="text" name="content" required="required"><br>
                       (Note: To update trailer, search your movie trailer on youtube then click on share->embed->select only the URL specified within " ".)
                       </center>
                       <br><br><input type="submit" value="Update">&nbsp;&nbsp;<input type="reset" value="Reset"><br><br>
                       <div class="media"><a href="media_update.jsp"><p>Update media content</p></a></div>
          
        </form>
    </body>
</html>