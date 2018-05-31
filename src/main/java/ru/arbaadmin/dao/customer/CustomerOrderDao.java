package ru.arbaadmin.dao.customer;

import ru.arbaadmin.model.customer.CustomerOrder;

import java.util.List;

public interface CustomerOrderDao {
    public void addOrder(CustomerOrder order);

    public void updateOrder(CustomerOrder order);

    public void removeOrder(int id);

    public CustomerOrder getOrderById(int id);

    public List<CustomerOrder> listOrder();

    public List<CustomerOrder> listOrderById(int id);

}
