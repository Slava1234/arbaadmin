package ru.arbaadmin.dao.customer;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import ru.arbaadmin.model.customer.CustomerCompany;

import java.util.List;

@Repository
public class CustomerCompanyImpl implements CustomerCompanyDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addCompany(CustomerCompany company) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(company);
    }

    @Override
    public void updateCompany(CustomerCompany company) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(company);
    }

    @Override
    public void removeCompany(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CustomerCompany company = (CustomerCompany) session.load(CustomerCompany.class, id);

        if (company != null) {
            session.delete(company);
        }
    }

    @Override
    public CustomerCompany getCompanyById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CustomerCompany company = (CustomerCompany) session.get(CustomerCompany.class, id);
        return company;
    }

    @Override
    //@Cacheable("indexResults")
    @SuppressWarnings("unchecked")
    public List<CustomerCompany> listCompany() {
        Session session = this.sessionFactory.getCurrentSession();
        List<CustomerCompany> companies = session.createCriteria(CustomerCompany.class).list();
        return companies;
    }




}












