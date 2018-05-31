package ru.arbaadmin.dao.customer;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import ru.arbaadmin.model.customer.Order;

import java.util.List;

@Repository
public class OrderImpl implements OrderDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addOrder(Order order) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(order);
    }

    @Override
    public void updateOrder(Order order) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(order);
    }

    @Override
    public void removeOrder(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Order order = (Order) session.load(Order.class, id);

        if (order != null) {
            session.delete(order);
        }
    }

    @Override
    public Order getOrderById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Order order = (Order) session.get(Order.class, id);
        return order;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Order> listOrder() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Order> orders = session.createCriteria(Order.class).list();
        return orders;
    }


    // TODO check the feasibility of this design
    @Override
    @SuppressWarnings("unchecked")
    public List<Order> listOrderById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Order> orders = session.createCriteria(Order.class).add(Restrictions.eq("company_id", id)).list();
        return orders;
    }

}












