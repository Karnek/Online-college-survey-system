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
<!DOCTYPE html>
<html>
<body>
<h1>Edit Feedback Data</h1>
<form method="post" action="update_process.jsp">
<br>
NAME:<br>
<input type="text" name="name" value="<%=resultSet.getString(1) %>">
<br>
EMAIL:<br>
<input type="text" name="email" value="<%=resultSet.getString(2) %>">
<br>
COMMENTS<br>
<input type="text" name="comments" value="<%=resultSet.getString(3) %>">
<br>
YEAR<br>
<input type="text" name="year" value="<%=resultSet.getString(4) %>">
<br>
<br>
<input type="submit" value="submit">
</form>

<%
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>