package control.frontCommand;

import javax.servlet.http.HttpSession;
import model.*;

public class AddToCartCommand extends FrontCommand{

    @Override
    public void process() {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Catalog catalog = (Catalog) session.getAttribute("catalog");
        Book book = findBook((String) request.getParameter("isbn"), catalog.getBooks());
        
        if (book != null){
            if (!cart.addBook(book)) {
                request.setAttribute("ErrorMessage", "No se ha podido agregar el libro al carrito, ya se encontraba en éste.");
                forward("/unknown.jsp");
            }
        } else {
            request.setAttribute("ErrorMessage", "El libro no se encuentra en el catálogo");
            forward("/unknown.jsp");
        }
        forward((String) request.getParameter("requestOrigin"));
    }
    
}
