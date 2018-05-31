package ru.arbaadmin.dao.carrier;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import ru.arbaadmin.model.carrier.CarrierCompany;

import java.util.List;

@Repository
public class CarrierCompanyImpl implements CarrierCompanyDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addCompany(CarrierCompany company) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(company);
    }

    @Override
    public void updateCompany(CarrierCompany company) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(company);
    }

    @Override
    public void removeCompany(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CarrierCompany company = (CarrierCompany) session.load(CarrierCompany.class, id);

        if (company != null) {
            session.delete(company);
        }
    }

    @Override
    public CarrierCompany getCompanyById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        CarrierCompany company = (CarrierCompany) session.get(CarrierCompany.class, id);
        return company;
    }

    @Override
    //@Cacheable("indexResults")
    @SuppressWarnings("unchecked")
    public List<CarrierCompany> listCompany() {
        Session session = this.sessionFactory.getCurrentSession();
        List<CarrierCompany> companies = session.createCriteria(CarrierCompany.class).list();
        return companies;
    }




}












