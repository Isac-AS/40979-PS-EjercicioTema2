<%-- 
    Document   : Compra
    Created on : Feb 16, 2022, 3:57:45 PM
    Author     : Isac
--%>

<%@page import="java.util.HashMap"%>
<%@page import="model.Book"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Efecturar compra</title>
    </head>
    <body>
        <div id ="header">
            <jsp:include page="common/header.jsp"/>
        </div>

        <style>
            h3{
                position: relative;
                text-align: left;
                font-size: 175%;
            }
            .price {
                position: relative;
                left: 650px;
                bottom: 60px;
                font-size: 175%;
            }
            .totalPrice {
                position: relative;
                text-align: center;
                font-size: 200%;
            }
            .buyAndGoBackToCatalogButton {
                position: relative;
                left: 775px;
                width: 500px;
                border: 3px solid #000000;
                padding: 10px;
                font-size: 150%;
                margin: 40px;
            }
        </style>

        <h1>Efectuar compra</h1>
        <h2><b>Efectuar la compra tiene como consecuencia vaciar el carrito</b></h2>
        <h2>Artículos:</h2>
        <%
            Cart cart = (Cart) session.getAttribute("cart");
            HashMap<Book, Integer> contents = cart.getCart();
            int price = 0;
            for (Book book : contents.keySet()) {
        %>
        <h3><b><%out.println(book.getTitle());%></b></h3>
        <div class="price">
            Precio: <%out.println(book.getPrice() 
                    + "*" 
                    + contents.get(book)
                    + " = "
                    + (book.getPrice() * contents.get(book))
                    + "€");%>
        </div>
        <%
                price += (book.getPrice() * contents.get(book));
            }
        %>
        <div class="totalPrice">
            Total a pagar: <%out.println(price + "€");%>
        </div>

        <form action="FrontController">
            <input type="hidden" name="command" value="FlushCartCommand">
            <input class="buyAndGoBackToCatalogButton" type="submit" 
                   value="Efectuar compra y volver al catálogo">
        </form>


        <div id="footer">
            <jsp:include page="common/footer.jsp"/>
        </div>
    </body>
</html>
