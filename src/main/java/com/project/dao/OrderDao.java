package com.project.dao;

import com.project.entities.Order;

import java.util.List;

public interface OrderDao extends EntityDao<Order>{

    List<Order> getAllOrdersByUser(int usersId);
    List<Order> getOrdersByStatus(String status);


}
