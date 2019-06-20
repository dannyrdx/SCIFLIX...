<%@page import="java.sql.*"%>

<%
    int rating=Integer.parseInt(request.getParameter("rate"));//accepting ratings as integer
    String ratem=request.getParameter("ratem");               //accepting movie_name to rate
    String type = request.getParameter("type");               //accepting the type of movie
    String query;
    
    if(rating==5){
        query="update ratings set 5star = 5star + 1 where movie_name='"+ratem+"'";}
    else if(rating==4){
        query="update ratings set 4star = 4star + 1 where movie_name='"+ratem+"'";}
    else if(rating==3){
        query="update ratings set 3star = 3star + 1 where movie_name='"+ratem+"'";}
    else if(rating==2){
        query="update ratings set 2star = 2star + 1 where movie_name='"+ratem+"'";}
    else if(rating==1){
        query="update ratings set 1star = 1star + 1 where movie_name='"+ratem+"'";}
    
    else{ query="update ratings set 1star = 1star + 0 where movie_name='"+ratem+"'";%>
            <script>
             alert("Please select stars to rate the movie!!!");
            </script><%}
    
    //generating query to rate specific movie
   String query2;
   if(type.equals("Scifi")){query2="update scifi set 5star = 5star + 1 where movie_name='"+ratem+"'";}
   else{query2="update animated set 5star = 5star + 1 where movie_name='"+ratem+"'";}
     try
        {
           Class.forName("com.mysql.jdbc.Driver"); //getting database connection
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish","mysqldatabase");
           PreparedStatement ps0 = con.prepareStatement(query); 
           int a=ps0.executeUpdate();
           PreparedStatement ps1 = con.prepareStatement(query2); 
           int b=ps1.executeUpdate();//executing the query
           
           if(a>0 & type.equals("Scifi")){                       //if scifi movie is rated then user will be redirected to scifi movie page
               response.sendRedirect("newscifi.jsp");
                }   
            else if(type.equals("Animated")){
                 response.sendRedirect("newanimated.jsp");
}
           //if entered movie name is in correct then user will get a message and get redirected to the same page
           else{%>
           
           <script>
             alert("Please enter correct movie name!!!");
            </script>
            
           <% }
           ps0.close();
           con.close();
          }
          catch(NumberFormatException e){

                %>
           
           
            
           <% response.setIntHeader("Refresh", 1);
            }

%>

         
         
         
  