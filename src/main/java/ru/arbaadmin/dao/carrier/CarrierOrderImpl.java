package ru.arbaadmin.dao.carrier;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import ru.arbaadmin.model.carrier.CarrierOrder;

import java.util.List;

@Repository
public class CarrierOrderImpl implements CarrierOrderDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addOrder(CarrierOrder order) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(order);
    }

    @Override
    public void updateOrder(CarrierOrder order) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(order);
    }

    @Override
    public void removeOrder(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CarrierOrder order = (CarrierOrder) session.load(CarrierOrder.class, id);

        if (order != null) {
            session.delete(order);
        }
    }

    @Override
    public CarrierOrder getOrderById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CarrierOrder order = (CarrierOrder) session.get(CarrierOrder.class, id);
        return order;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<CarrierOrder> listOrder() {
        Session session = this.sessionFactory.getCurrentSession();
        List<CarrierOrder> orders = session.createCriteria(CarrierOrder.class).list();
        return orders;
    }


    // TODO check the feasibility of this design
    @Override
    @SuppressWarnings("unchecked")
    public List<CarrierOrder> listOrderById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        List<CarrierOrder> orders = session.createCriteria(CarrierOrder.class).add(Restrictions.eq("company_id", id)).list();
        return orders;
    }

}












