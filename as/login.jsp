								LOGIN.JSP

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Success</title>
	</head>
	<body>
		<%
		
		String username = request.getParameter("username");
				String uid = (String)session.getAttribute("username");
				if (uid == null)
				{
		%>
					 <jsp:forward page="Project/Admin.jsp"/>
		<%	
				}
				else
				{%>
					<% response.sendRedirect("Admin/dashboard/index.jsp?username="+username); %>
					
					
					
					
					
				<%}
		%> 
	</body>
</html>
