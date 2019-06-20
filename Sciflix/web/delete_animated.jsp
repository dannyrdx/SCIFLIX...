<%@page import="java.sql.*"%>
<%  
    
    String name = request.getParameter("del");
             try
        {
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           PreparedStatement ps = con.prepareStatement("DELETE FROM animated WHERE movie_name=?");
           ps.setString(1,name);
           PreparedStatement ps1 = con.prepareStatement("DELETE FROM ratings WHERE movie_name=?");
           ps1.setString(1,name);
           int j = ps1.executeUpdate();
           int i = ps.executeUpdate();
           
           if(i>0){
               response.sendRedirect("admin_dashboard.jsp");
           }
           else{
               out.print("Unable to delete!!----> "+i);}
        
        }
            catch(Exception e){
             out.print(e);
            }
      
      %>