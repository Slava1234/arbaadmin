package ru.arbaadmin.dao.customer;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import ru.arbaadmin.model.currier.Company;

import java.util.List;

@Repository
public class CompanyImpl implements CompanyDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addCompany(Company company) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(company);
    }

    @Override
    public void updateCompany(Company company) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(company);
    }

    @Override
    public void removeCompany(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Company company = (Company) session.load(Company.class, id);

        if (company != null) {
            session.delete(company);
        }
    }

    @Override
    public Company getCompanyById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Company company = (Company) session.get(Company.class, id);
        return company;
    }

    @Override
    //@Cacheable("indexResults")
    @SuppressWarnings("unchecked")
    public List<Company> listCompany() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Company> companies = session.createCriteria(Company.class).list();
        return companies;
    }




}












