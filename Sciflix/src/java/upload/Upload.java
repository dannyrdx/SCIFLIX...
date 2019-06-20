package upload;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Upload")
@MultipartConfig(maxFileSize = 1994967295)

public class Upload extends HttpServlet {
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        
    PrintWriter out=response.getWriter();
    String dbUser = "danish";
    String dbPass = "mysqldatabase";
    
    
    String movie_name=request.getParameter("movie_name"); //accepting details for movie
    String alt_name=request.getParameter("alt_name");
    String ratings=request.getParameter("ratings");
    String myear_released=request.getParameter("year_released");
    String cast=request.getParameter("cast");
    String mruntime=request.getParameter("runtime");
    String director=request.getParameter("director");
    String genres=request.getParameter("genres");
    String description=request.getParameter("description");
    String type=request.getParameter("typo");
    String trailer=request.getParameter("trailer");
    
    Connection conn; // connection to the database
    String message;
    
String poster =null;
Part filePart = request.getPart("poster"); //getting filename to be inserted into the database
if (filePart != null) 
{
poster = filePart.getSubmittedFileName();
}

String cover1 = null;    
Part cover = request.getPart("cover");//getting filename to be inserted into the database
if (cover != null) 
{
cover1 = cover.getSubmittedFileName();
}
    
Part mov = request.getPart("movie");//getting filename to be inserted into the database
   String mov_name;
        mov_name = mov.getSubmittedFileName();
        try {
            // connects to the database
            Class.forName("com.mysql.jdbc.Driver");//setting up database connectivity
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sciflix?zeroDateTimeBehavior=convertToNull", dbUser, dbPass);
 
            // constructs SQL statement
            if(type.equals("yes")){
            PreparedStatement statement = conn.prepareStatement("insert into animated values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, 1)");
             statement.setString(1, movie_name);//inserting movie details into the database
            statement.setString(9, alt_name);
            statement.setString(2, ratings);
            statement.setString(3, myear_released);
            statement.setString(4, cast);
            statement.setString(5, mruntime);
            statement.setString(6, director);
            statement.setString(7, genres);
            statement.setString(8, description);
            statement.setString(10, mov_name);
            statement.setString(11, poster);
            statement.setString(12, cover1);
            statement.setString(13, trailer);
            
             int i = statement.executeUpdate();//executing insert query 
            if (i > 0) {
                out.print("<script>alert("+"Movie Successfully Uploaded to database"+");</script>");
                response.setHeader("Refresh", "0,url=add_to_rate.jsp");//message if movie gets uploaded
            }
            else{
                 out.print("<script>alert("+"Unable to upload movie!!!"+");</script>");
                response.setHeader("Refresh", "0,url=upload.jsp");//message if movie not get uploaded 
            }
             statement.close();
             conn.close();
            }
            else{
                PreparedStatement statement = conn.prepareStatement("insert into scifi values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1, 1)");
                statement.setString(1, movie_name);
            statement.setString(9, alt_name);
            statement.setString(2, ratings);
            statement.setString(3, myear_released);
            statement.setString(4, cast);
            statement.setString(5, mruntime);
            statement.setString(6, director);
            statement.setString(7, genres);
            statement.setString(8, description);
            statement.setString(10, mov_name);
            statement.setString(11, poster);
            statement.setString(12, cover1);
            statement.setString(13, trailer);
            
             int i = statement.executeUpdate();
            if (i > 0) {
               out.print("<script>alert("+"Movie Successfully Uploaded to database"+");</script>");
                response.setHeader("Refresh", "0,url=add_to_rate.jsp");
            }
            else{
              out.print("<script>alert("+"Unable to upload movie!!!"+");</script>");
                response.setHeader("Refresh", "0,url=upload.jsp");
            }
             statement.close();
             conn.close();
            }
             
        }  
        catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            out.print("Movie with this name is already uploaded to the database!!!");
        }   
        
        catch (ClassNotFoundException ex) { 
                out.print(ex);
            } 
        }      
    }