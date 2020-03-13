<%@page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.io.*"%>
    <html> 
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Check</title> 
        </head> 
        <body> 
            <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
             String comments = request.getParameter("comments");
             String year = request.getParameter("year");
    
            
           

    try{
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/survey","root","");
        Statement st=conn.createStatement();
        String sql="insert into contact (name,email,comments,year) values(?,?,?,?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,name);
        ps.setString(2,email);
        ps.setString(3,comments);
        ps.setString(4,year);
        ps.executeUpdate();
        String redirectURL  = "thank.html";
        response.sendRedirect(redirectURL);
    }

    catch(ClassNotFoundException e){

        e.printStackTrace();
         

          }
            


            %>
    </body> 
    </html>