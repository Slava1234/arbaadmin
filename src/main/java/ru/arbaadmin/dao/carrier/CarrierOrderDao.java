package ru.arbaadmin.dao.carrier;

import ru.arbaadmin.model.carrier.CarrierOrder;

import java.util.List;

public interface CarrierOrderDao {
    public void addOrder(CarrierOrder order);

    public void updateOrder(CarrierOrder order);

    public void removeOrder(int id);

    public CarrierOrder getOrderById(int id);

    public List<CarrierOrder> listOrder();

    public List<CarrierOrder> listOrderById(int id);

}
