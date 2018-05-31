package ru.arbaadmin.service.customer;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.arbaadmin.dao.customer.CustomerOrderDao;
import ru.arbaadmin.model.customer.CustomerOrder;

import java.util.List;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderDao {

    private CustomerOrderDao orderDao;

    public void setOrderDao(CustomerOrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    @Transactional
    public void addOrder(CustomerOrder order) {
        this.orderDao.addOrder(order);
    }

    @Override
    @Transactional
    public void updateOrder(CustomerOrder order) {
        this.orderDao.updateOrder(order);
    }

    @Override
    @Transactional
    public void removeOrder(int id) {
        this.orderDao.removeOrder(id);
    }

    @Override
    @Transactional
    public CustomerOrder getOrderById(int id) {
        return this.orderDao.getOrderById(id);
    }

    @Override
    @Transactional
    public List<CustomerOrder> listOrder() {
        return this.orderDao.listOrder();
    }

    @Override
    @Transactional
    public List<CustomerOrder> listOrderById(int id) {
        return this.orderDao.listOrderById(id);
    }


}










