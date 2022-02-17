package model;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class Catalog {

    private final ArrayList<Book> books;

    public Catalog() {
        books = new ArrayList<>();
        JSONParser parser = new JSONParser();
        
        try {
            // Ponga aquí la ruta al documento.
            //Object object = parser.parse(new FileReader("C:\\Users\\Isac\\OneDrive - Universidad de Las Palmas de Gran Canaria\\Tercero\\2-Segundo semestre\\40979 - PS\\Practicas\\NetBeans\\EjercicioTema2\\books_ulr.json"));
            Object object = parser.parse(new FileReader("books_ulr.json"));
            JSONArray array = (JSONArray) object;
            Iterator<JSONObject> iterator = array.iterator();
            JSONObject book;
            while (iterator.hasNext()) {
                book = (JSONObject) iterator.next();
                JSONObject publishedDate = (JSONObject) book.get("publishedDate");
                String date = null;
                try {
                    date = (String) publishedDate.get("$date");
                } catch (Exception e) {
                    System.out.println(e);
                }
                books.add(new Book(
                        (String) book.get("title"),
                        (String) book.get("isbn"),
                        (long)   book.get("pageCount"),
                        date,
                        (String) book.get("thumbnailUrl"),
                        (String) book.get("shortDescription"),
                        (String) book.get("longDescription"),
                        (String) book.get("status"),
                        (ArrayList) book.get("authors"),
                        (ArrayList) book.get("categories"),
                        (int) ((Math.random() * (50 - 20)) + 20)
                        ));
            }
        } catch (IOException | ParseException e) {
            System.out.println(e);
        }
    }

    public ArrayList<Book> getBooks() {
        return books;
    }

    public Book getBook(String isbn) {
        for (Book book : books) {
            if (book.getIsbn().equals(isbn)) {
                return book;
            }
        }
        return null;
    }

    public ArrayList<Book> getBooksOfCategory(String category) {
        ArrayList<Book> result = new ArrayList<>();
        books.stream().filter((book) -> (book.getCategories().contains(category))).forEachOrdered((book) -> {
            result.add(book);
        });
        return result;
    }
}
