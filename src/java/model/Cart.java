package model;

import java.util.HashMap;

public class Cart {
    private HashMap<Book, Integer> cart;

    public Cart() {
        this.cart = new HashMap<>();
    }

    public HashMap<Book, Integer> getCart() {
        return cart;
    }
    
    public boolean addBook(Book book){
        if (cart.containsKey(book)) return false;
        cart.put(book, 1);
        return true;
    }
    
    public boolean removeBook(Book book) {
        return (cart.remove(book) != null);
    }
    
    public boolean incrementBookCount(Book book) {
        return (cart.replace(book, cart.get(book) + 1) != null);
    }
    
    public boolean decrementBookCount(Book book) {
        if (cart.replace(book, cart.get(book) - 1) == null) return false;
        if (cart.get(book) == 0) {
            cart.remove(book);
        }
        return true;
    }
    
    public void clearCart() {
        this.cart = new HashMap<>();
    }
}
