<%@page import="forgotpassword.VerificationMail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.IOException"%>



        <%
            
            String username=request.getParameter("username");//accepting user's credentials
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
            
           PreparedStatement ps=con.prepareStatement("insert into user values(?,?,?)");
           
          ps.setString(1,username);
          ps.setString(2,email);
          ps.setString(3,password);//inserting user credentials into the database
           int i=ps.executeUpdate();
           
           if(i>0){
                %>
                
                <script>alert("You are successfully registered!");</script>
               
        <%
               response.setHeader("Refresh", "0,url=Login.html");
           }
            else{%><script>alert("Try different username!!");</script>
            
            <% response.setHeader("Refresh", "0,url=Register.html");   }
            ps.close();
            con.close();
            out.close();
        }
        catch(Exception e)
                {
                   %><script>alert("Try different username!!");</script><%
                       response.setHeader("Refresh", "0,url=Register.html");
                 }
        
              
            
        %> 
