package application.DAO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import application.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.persistence.Query;
import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class BookDAOImpl implements BookDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void addBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);
    }

    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(book);
    }

    public void deleteBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        if (book != null) {
            session.delete(book);
        }
    }

    public Book getBookById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, new Integer(id));
        return book;
    }

    public List<Book> listBooks(int rowsPerPage, int page, String[] searchString) {
        Session session = this.sessionFactory.getCurrentSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Book> criteriaQuery = criteriaBuilder.createQuery(Book.class);
        Root<Book> root = criteriaQuery.from(Book.class);
        List<Predicate> predicates = new ArrayList<Predicate>();
        if (searchString[0] != null)
            if (!(searchString[0].equals(""))) {
                    predicates.add(criteriaBuilder.like(root.<String>get("title"), "%"+ searchString[0].replaceAll("%","")+"%"));
            }
        if (searchString[1] != null)
            if (!(searchString[1].equals(""))) {
                    predicates.add(criteriaBuilder.like(root.<String>get("author"), "%"+ searchString[1].replaceAll("%","")+"%"));
            }
        if (searchString[2] != null)
            if (!(searchString[2].equals(""))) {
                    predicates.add(criteriaBuilder.like(root.<String>get("isbn"), "%"+ searchString[2].replaceAll("%","")+"%"));
            }
        if (searchString[3] != null)
            if (!(searchString[3].equals(""))) {
                try {
                    if (searchString[3].startsWith(">")) {
                        predicates.add(criteriaBuilder.gt(root.<Integer>get("printYear"), Integer.parseInt(searchString[3].replaceAll(">", ""))));
                        //predicates.add(criteriaBuilder.like(root.<String> get("printYear"), searchString[3]));
                    } else if (searchString[3].startsWith("<")) {
                        predicates.add(criteriaBuilder.lt(root.<Integer>get("printYear"), Integer.parseInt(searchString[3].replaceAll("<", ""))));
                    } else {
                        predicates.add(criteriaBuilder.equal(root.<Integer>get("printYear"), Integer.parseInt(searchString[3])));
                        //predicates.add(criteriaBuilder.equal(root.get("printYear"), searchString[3]));
                    }
                } catch (NumberFormatException ignore) {
                    predicates.add(criteriaBuilder.equal(root.<Integer>get("printYear"), -1));
                }
            }
        if (searchString[4] != null)
            if (!(searchString[4].equals(""))) {
                if (searchString[4].contains("true")) {
                    predicates.add(criteriaBuilder.isTrue(root.<Boolean>get("readAlready")));
                } else if (searchString[4].contains("false")) {
                    predicates.add(criteriaBuilder.isFalse(root.<Boolean>get("readAlready")));
                }
            }
        criteriaQuery.where(predicates.toArray(new Predicate[predicates.size()]));
        Query query = session.createQuery(criteriaQuery);

        if (rowsPerPage > 0) {
            query.setFirstResult((page - 1) * rowsPerPage);
            query.setMaxResults(rowsPerPage);
        }

        return query.getResultList();
    }

    public long getBooksCount(String[] search) {
        List<Book> bookList = listBooks(0, 0, search);
        return bookList.size();
    }

    public void readBook(int id){
        Book book = getBookById(id);
        book.setReadAlready(true);
        updateBook(book);
    }
}
