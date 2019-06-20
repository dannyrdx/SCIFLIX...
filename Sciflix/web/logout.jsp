<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <% 
       HttpSession user_session=request.getSession(false);
       if(user_session!=null){
       user_session.invalidate();  }
      response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
      response.setHeader("Pragma","no-cache");
      response.setHeader("Expires","0");
      response.sendRedirect("Login.html"); 
            
  %>