<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/survey";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
			String name = request.getParameter("name");
            String email = request.getParameter("email");
             String comments = request.getParameter("comments");
             String year = request.getParameter("year");


Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update contact set name=?,email=?,comments=?,year=? where year="+year;
ps = con.prepareStatement(sql);
ps.setString(1,name);
ps.setString(2, email);
ps.setString(3, comments);
ps.setString(4, year);
int i = ps.executeUpdate();
if(i > 0)
{
%>
 <script>
        alert("Data Updated Successfully");
        setTimeout(function() {
            document.location = "index.jsp";
        }, 1000); 
</script>
<%
}
else
{
%>
 <script>
        alert("There is a problem in updating Record.");
        setTimeout(function() {
            document.location = "index.jsp";
        }, 1000); 
</script>
<%
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}

%>