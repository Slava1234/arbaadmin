package ru.arbaadmin.dao.customer;

import ru.arbaadmin.model.currier.Order;

import java.util.List;

public interface OrderDao {
    public void addOrder(Order order);

    public void updateOrder(Order order);

    public void removeOrder(int id);

    public Order getOrderById(int id);

    public List<Order> listOrder();

    public List<Order> listOrderById(int id);

}
