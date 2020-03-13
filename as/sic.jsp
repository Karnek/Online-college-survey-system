<%@page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.io.*"%>
    <html> 
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta http-equiv="refresh" content="1;url=http://localhost:8085/as" />


            <title>SIC Check</title>
            <script>
    function test(){
        alert("PLEASE ENTER CORRECT SIC OR FEEDBACK ALREADY TAKEN FOR THIS SIC"); 
    }
    
 </script>

        </head> 
        <body> 
            <%
            int i=1;
            int j=0;

            String sic = request.getParameter("sic");
            String sql="Update validate set count=1  where sic="+sic;
            
    
            
           

    try{
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/survey","root","");
        PreparedStatement theStatement = conn.prepareStatement("select sic from validate where sic=? and count=0 ");
        theStatement.setString(1,request.getParameter("sic"));
         request.setAttribute("alertMsg", "data");
         ResultSet theResult = theStatement.executeQuery();
        if(theResult.next())
        {
                        theStatement = conn.prepareStatement(sql);
                         j= theStatement.executeUpdate();

                        session.setAttribute("sic", sic);
                        response.sendRedirect("takesurvey.html");
        }
        else
        { %>

             <!-- <script>
        test();
        </script> -->

             
                          
                           
       

       <%}
}


    catch(ClassNotFoundException e){

        e.printStackTrace();
         

          }
            


            %>
    </body> 
    </html>