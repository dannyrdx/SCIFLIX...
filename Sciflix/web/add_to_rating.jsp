 

<%@page import="java.sql.*"%>
<%
    String movie_name = request.getParameter("movie_name");
    String type = request.getParameter("type");
    
    String dbUser = "danish";
    String dbPass = "mysqldatabase";
    Connection conn=null;
    
    try{
    Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull", dbUser, dbPass);
 
            PreparedStatement statement = conn.prepareStatement("insert into ratings values(?, 1, 1, 1, 1, 1, ?)");
             statement.setString(1, movie_name);
             statement.setString(2, type);
             
             int i = statement.executeUpdate();
            if (i > 0) {%>
                
            <script>alert("Movie is ready to be Rated!!!");</script>
                
            <%response.setHeader("Refresh", "0,url=admin_dashboard.jsp");}
            else{%>
                
            <script>alert("Please enter correct movie name!");</script>
                
            <%}

             statement.close();
             conn.close();
}
            catch(Exception e){ response.setIntHeader("Refresh", 1);%>
           
           <script>
             alert("Movie with this name is already used for ratings!!!");
            </script>
            
           <%response.sendRedirect("admin_dashboard.jsp"); }%>