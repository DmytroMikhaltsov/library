package com.project.services;

import com.project.dao.OrderDao;
import com.project.dao.PenaltyDao;
import com.project.dao.impl.OrderDaoImpl;
import com.project.dao.impl.PenaltyDaoImpl;
import com.project.entities.Book;
import com.project.entities.Order;
import com.project.entities.Penalty;
import com.project.entities.User;
import com.project.web.data.BookData;
import com.project.web.data.OrderData;
import com.project.web.data.PenaltyData;
import com.project.web.data.UserPrincipal;
import com.sun.tools.corba.se.idl.constExpr.Or;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


public class OrderService {
    private OrderDao orderDao;
    private BookService bookService;

    public OrderService(){
        this(OrderDaoImpl.getInstance(),new BookService());
    }

    public OrderService(OrderDao orderDao, BookService bookService) {
        this.orderDao = orderDao;
        this.bookService = bookService;
    }


    public static void changeStatus(int orderId, String status) {

        OrderDaoImpl orderDao = OrderDaoImpl.getInstance();
        Order order = orderDao.getById(orderId);
        order.setStatus(status);
        orderDao.update(order);
    }

    public static List<Order> getAllOrdersByUser(int userId) {
        OrderDaoImpl orderDao = OrderDaoImpl.getInstance();
        return orderDao.getAllOrdersByUser(userId);
    }

    public void create(Order order) {
        orderDao = OrderDaoImpl.getInstance();
        orderDao.create(order);
    }

    public static List<Order> getOrdersByStatus(String status) {
        OrderDao orderDao = OrderDaoImpl.getInstance();
        return orderDao.getOrdersByStatus(status);

    }

    public  List<OrderData> getOrderDataList(List<Order> orders) {

        List<OrderData> orderDataList = new ArrayList<>();
        for (Order order : orders) {
            int bookId = order.getBookId();
            BookData book = bookService.getById(bookId);
            BookData bookData = new BookData(book.getId(), book.getAuthor(), book.getBookName(), book.getBookEdition(), book.getReliaseDate());
            OrderData orderData = new OrderData(order.getId(), order.getUserId(), bookData, order.getBookSpot(), order.getStatus(), order.getReturnDate());
            PenaltyDao penaltyDao = PenaltyDaoImpl.getInstance();
            Penalty penaltyByOrder = penaltyDao.getPenaltyByOrder(order.getId());
            if (penaltyByOrder != null) {
                PenaltyData penaltyData = new PenaltyData(penaltyByOrder.getPenaltyCost());
                orderData.setPenaltyData(penaltyData);
            }
            orderDataList.add(orderData);
        } return orderDataList;
    }
}
