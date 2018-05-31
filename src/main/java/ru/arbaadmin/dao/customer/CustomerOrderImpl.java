package ru.arbaadmin.dao.customer;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import ru.arbaadmin.model.customer.CustomerOrder;

import java.util.List;

@Repository
public class CustomerOrderImpl implements CustomerOrderDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addOrder(CustomerOrder order) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(order);
    }

    @Override
    public void updateOrder(CustomerOrder order) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(order);
    }

    @Override
    public void removeOrder(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CustomerOrder order = (CustomerOrder) session.load(CustomerOrder.class, id);

        if (order != null) {
            session.delete(order);
        }
    }

    @Override
    public CustomerOrder getOrderById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CustomerOrder order = (CustomerOrder) session.get(CustomerOrder.class, id);
        return order;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<CustomerOrder> listOrder() {
        Session session = this.sessionFactory.getCurrentSession();
        List<CustomerOrder> orders = session.createCriteria(CustomerOrder.class).list();
        return orders;
    }


    // TODO check the feasibility of this design
    @Override
    @SuppressWarnings("unchecked")
    public List<CustomerOrder> listOrderById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        List<CustomerOrder> orders = session.createCriteria(CustomerOrder.class).add(Restrictions.eq("company_id", id)).list();
        return orders;
    }

}












