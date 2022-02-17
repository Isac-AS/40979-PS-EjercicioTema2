package control.frontCommand;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import model.Book;
import model.Cart;
import model.Catalog;

public class IncrementBookCountCommand extends FrontCommand{

    @Override
    public void process() {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        Catalog catalog = (Catalog) session.getAttribute("catalog");
        Book book = findBook((String) request.getParameter("isbn"), catalog.getBooks());
        
        if (book != null){
            if (!cart.incrementBookCount(book)){
                request.setAttribute("ErrorMessage",
                        "No se ha podido incrementar la cuenta del libro."
                        + "Puede que el libro no se encuentre en el carrito.");
                forward("/unknown.jsp");
            }
        } else {
            request.setAttribute("ErrorMessage", "El libro no se encuentra en el catálogo");
            forward("/unknown.jsp");
        }
        forward((String) request.getParameter("requestOrigin"));
    }
}
