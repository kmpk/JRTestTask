package application.DAO;

import application.model.Book;
import java.util.List;

public interface BookDAO {
    void addBook (Book book);

    void updateBook(Book book);

    void deleteBook(int id);

    Book getBookById(int id);

    List<Book> listBooks(int rowsPerPage, int page, String[] searchString);

    long getBooksCount(String[] search);

    void readBook(int id);
}
