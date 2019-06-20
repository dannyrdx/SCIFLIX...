package upload;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 1994967295)
public class media_upload extends HttpServlet {

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         
            String type=request.getParameter("type");
            String movie=request.getParameter("movie");
            String mediatype=request.getParameter("media_type");
            
            String media =null;
            Part filePart = request.getPart("media");
            if (filePart != null) 
            {
             media = filePart.getSubmittedFileName();
            }

        try {
            // connects to the database
            String query = "update "+type+" set "+mediatype+" = '"+media+"' where movie_name='"+movie+"'";
            Connection conn = null;
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull","danish", "mysqldatabase");
 
            PreparedStatement ps = conn.prepareStatement(query);
             int i=ps.executeUpdate();
            
             if(i>0){
                   out.print("<script>alert("+"Modification Successful!"+");</script>");
                   response.setHeader("Refresh", "0,url=admin_dashboard.jsp");
             }
             else{
                    out.print("<script>alert("+"Unable to modify movie!!!"+");</script>");
                response.setHeader("Refresh", "0,url=media_update.jsp");
             }
             
            
        }
        
        catch(Exception e){
                            out.print(e);
        }
    }

  }
