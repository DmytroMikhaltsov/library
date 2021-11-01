package com.project.web.commands;

import com.project.dao.impl.BookDao;
import com.project.entities.Book;
import com.project.services.BookService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class BookCommand extends AbstractCommand{

    @Override
    protected String executeGet(HttpServletRequest request, HttpServletResponse response) {
        String searchParameter = request.getParameter("search");
        if (searchParameter != null) {
            List<Book> searchedBook = BookService.searchBook(searchParameter);
            request.setAttribute("books", searchedBook);
        }else {
        BookDao bookDao = BookDao.getInstance();
        List<Book> books = bookDao.getAll();
        request.setAttribute("books",books);
        }
        return "books.jsp";
    }

    @Override
    protected String executePost(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }
}
