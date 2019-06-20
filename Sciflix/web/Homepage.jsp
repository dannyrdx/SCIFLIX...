<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.*"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="sciflix.ico">
        <title>Homepage</title>
        <link rel="stylesheet" type="text/css" href="css/homepage.css">
        <script src="swiper.min.js"></script>
        <link rel="stylesheet" href="css/swiper.min.css">
        <script src="navbar.js"></script>
        
    </head>
    <body>
        <form method="post" action="home_search.jsp">
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
            <input type="text" name="search" placeholder="Search movie.." title="Type in a name">
            <input type="submit" name='search' value="Search">
        </div>
     </div>
        <%  
            
            
             try
        {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           PreparedStatement ps = con.prepareStatement("select distinct movie_name,cover from scifi where 5star>=11 limit 1;");
           ResultSet rs=ps.executeQuery();
           PreparedStatement ps1 = con.prepareStatement("select distinct movie_name,cover from scifi where 5star < 11 limit 1;");
           ResultSet rs1=ps1.executeQuery();
           PreparedStatement ps2 = con.prepareStatement("select distinct movie_name,cover from animated where 5star>=10 limit 1;");
           ResultSet rs2=ps2.executeQuery();
           PreparedStatement ps3 = con.prepareStatement("select distinct movie_name,cover from animated where 5star between 5 and 9 limit 1;");
           ResultSet rs3=ps3.executeQuery();
           PreparedStatement ps4 = con.prepareStatement("select distinct movie_name,cover from scifi where 5star=1 and 4star=1 limit 1;");
           ResultSet rs4=ps4.executeQuery();
           PreparedStatement ps5 = con.prepareStatement("select distinct movie_name,cover from animated where 5star=1 and 4star=1 limit 1;");
           ResultSet rs5=ps5.executeQuery();
           
         while(rs.next()&rs1.next()&rs2.next()&rs3.next()){
            
        %>
        
        
        <br>
        
<div class="slideshow-container">
<div class="mySlides fade">
    <img src="images/<%=rs.getString(2)%>" style="width:100%">
  <div class="trending"><p>Trending<br><%=rs.getString(1)%></p></div>
   <div class="text"><a href="trending.jsp"><p>Watch Now</p></a></div>
</div>
   
   <div class="mySlides fade">
    <img src="images/<%=rs1.getString(2)%>" style="width:100%">
  <div class="trending"><p>Trending<br><%=rs1.getString(1)%></p></div>
   <div class="text"><a href="trending.jsp"><p>Watch Now</p></a></div>
</div>
   
   <div class="mySlides fade">
    <img src="images/<%=rs2.getString(2)%>" style="width:100%">
  <div class="trending"><p>Trending<br><%=rs2.getString(1)%></p></div>
   <div class="text"><a href="trending1.jsp"><p>Watch Now</p></a></div>
</div>
    
<div class="mySlides fade">
  <img src="images/<%=rs3.getString(2)%>" style="width:100%">
  <div class="trending"><p>Trending<br><%=rs3.getString(1)%></p></div>
   <div class="text"><a href="trending1.jsp"><p>Watch Now</p></a></div>
</div>


<a class="btn-floating" style="position:absolute;top:45%;left:2%;color:white;font-size: 50px;" onclick="plusDivs(-1)">❮</a>
<a class="btn-floating" style="position:absolute;top:45%;right:2%;color:white;font-size: 50px;" onclick="plusDivs(1)">❯</a>

</div>
<marquee style="color:white;font-family: impact;font-size: 20px">Trending Trending Trending</marquee><br>
<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span>
  <span class="dot"></span>
</div>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>



<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1;}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 3000);
}
</script>
       

       <%while(rs4.next()&rs5.next()){%>
<br><br><div class="popular"><p>Latest Releases</p></div><br><br><br> 
    
        <div class="latest-scifi"><a href="recent_scifi.jsp"><p><%=rs4.getString(1)%></p><br><img src="images/<%=rs4.getString(2)%>"></a></div>
        <div class="latest-animated"><a href="recent_animated.jsp"><p><%=rs5.getString(1)%></p><br><img src="images/<%=rs5.getString(2)%>"></a></div>

  <br><br><br><br><br>
  <%       
}
}
}
       catch(Exception e){
            }
       %> 

  <div class="footerlogo"><img src="ico.PNG" alt="icon"></div>
        <br><br>
        <div class="footer"><p>&copy; 2018-2019, Sciflix.in, Inc.</p></div><br>
        </form> 
    </body>
</html>
