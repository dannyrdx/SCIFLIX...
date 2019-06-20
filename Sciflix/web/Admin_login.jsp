<%@page import="javax.servlet.http.*"%>
 
<%
    
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            RequestDispatcher rd=request.getRequestDispatcher("admin_dashboard.jsp");
            
            if(username.equals("danny.rdx")&&password.equals("7021858095"))
            {
              HttpSession user_session=request.getSession();  
              user_session.setAttribute("username",username); 
              rd.forward(request,response);
            }
            else
            {
                response.sendRedirect("Admin_log.jsp");
            }
  %>