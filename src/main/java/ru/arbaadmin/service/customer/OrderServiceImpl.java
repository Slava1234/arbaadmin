package ru.arbaadmin.service.customer;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.arbaadmin.dao.customer.OrderDao;
import ru.arbaadmin.model.customer.Order;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderDao {

    private OrderDao orderDao;

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    @Transactional
    public void addOrder(Order order) {
        this.orderDao.addOrder(order);
    }

    @Override
    @Transactional
    public void updateOrder(Order order) {
        this.orderDao.updateOrder(order);
    }

    @Override
    @Transactional
    public void removeOrder(int id) {
        this.orderDao.removeOrder(id);
    }

    @Override
    @Transactional
    public Order getOrderById(int id) {
        return this.orderDao.getOrderById(id);
    }

    @Override
    @Transactional
    public List<Order> listOrder() {
        return this.orderDao.listOrder();
    }

    @Override
    @Transactional
    public List<Order> listOrderById(int id) {
        return this.orderDao.listOrderById(id);
    }


}










