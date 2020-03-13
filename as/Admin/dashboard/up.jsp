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
String sql ="select * from contact where year="+year;
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
      
      <h1>Edit Feedback Data</h1>
      
      <div class="porduct-order-agile">
         <form action="update_process.jsp" method="post">
            <div class="form-group">
               <p>NAME</p>
               <input type="text" name="name" value="<%=resultSet.getString(1) %>">

            </div>
            <div class="form-group">
               <p>EMAIL </p>
               <input type="text" name="email" value="<%=resultSet.getString(2) %>">
            </div>
            <div class="form-group">
               <p>COMMENTS</p>
              <input type="text" name="comments" value="<%=resultSet.getString(3) %>">
            </div>
            <div class="form-group">
               <p>YEAR</p>
              <input type="text" name="year" value="<%=resultSet.getString(4) %>">
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