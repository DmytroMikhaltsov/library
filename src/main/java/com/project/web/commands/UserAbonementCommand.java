package com.project.web.commands;


import com.project.entities.Order;
import com.project.services.BookService;
import com.project.services.OrderService;
import com.project.web.data.BookData;
import com.project.web.data.OrderData;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;


public class UserAbonementCommand implements Command{
   private BookService bookService;

   public UserAbonementCommand(){
       this(new BookService());
   }

    public UserAbonementCommand(BookService bookService) {
        this.bookService = bookService;
    }

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        List<Order> allOrders = OrderService.getAllOrdersByUser(Integer.parseInt(request.getParameter("userId")));

        List<OrderData> orders = new ArrayList<>();
        for (Order order :
                allOrders) {
            int bookId = order.getBookId();
            BookData book = bookService.getById(bookId);
            BookData bookData = new BookData(book.getId(),book.getAuthor(),book.getBookName(), book.getBookEdition(),book.getReliaseDate());
            OrderData orderData = new OrderData(order.getId(),order.getUserId(),bookData,order.getBookSpot(), order.getStatus(),order.getReturnDate());
            orders.add(orderData);
        }

        request.setAttribute("allOrders",orders);
        return "user-abonement.jsp";
    }
}
