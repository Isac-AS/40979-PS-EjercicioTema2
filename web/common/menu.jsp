
<style>
    h1 {
        text-align: center;
        font-size: 300%;
    }
    .cartButton {
        position: relative;
        left: 1100px;
        width: 300px;
        top: 56px;
        border: 3px solid #000000;
        padding: 10px;
        font-size: 150%;
    }
    .buyButton {
        position: relative;
        left:  1500px;
        width: 300px;
        bottom: 52px;
        border: 3px solid #000000;
        padding: 10px;
        font-size: 150%;
    }
    .homeButton {
        position: relative;
        left: 400px;
        width: 300px;
        top: 0px;
        border: 3px solid #000000;
        padding: 10px;
        font-size: 150%;
    }

    <%-- Estilos que se usan en index.jsp --%>
    h2 {
        position: initial;
        text-align: left;
        font-size: 175%;
    }
    .bookinfo {
        position: relative;
        left: 350px;
        bottom: 300px;
        font-size: 125%;
        width: 650px;
    }
    .addToCartButton {
        position: relative;
        left: 1200px;
        bottom: 450px;
        width: 250px;
        border: 3px solid #000000;
        padding: 5px;
        font-size: 150%;
    }
    .cartInfo{
        position: relative;
        left: 1650px;
        bottom: 575px;
        width: 275px;
        font-size: 150%;
        text-align: center;
    }
    .removeFromCartButton {
        position: relative;
        left: 1650px;
        bottom: 525px;
        width: 275px;
        border: 3px solid #000000;
        padding: 5px;
        font-size: 150%;
    }
    .incrementInCartButton {
        position: relative;
        left: 1650px;
        bottom: 475px;
        width: 275px;
        border: 3px solid #000000;
        padding: 5px;
        font-size: 150%;
    }
    .decrementInCartButton {
        position: relative;
        left: 1650px;
        bottom: 445px;
        width: 275px;
        border: 3px solid #000000;
        padding: 5px;
        font-size: 150%;
    }
    .viewProductInfoButton {
        position: relative;
        left: 1125px;
        bottom: 400px;
        width: 400px;
        border: 3px solid #000000;
        padding: 5px;
        font-size: 150%;
    }

    <%-- Estilos que se usan en carrito.jsp --%>
    .cartInfo2{
        position: relative;
        left: 350px;
        bottom: 250px;
        width: 275px;
        font-size: 150%;
        text-align: center;
    }
    .removeFromCartButton2 {
        position: relative;
        left: 800px;
        bottom: 325px;
        width: 450px;
        border: 3px solid #000000;
        padding: 5px;
        font-size: 150%;
    }
    .incrementInCartButton2 {
        position: relative;
        left: 800px;
        bottom: 275px;
        width: 450px;
        border: 3px solid #000000;
        padding: 5px;
        font-size: 150%;
    }
    .decrementInCartButton2 {
        position: relative;
        left: 800px;
        bottom: 225px;
        width: 450px;
        border: 3px solid #000000;
        padding: 5px;
        font-size: 150%;
    }
    .viewProductInfoButton2 {
        position: relative;
        left: 1450px;
        bottom: 400px;
        width: 400px;
        height: 60px;
        border: 3px solid #000000;
        padding: 5px;
        font-size: 150%;
    }

</style>

<form action="Carrito.jsp">
    <input class="cartButton" type="submit" value="Carrito"/>
</form>

<form action="index.jsp">
    <input class="homeButton" type="submit" value="Catálogo"/>
</form>

<form action="Compra.jsp">
    <input class="buyButton" type="submit" value="Efectuar Compra"/>
</form>
