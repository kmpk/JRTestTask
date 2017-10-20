package application.controller;

import application.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import application.model.Book;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "books/{page}")
    public String listBooks(@PathVariable("page") int page, Model model) {
        model.addAttribute("book", new Book());
        List<Book> books = bookService.listBooks(10, page, new String[5]);
        if (page != 1 && books.size() == 0) return "redirect:/books/" + (page - 1);
        model.addAttribute("listBooks", books);
        model.addAttribute("booksCount", bookService.getBooksCount(new String[5]));
        model.addAttribute("page", page);
        model.addAttribute("search", new String[5]);
        return "books";
    }

    @RequestMapping(value = "books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        bookService.addBook(book);
        long booksCount = bookService.getBooksCount(new String[5]);
        return "redirect:/books/" + (booksCount / 10 + (booksCount % 10 == 0 ? 0 : 1));
    }

    @RequestMapping("/delete/{id}&{page}")
    public String deleteBook(@PathVariable("id") int id, @PathVariable("page") int page,
                             @RequestParam(name = "title", required = false) String title, @RequestParam(name = "author", required = false) String author,
                             @RequestParam(name = "isbn", required = false) String isbn, @RequestParam(name = "year", required = false) String year,
                             @RequestParam(name = "read", required = false) String read) {
        bookService.deleteBook(id);
        if (title != null) return String.format("redirect:/search?page=%d&title=%s&author=%s&isbn=%s&year=%s&read=%s",
                page, title, author, isbn, year, read);
        return "redirect:/books/" + page;
    }

    @RequestMapping("/update/{id}&{page}")
    public String updateBook(@PathVariable("id") int id, @PathVariable("page") int page,
                             @RequestParam(name = "title", required = false) String title, @RequestParam(name = "author", required = false) String author,
                             @RequestParam(name = "isbn", required = false) String isbn, @RequestParam(name = "year", required = false) String year,
                             @RequestParam(name = "read", required = false) String read,
                             Model model) {
        if (title != null) {
            String[] search = {title, author, isbn, year, read};
            model.addAttribute("search", search);
        }
        model.addAttribute("book", bookService.getBookById(id));
        model.addAttribute("page", page);
        model.addAttribute("id", id);
        return "update";
    }

    @RequestMapping(value = "update/submit/", method = RequestMethod.POST)
    public String updateBookSubmit(@ModelAttribute("book") Book book, @ModelAttribute("page") int page,
                                   @ModelAttribute("action") String action, @ModelAttribute("titleSearch") String titleSearch,
                                   @ModelAttribute("authorSearch") String authorSearch, @ModelAttribute("isbnSearch") String isbnSearch,
                                   @ModelAttribute("yearSearch") String yearSearch, @ModelAttribute("readSearch") String readSearch) {
        if (action.equals("update")) bookService.updateBook(book);
        else bookService.readBook(book.getId());
        if (titleSearch != null) {
            String[] search = {titleSearch, authorSearch, isbnSearch, yearSearch, readSearch};
            return String.format("redirect:/search?page=%d&title=%s&author=%s&isbn=%s&year=%s&read=%s",
                    page, search[0], search[1], search[2], search[3], search[4]);
        }
        return "redirect:/books/" + page;
    }

    @RequestMapping(value = "/search")
    public String searchBook(@RequestParam("title") String title, @RequestParam("author") String author,
                             @RequestParam("isbn") String isbn, @RequestParam("year") String year,
                             @RequestParam("read") String read, @RequestParam("page") int page, Model model) {
        if (title.equals("") && author.equals("") && isbn.equals("") && year.equals("") && read.equals(""))
            return "redirect:/books/" + page;
        else {
            String[] search = {title, author, isbn, year, read};
            List<Book> books = bookService.listBooks(10, page, search);
            if (page != 1 && books.size() == 0)
                return String.format("redirect:/search?page=%d&title=%s&author=%s&isbn=%s&year=%s&read=%s",
                        page - 1, title, author, isbn, year, read);
            model.addAttribute("listBooks", books);
            model.addAttribute("book", new Book());
            model.addAttribute("booksCount", bookService.getBooksCount(search));
            model.addAttribute("page", page);
            model.addAttribute("search", search);
            return "books";
        }
    }
    @RequestMapping(value = "/")
    public String redirect() {
        return "redirect:/books/1";
    }
}
