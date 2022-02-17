<%-- 
    Document   : ProductInfo
    Created on : Feb 16, 2022, 5:53:09 PM
    Author     : Isac
--%>

<%@page import="model.Catalog"%>
<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    private Book findBook(String isbn, ArrayList<Book> books) {
        for (Book book : books) {
            if (book.getIsbn().equals(isbn)) {
                return book;
            }
        }
        return null;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <div id ="header">
            <jsp:include page="common/header.jsp"/>
        </div>

        <style>
            .elements {
                font-size: 200%;
                font-weight: bold;
            }
        </style>

        <%
            Catalog catalog = (Catalog) session.getAttribute("catalog");
            Book book = findBook(request.getParameter("isbn"), catalog.getBooks());
        %>

        <h1>Información sobre <%out.println(book.getTitle());%></h1>

        <pre>
        <div class="elements">
Título:
<%if (book.getTitle() != null) {%><div><%out.println(book.getTitle());%></div><%} else { %><div>No dispone de un título (compralo)</div><%}%>

ISBN:
<%if (book.getIsbn() != null) {%><div><%out.println(book.getIsbn());%><br></div><%} else { %><div>No dispone de un ISBN (raro, no lo compres)</div><%}%>

Número de páginas:
<div><%out.println(book.getPageCount());%><br></div>
            
Fecha de publicación:
<%if (book.getPublishedDate() != null) {%><div><%out.println(book.getPublishedDate());%><br></div>
<%} else { %><div></div><%}%>

Descripción corta:
<%if (book.getShortDescription() != null) {%><div style="width: 1600px"><%out.println(book.getShortDescription());%><br></div><%} else { %><div>No se dispone de una descripción corta</div><%}%>

Descripción larga:
<%if (book.getLongDescription() != null) {%><div style="width: 1600px"><%out.println(book.getLongDescription());%><br></div><%} else { %><div>No se dispone de una descripción larga.</div><%}%>

Estado:
<%if (book.getStatus() != null) {%><div><%out.println(book.getStatus());%><br></div><%} else { %><div>Se desconoce el estado del producto</div><%}%>

Autores:
<%if (book.getAuthors() != null) {%><div><%for (String author : book.getAuthors()) {out.println(author + ",");}%></div><%} else { %><div>Se desconocen los autores del libro</div><%}%>

Categorías:
<%if (book.getCategories() != null) {%><div><%for (String category : book.getCategories()) {out.println(category + ",");}%></div><%} else { %><div>Se desconocen las categorías del libro</div><%}%>

Portada:
<%if (book.getThumbnailUrl() != null) {%><div><img src="<%out.println(book.getThumbnailUrl());%>" width="400" height="500"></div><%} else { %><div>El libro no cuenta con una portada</div><%}%>
</div>
        </pre>
        <%

        %>

        <div id="footer">
            <jsp:include page="common/footer.jsp"/>
        </div>
    </body>
</html>
