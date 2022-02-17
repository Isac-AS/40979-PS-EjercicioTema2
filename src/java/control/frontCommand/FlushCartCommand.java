package control.frontCommand;

import javax.servlet.http.HttpSession;
import model.Cart;

public class FlushCartCommand extends FrontCommand{

    @Override
    public void process() {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        cart.clearCart();
        forward("/index.jsp");
    }
}
