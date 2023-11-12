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
        <%@page import="java.sql.*" %><-<!-- Permite usar SQL en un JSP --> 
        <% //<%%> se usa para abrir la parte lógica de un JSP
            int contraa = Integer.parseInt(request.getParameter("contrasenia"));//Para datos tipo int, se usa Integer,parseInt(request.getParameter("Name del input"))
            String nombree = request.getParameter("nombre");//Se extraen los valores del nombre de los input del HTML anterior con request.getParameter
            String estadoo = request.getParameter("estado");
            String sexoo = request.getParameter("sexo");
            Connection cnx = null;//Variable de conexion
            Statement sta = null;//Variable de Statement
            ResultSet res = null;//Variable de ResulSet(No se usa en este formulario, solo está de ejemplo)
            
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");//Driver JDBC de MySQL  
                con= DriverManager.getConnection("jdbc:mysql://localhost:3306/emps?autoReconnect=true&useSSL=false","root","n0m3l0");
                //jdbc:mysql://localhost:Puerto/Nombre de la Base de Datos?autoReconnect=true&useSSL=false","user de MySQL","contraseña de MySQL"
                sta = con.createStatement();//Crea el Statement
                sta.executeUpdate("insert into datos(contrasenia, nombre, estado,sexo) values('"+contraa+"','"+nombree+"','"+estadoo+"','"+sexoo+"'); ");//executeUpdate sirve para modificar valores 
                //sta.executeUpdate("insert into Nombre de la tabla(columna n) values('"+valor n+"'); ");
                out.print("<script>mensaje();</script");
                sta.close();//Cierra el Statement           
                con.close();//Cierra la conexión
            }
            catch(SQLException error){
                out.print(error.toString());//Imprime en el JSP los posibles errores
            }
        %>
        <a href="index.html">Regresar</a>
    </body>
</html>