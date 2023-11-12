<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function mensaje (){
                alert("Registro dado de alta");
                
            }
            
        </script>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
            int contraa = Integer.parseInt(request.getParameter("contrasenia"));
            String nombree = request.getParameter("nombre");
            String estadoo = request.getParameter("estado");
            String sexoo = request.getParameter("sexo");
            Connection con = null;
            Statement sta = null;
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/emps?autoReconnect=true&useSSL=false","root","n0m3l0");
                sta = con.createStatement();
                sta.executeUpdate("insert into datos(contrasenia, nombre, estado,sexo) values('"+contraa+"','"+nombree+"','"+estadoo+"','"+sexoo+"'); ");
                out.print("<script>mensaje();</script");
                con.close();
                sta.close();           
            }
            catch(SQLException error){
                out.print(error.toString());
            }
        %>
        <a href="index.html">regresar</a>
    </body>
</html>