package control.frontCommand;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.Book;
import model.Cart;
import model.Catalog;

public class RemoveFromCartCommand extends FrontCommand{

    @Override
    public void process() {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Catalog catalog = (Catalog) session.getAttribute("catalog");
        Book book = findBook((String) request.getParameter("isbn"), catalog.getBooks());
        
        if (book != null){
            if (!cart.removeBook(book)) {
                request.setAttribute("ErrorMessage", "No se ha podido eliminar el libro del carrito puede que no estuviera en éste.");
                forward("/unknown.jsp");
            }
        } else {
            request.setAttribute("ErrorMessage", "El libro no se encuentra en el catálogo");
            forward("/unknown.jsp");
        }
        forward((String) request.getParameter("requestOrigin"));
    }
    
    
    
}
