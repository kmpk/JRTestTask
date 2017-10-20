package application.service;

import application.DAO.BookDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import application.model.Book;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDAO bookDAO;

    @Transactional
    public void addBook(Book book) {
        this.bookDAO.addBook(book);
    }

    @Transactional
    public void updateBook(Book book) {
        this.bookDAO.updateBook(book);
    }

    @Transactional
    public void deleteBook(int id) {
        this.bookDAO.deleteBook(id);
    }

    @Transactional
    public Book getBookById(int id) {
        return this.bookDAO.getBookById(id);
    }

    @Transactional
    public List<Book> listBooks(int rowsPerPage, int page, String[] searchString) {
        return this.bookDAO.listBooks(rowsPerPage, page, searchString);    }

    @Transactional
    public long getBooksCount(String[] search) {
        return this.bookDAO.getBooksCount(search);
    }

    @Transactional
    public void readBook(int id){
        this.bookDAO.readBook(id);
    }
}
