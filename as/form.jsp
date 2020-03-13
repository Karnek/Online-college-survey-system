<%@page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.io.*"%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Form Submission</title>
   </head>
   <body>
<%
String degree=request.getParameter("degree");
String year=request.getParameter("year");
String gender=request.getParameter("gender");
String gpa=request.getParameter("gpa");
String description=request.getParameter("description");
String text_first=request.getParameter("txta_first");
String text_second= request.getParameter("txta_second");
String text_third= request.getParameter("txta_third");
String text_fourth= request.getParameter("txta_fourth");
String elective= request.getParameter("elective");
String course= request.getParameter("course");
String program= request.getParameter("program");
String curriculum= request.getParameter("curriculum");
String ct= request.getParameter("computer_technology");
String feedback= request.getParameter("feedback");
String confident= request.getParameter("confident");
String communication= request.getParameter("communication");
String training= request.getParameter("training");
String act= request.getParameter("act");
String exp= request.getParameter("exp");
try{
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/survey","root","");
        Statement st=conn.createStatement();
        String sql="insert into feedback (degree,year,gender,gpa,description,curriculum,course,program,elective,ct,feedback,confident,communication,training,act,exp,text_first,text_second,text_third,text_fourth) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,degree);
        ps.setString(2,year);
        ps.setString(3,gender);
        ps.setString(4,gpa);
        ps.setString(5,description);
        ps.setString(6,curriculum);
        ps.setString(7,course);
        ps.setString(8,program);
        ps.setString(9,elective);
        ps.setString(10,ct);
        ps.setString(11,feedback);
        ps.setString(12,confident);
        ps.setString(13,communication);
        ps.setString(14,training);
        ps.setString(15,act);
        ps.setString(16,exp);
        ps.setString(17,text_first);
        ps.setString(18,text_second);
        ps.setString(19,text_third);
        ps.setString(20,text_fourth);
        ps.executeUpdate();
        String redirectURL  = "thankyou.html";
        response.sendRedirect(redirectURL);
    }

    catch(ClassNotFoundException e){

        e.printStackTrace();
         

          }


%>
        
   </body>
</html>