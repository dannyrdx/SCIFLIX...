<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/movielist.css">
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
        <link rel="stylesheet" type="text/css" href="css/rate.css">
        <script src="navbar.js"></script>
       
        <title>Latest Scifi movies</title>
        
    </head>
    <body><form name="Form1" method='post'> 
        <div id="navbar">
         <div class="logo"><a href="Homepage.jsp"><p>Sciflix</p></a></div>
         <a href="newscifi.jsp">Scifi</a>
         <a href="newanimated.jsp">Animated</a>
         <a href="Aboutus.jsp">About us</a>
         <%
        HttpSession user_session=request.getSession();
        String user=(String)user_session.getAttribute("username");
        if(user!=null){
        %> <a href="logout.jsp">Logout</a> 
        <% }
        else{%><a href="Login.html">Login</a><%}%>
        <div class="search-box">
            <input type="text" name="s_search" onkeyup="show()" placeholder="Search movie.." title="Type in a name">
            <input type="submit" name='search' value="Search" onclick="OnButton1()">
        </div>
     </div>
        <br><br><br><br><br>
        <h1 style="color:white">&nbsp;&nbsp; Latest Scifi Movies</h1><br>
        <%if(user!=null){
        %>
        <div id="myDIV">
            <div class="rate" style="left:65%;position: absolute;">
    <input type="radio" id="star5" name="rate" value="5" />
    <label for="star5" title="text">5 stars</label>
    <input type="radio" id="star4" name="rate" value="4" />
    <label for="star4" title="text">4 stars</label>
    <input type="radio" id="star3" name="rate" value="3" />
    <label for="star3" title="text">3 stars</label>
    <input type="radio" id="star2" name="rate" value="2" />
    <label for="star2" title="text">2 stars</label>
    <input type="radio" id="star1" name="rate" value="1" />
    <label for="star1" title="text">1 star</label></div>
            
   <input type="button" onclick="OnButton2()" value="Rate" style="font-size:22px; font-family:'impact'; color:red; left:77%;position: absolute;"><br><br>
   <div class="ratem">
       <input type="text" placeholder="Enter movie name..." required="required" name="ratem" style="left: 52.6%; position: absolute;"></div></div>
 
   <button onclick="viewMore()" style="left:65%;position: absolute;font-size:22px; font-family:'impact'; color:red">Rate movie</button>
   <% }else{}%>
   
        <%  
            String query1 = "SELECT movie_name,poster,movie,ratings,cast,year_released,runtime,description,director,genres,trailer,production FROM scifi where 5star=1 and 4star=1;";
            
             try
        {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           PreparedStatement ps = con.prepareStatement(query1);
           ResultSet rs=ps.executeQuery();
           PreparedStatement ps1 = con.prepareStatement("SELECT 5star,4star,3star,2star,1star from ratings where 5star=1 and 4star=1 and type='Scifi';");
           ResultSet rs1=ps1.executeQuery();
         while(rs.next() & rs1.next()){
            
        %>
        <table id="myTable">
           <tr><td>
        
        <div class="cnav"></div>
        <div class="poster"><img src="images/<%=rs.getString(2)%>"></div>
        
        <div class="title"><p><%=rs.getString(1)%></p></div><br><br><br>
        
        <div class="trailer"><a href="<%=rs.getString(11)%>"><p>Trailer</p></a></div>
        
         <%if(user!=null){
             %><video id="v" width="650" height="300" controls><source src="videos/<%=rs.getString(3)%>" type="video/mp4"></video>
        <% }
        else{%><div class="movie"><a href="Login.html"><p>Login to Watch</p></a></div><%}%>
        
        
        <br><br><br><br>
        <div class="runtime"><p> Runtime: <%=rs.getString(7)%></p></div>
        
        <div class="year"><p>Year released: <%=rs.getString(6)%></p></div><br><br>
        
        <div class="ratings"><p>IMDb Ratings: <%=rs.getString(4)%>/10</p></div><br><br>
        
        <div class="cast"><p>Production: <%=rs.getString(12)%></p></div><br><br>
        
        <div class="director"><p>Directed by: <%=rs.getString(10)%></p></div><br><br>
        
        <div class="genres"><p>Genres: <%=rs.getString(9)%></p></div><br><br><br><br>
        
        <div class="description"><p>Cast: <%=rs.getString(5)%></p></div><br><br>
        
        <div class="description"><p>Description: <%=rs.getString(8)%></p></div><br><br><br>
        
        <div class="description"><p><%=rs1.getInt(1)%><img src="images/5star.PNG"></p>
                                 <p><%=rs1.getInt(2)%><img src="images/4star.PNG"></p>
                                 <p><%=rs1.getInt(3)%><img src="images/3star.PNG"></p>
                                 <p><%=rs1.getInt(4)%><img src="images/2star.PNG"></p>
                                 <p><%=rs1.getInt(5)%><img src="images/1star.PNG"></p></div><br><br>
        
       
              <br><br><br><br><br><br><br><br><br>
               </td></tr>
        </table>
             
       <%               }
        }
       catch(Exception e){
           out.print(e); }
       %>  
<script>
function OnButton1()
{
    document.Form1.action = "search_scifi.jsp"
    document.Form1.submit();            
    return true;
}

function OnButton2()
{
    document.Form1.action = "ratings.jsp"  
    document.Form1.submit();            
    return true;
}
function viewMore() {
  var x = document.getElementById("myDIV");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
</script>
<input type="hidden" name="type" value="Scifi">
        </form>
    </body>
</html>
