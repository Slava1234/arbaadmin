package ru.arbaadmin.service.carrier;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.arbaadmin.dao.carrier.CarrierOrderDao;
import ru.arbaadmin.model.carrier.CarrierOrder;


import java.util.List;

@Service
public class CarrierOrderServiceImpl implements CarrierOrderDao {

    private CarrierOrderDao orderDao;

    public void setOrderDao(CarrierOrderDao orderDao) {
        this.orderDao = orderDao;
    }

    @Override
    @Transactional
    public void addOrder(CarrierOrder order) {
        this.orderDao.addOrder(order);
    }

    @Override
    @Transactional
    public void updateOrder(CarrierOrder order) {
        this.orderDao.updateOrder(order);
    }

    @Override
    @Transactional
    public void removeOrder(int id) {
        this.orderDao.removeOrder(id);
    }

    @Override
    @Transactional
    public CarrierOrder getOrderById(int id) {
        return this.orderDao.getOrderById(id);
    }

    @Override
    @Transactional
    public List<CarrierOrder> listOrder() {
        return this.orderDao.listOrder();
    }

    @Override
    @Transactional
    public List<CarrierOrder> listOrderById(int id) {
        return this.orderDao.listOrderById(id);
    }


}










