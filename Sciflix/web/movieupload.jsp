<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   
    MultipartRequest mp;
    mp = new MultipartRequest(request,"C:\\Users\\user\\Documents\\NetBeansProjects\\Project\\web\\videos",2000000000);
   out.println("Movie Uploaded Successfully");
   

%>
<!DOCTYPE html>
<html>
    <head>
        <title>upload</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h3>Uploading process successfully completed</h3>
Back to Admin <a href="admin_dashboard.html">home.</a>
      
    </body>
</html>