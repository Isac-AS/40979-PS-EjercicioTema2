<%-- 
    Document   : Carrito
    Created on : 15-Feb-2022, 12:13:24
    Author     : isac_
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="model.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
    </head>
    <body>
        <div id ="header">
            <jsp:include page="common/header.jsp"/>
        </div>


        <h1><header>Su Carrito</header></h1>

        <%
            Cart cart = (Cart) session.getAttribute("cart");
            HashMap<Book, Integer> contents = cart.getCart();
            for (Book book : contents.keySet()) {
        %>
        <h2><b><%out.println(book.getTitle());%></b></h2>
        <img src="<%out.println(book.getThumbnailUrl());%>" width="300" height="375">

        <div>
            <div class="cartInfo2">
                Actualmente tiene <%out.println(contents.get(book));%> ejemplare(s) en su carrito.
            </div>
            <form action="FrontController">
                <input type="hidden" name="command" value="RemoveFromCartCommand">
                <input type="hidden" name="isbn" value=<%out.println("\"" + book.getIsbn() + "\"");%>>
                <input type="hidden" name="requestOrigin" value="/Carrito.jsp">
                <input class="removeFromCartButton2" type="submit" value="Eliminar del Carrito">
            </form>
            <form action="FrontController">
                <input type="hidden" name="command" value="IncrementBookCountCommand">
                <input type="hidden" name="isbn" value=<%out.println("\"" + book.getIsbn() + "\"");%>>
                <input type="hidden" name="requestOrigin" value="/Carrito.jsp">
                <input class="incrementInCartButton2" type="submit" value="Incrementar el número de ejemplares">
            </form>
            <form action="FrontController">
                <input type="hidden" name="command" value="DecrementBookCountCommand">
                <input type="hidden" name="isbn" value=<%out.println("\"" + book.getIsbn() + "\"");%>>
                <input type="hidden" name="requestOrigin" value="/Carrito.jsp">
                <input class="decrementInCartButton2" type="submit" value="Decrementar el número de ejemplares">
            </form>
            <form action="ProductInfo.jsp">
                <input type="hidden" name="isbn" value=<%out.println("\"" + book.getIsbn() + "\"");%>>
                <input class="viewProductInfoButton2" type="submit" value="Ver Información del producto">
            </form>
        </div>

        <%
            }
        %>


        <div id="footer">
            <jsp:include page="common/footer.jsp"/>
        </div>
    </body>
</html>
