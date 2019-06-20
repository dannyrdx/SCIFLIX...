<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String column=request.getParameter("column");
    String type=request.getParameter("type");
    String content=request.getParameter("content");
    String movie=request.getParameter("movie");
    String query = "update "+type+" set "+column+"='"+content+"' where movie_name='"+movie+"'";
    
    try
        {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           PreparedStatement ps = con.prepareStatement(query);
           int i=ps.executeUpdate(); 
           if(i>0){
               %>

<script>alert("Modification Successful");</script>
               
<%response.sendRedirect("admin_dashboard.jsp");
           }
           else{
              out.print("Unable to update!!!");
           }
        }
    
            catch(Exception e){
             out.print(e);
            }
      
         
%>
