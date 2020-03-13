<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "survey";
String userid = "root";
String password = "";
String year=request.getParameter("year");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from feedback where year="+year;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE HTML>
<html lang="zxx">
   <head>
      <title>UPDATE</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta charset="UTF-8" />
      <meta name="keywords" content="Item Order Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"
         />
      <script>
         addEventListener("load", function () {
         	setTimeout(hideURLbar, 0);
         }, false);
         
         function hideURLbar() {
         	window.scrollTo(0, 1);
         }
      </script>
      
      <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
      
      <link href="//fonts.googleapis.com/css?family=Ubuntu:400,500" rel="stylesheet">
      
   </head>
   <body>
      
      <h1>EDIT  SURVEY DATA</h1>
      
      <div class="porduct-order-agile">
         <form action="update_process_survey.jsp" method="post">
            <div class="form-group">
               <p>DEGREE</p>
               <input type="text" name="degree" value="<%=resultSet.getString(1) %>">

            </div>
            <div class="form-group">
               <p>YEAR </p>
               <input type="text" name="year" value="<%=resultSet.getString(2) %>">
            </div>
            <div class="form-group">
               <p>GENDER</p>
              <input type="text" name="gender" value="<%=resultSet.getString(3) %>">
            </div>
            <div class="form-group">
               <p>GPA</p>
              <input type="text" name="gpa" value="<%=resultSet.getString(4) %>">
            </div>
            <div class="form-group">
               <p>DESCRIPTION</p>
              <input type="text" name="description" value="<%=resultSet.getString(5) %>">
            </div>
            <div class="form-group">
               <p>CURRICULUM</p>
              <input type="text" name="curriculum" value="<%=resultSet.getString(6) %>">
            </div>
            <div class="form-group">
               <p>COURSE</p>
              <input type="text" name="course" value="<%=resultSet.getString(7) %>">
            </div>
            <div class="form-group">
               <p>PROGRAM</p>
              <input type="text" name="program" value="<%=resultSet.getString(8) %>">
            </div>
            <div class="form-group">
               <p>ELECTIVE</p>
              <input type="text" name="elective" value="<%=resultSet.getString(9) %>">
            </div>
            <div class="form-group">
               <p>CT</p>
              <input type="text" name="ct" value="<%=resultSet.getString(10) %>">
            </div>
            <div class="form-group">
               <p>FEEDBACK</p>
              <input type="text" name="feedback" value="<%=resultSet.getString(11) %>">
            </div>
            <div class="form-group">
               <p>CONFIDENT</p>
              <input type="text" name="confident" value="<%=resultSet.getString(12) %>">
            </div>
            <div class="form-group">
               <p>COMMUNICATION</p>
              <input type="text" name="communication" value="<%=resultSet.getString(13) %>">
            </div>
            <div class="form-group">
               <p>TRAINING</p>
              <input type="text" name="training" value="<%=resultSet.getString(14) %>">
            </div>
            <div class="form-group">
               <p>ACT</p>
              <input type="text" name="act" value="<%=resultSet.getString(15) %>">
            </div>
            <div class="form-group">
               <p>EXP</p>
              <input type="text" name="exp" value="<%=resultSet.getString(16) %>">
            </div>
            <div class="form-group">
               <p>TEXT_FIRST</p>
              <input type="text" name="text_first" value="<%=resultSet.getString(17) %>">
            </div>
            <div class="form-group">
               <p>TEXT_SECOND</p>
              <input type="text" name="text_second" value="<%=resultSet.getString(18) %>">
            </div>
            <div class="form-group">
               <p>TEXT_THIRD</p>
              <input type="text" name="text_third" value="<%=resultSet.getString(19) %>">
            </div>
            <div class="form-group">
               <p>TEXT_FOURT</p>
              <input type="text" name="text_fourth" value="<%=resultSet.getString(20) %>">
            </div>
            
            <button type="submit" class="btn btn-primary">Submit</button>
         </form>
      </div>
      <%
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
     
   </body>
</html>