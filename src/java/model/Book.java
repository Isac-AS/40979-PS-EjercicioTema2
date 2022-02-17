package model;

import java.util.ArrayList;
import java.util.Date;

public class Book {
    private final String title;
    private final String isbn;
    private final long pageCount;
    private final String publishedDate;
    private final String thumbnailUrl;
    private final String shortDescription;
    private final String longDescription;
    private String status;
    private final ArrayList<String> authors;
    private final ArrayList<String> categories;
    private final int price;

    public Book(String title,
            String isbn,
            long pageCount,
            String publishedDate,
            String thumbnailUrl,
            String shortDescription,
            String longDescription,
            String status,
            ArrayList<String> authors,
            ArrayList<String> categories,
            int price) {
        this.title = title;
        this.isbn = isbn;
        this.pageCount = pageCount;
        this.publishedDate = publishedDate;
        this.thumbnailUrl = thumbnailUrl;
        this.shortDescription = shortDescription;
        this.longDescription = longDescription;
        this.status = status;
        this.authors = authors;
        this.categories = categories;
        this.price = price;
    }

    public String getTitle() {
        return title;
    }

    public String getIsbn() {
        return isbn;
    }

    public long getPageCount() {
        return pageCount;
    }

    public String getPublishedDate() {
        return publishedDate;
    }

    public String getThumbnailUrl() {
        return thumbnailUrl;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public String getLongDescription() {
        return longDescription;
    }

    public String getStatus() {
        return status;
    }

    public ArrayList<String> getAuthors() {
        return authors;
    }

    public ArrayList<String> getCategories() {
        return categories;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPrice() {
        return price;
    }
}
