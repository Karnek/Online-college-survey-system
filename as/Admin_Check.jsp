<%@page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.io.*"%>
    <html> 
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Login Check</title>
            <script type="text/javascript">
        function alertName(){
        alert("Invalid Credentials");
        } 
</script>
        </head> 
        <body> 
            <%
            String username = request.getParameter("username");
            String password = request.getParameter("pass");
    
            
           

    try{
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/survey","root","");
        PreparedStatement theStatement = conn.prepareStatement("select * from admin where UserID=? and Password=?");
            theStatement.setString(1,request.getParameter("username"));
            theStatement.setString(2,request.getParameter("pass"));
            request.setAttribute("alertMsg", "data");
                ResultSet theResult = theStatement.executeQuery();
                session.setAttribute("userkey","1");
                    if(theResult.next())
                    {
                        session.setAttribute("username", username);
                        response.sendRedirect("login.jsp?username="+username);
                    }
                    else
                    {
                            String redirectURL  = "Admin.jsp";
                             
                           response.sendRedirect(redirectURL);
                          
                           
                     }
}


    catch(ClassNotFoundException e){

        e.printStackTrace();
         

          }
            


            %>
    </body> 
    </html>