<%-- 
    Document   : unknown
    Created on : Feb 16, 2022, 11:41:49 AM
    Author     : Isac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Unknown command</title>
    </head>
    <body>
        <h1><header><big><center>Error</center></big></header></h1>
        <p><center>Ha ocurrido un error, vuelva al catálogo.</center></p>
        <p>
            <center>
                El error ha sido el siguiente:
                <%
                    final String error = (String) request.getAttribute("ErrorMessage");
                    out.println(error);
                %>
            </center>
        </p>
        <center>
            <form action="index.jsp"
                <input type="button" />
                <input type="submit" value="Volver al catálogo"/>
            </form>
        </center>
    </body>
</html>
