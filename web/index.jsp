<%-- 
    Document   : index
    Created on : 15-Feb-2022, 12:02:07
    Author     : isac_
--%>

<%@page import="model.Cart"%>
<%@page import="model.Book"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="model.Catalog"%>
<%@page import="control.frontController.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%! Catalog catalog = new Catalog();%>
    <%
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        session.setAttribute("catalog", catalog);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <div id ="header">
            <jsp:include page="common/header.jsp"/>
        </div>

        <h1><header>Bienvenido al catálogo</header></h1>


        <%
            for (Book book : catalog.getBooks()) {
        %>
        <h2><b><%out.println(book.getTitle());%></b></h2>
        <img src="<%out.println(book.getThumbnailUrl());%>" width="300" height="375">
        <div>
            <div class="bookinfo"> <b>Autores:</b>
                <%
                    for (String author : book.getAuthors()) {
                        out.println(author + ",");
                    }
                %>
            </div>
            <div class="bookinfo"> <b>Categorias:</b>
                <%
                    for (String category : book.getCategories()) {
                        out.println(category + ",");
                    }
                %>
            </div>
            <div class="bookinfo"> <b>Estado:</b>
                <%out.println(book.getStatus());%>
            </div>
            <%if (book.getShortDescription() != null) { %>
            <div class="bookinfo"> <b>Descripción:</b>
                <%out.println(book.getShortDescription());%>
            </div>
            <%}%>
        </div>


        <div>
            <form action="FrontController">
                <input type="hidden" name="command" value="AddToCartCommand">
                <input type="hidden" name="isbn" value=<%out.println("\"" + book.getIsbn() + "\"");%>>
                <input type="hidden" name="requestOrigin" value="/index.jsp">
                <input class="addToCartButton" type="submit" value="Añadir al Carrito">
            </form>
            <form action="ProductInfo.jsp">
                <input type="hidden" name="isbn" value=<%out.println("\"" + book.getIsbn() + "\"");%>>
                <input class="viewProductInfoButton" type="submit" value="Ver Información del producto">
            </form>

            <% if (cart.getCart().containsKey(book)) { %>
            <div>
                <div class="cartInfo">
                    Actualmente tiene <%out.println(cart.getCart().get(book));%> ejemplare(s) en su carrito.
                </div>
                <form action="FrontController">
                    <input type="hidden" name="command" value="RemoveFromCartCommand">
                    <input type="hidden" name="isbn" value=<%out.println("\"" + book.getIsbn() + "\"");%>>
                    <input type="hidden" name="requestOrigin" value="/index.jsp">
                    <input class="removeFromCartButton" type="submit" value="Eliminar del Carrito">
                </form>
                <form action="FrontController">
                    <input type="hidden" name="command" value="IncrementBookCountCommand">
                    <input type="hidden" name="isbn" value=<%out.println("\"" + book.getIsbn() + "\"");%>>
                    <input type="hidden" name="requestOrigin" value="/index.jsp">
                    <input class="incrementInCartButton" type="submit" value="Incrementar ejemplares">
                </form>
                <form action="FrontController">
                    <input type="hidden" name="command" value="DecrementBookCountCommand">
                    <input type="hidden" name="isbn" value=<%out.println("\"" + book.getIsbn() + "\"");%>>
                    <input type="hidden" name="requestOrigin" value="/index.jsp">
                    <input class="decrementInCartButton" type="submit" value="Decrementar ejemplares">
                </form>
            </div>
            <%}%>
        </div>

        <%
            }
        %>


        <div id="footer">
            <jsp:include page="common/footer.jsp"/>
        </div>
    </body>
</html>
