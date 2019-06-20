<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/movielist.css">
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
        <script src="navbar.js"></script>
        <link rel="stylesheet" href="css/search.css">
        <script src="search.js"></script>
        <title>Admin: Animated movies</title>
        <style>
            body{
                color: white;
            }
            .del p{
                top:105%;
                position: absolute;
                left:36%;
                font-size: 22px;
            }
            .del button[type="submit"]{
    padding: 8px;
    border: none;
    font-size: 15px;
    border-radius: 0 15px 15px 0;
    background-color: red;
    color:white;
    top: 130%;
    left: 76%;
    position: absolute;
}
        </style>
    </head>
    <body>
         <%
        HttpSession user_session=request.getSession();
        String user=(String)user_session.getAttribute("username");
        if(user.equals("danny.rdx")){
            %>
         
        <form method="post" action="delete_animated.jsp">
        <div id="navbar">
         <div class="logo"><a href="admin_dashboard.jsp"><p>Sciflix</p></a></div>
         <a href="admin_scifi.jsp">Scifi</a>
         <a href="admin_animated.jsp">Animated</a>
         <a href="logout.jsp">Exit Panel</a> 
         <% }else{response.sendRedirect("Admin_log.jsp");}%>
        <div class="admin_profile">&nbsp;&nbsp;<a href="">Welcome <%=user%></a></div>
        <br><br><br>
        <h1 style="color:white">&nbsp;&nbsp;Animated Movies</h1>
        
        <div class="del"><p>Enter movie name to delete:</p><input type="text" name="del" required="required"> 
        <button type="submit" formaction="delete_animated.jsp">DELETE</button></div>
        
        
        <%  
             try
        {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           PreparedStatement ps = con.prepareStatement("SELECT movie_name,poster,movie,ratings,cast,year_released,runtime,description,director,genres,trailer,production FROM animated");
           ResultSet rs=ps.executeQuery();    
         while(rs.next()){
            
        %>
        <table>
           <tr><td>
        
        <div class="cnav"></div>
        
        <div class="poster"><img src="images/<%=rs.getString(2)%>"></div>
        
        <div class="title"><p><%=rs.getString(1)%></p></div><br><br><br>
        
        <div class="trailer"><a href="<%=rs.getString(11)%>"><p>Trailer</p></a></div>
        
         <%if(user!=null){
             %><video id="v" width="650" height="300" controls><source src="videos/<%=rs.getString(3)%>" type="video/mp4"></video>
        <% }
        else{%><div class="movie"><a href="Login.html"><p>Login to Watch</p></a></div><%}%>
        
        
        <br><br><br><br><br>
        <div class="runtime"><p> Runtime: <%=rs.getString(7)%></p></div>
        
        <div class="year"><p>Year released: <%=rs.getString(6)%></p></div><br><br>
        
        <div class="ratings"><p>IMDb Ratings: <%=rs.getString(4)%>/10</p></div><br><br>
        
        <div class="cast"><p>Production: <%=rs.getString(12)%></p></div><br><br>
        
        <div class="director"><p>Directed by: <%=rs.getString(9)%></p></div><br><br>
        
        <div class="genres"><p>Genres: <%=rs.getString(10)%></p></div><br><br>
        
        <div class="description"><p>Cast: <%=rs.getString(5)%></p></div><br><br>
        
        <div class="description"><p>Description: <%=rs.getString(8)%></p></div>
        
              <br><br><br><br><br><br></td></tr>
        </table>
        
        <table id="myTable" style="display: none">
            <tr class="header">
                <td><%=rs.getString(1)%></td>
            </tr>
        </table>


       <%               }
        }
       catch(Exception e){
           out.print(e); }
       %>
       
        </form>
    </body>
</html>