package ru.arbaadmin.service.customer;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.arbaadmin.dao.customer.CustomerCompanyDao;
import ru.arbaadmin.model.customer.CustomerCompany;

import java.util.List;

@Service
public class CustomerCompanyServiceImpl implements CustomerCompanyDao {

    private CustomerCompanyDao companyDao;

    public void setCompanyDao(CustomerCompanyDao companyDao) {
        this.companyDao = companyDao;
    }

    @Override
    @Transactional
    public void addCompany(CustomerCompany company) {
        this.companyDao.addCompany(company);
    }

    @Override
    @Transactional
    public void updateCompany(CustomerCompany company) {
        this.companyDao.updateCompany(company);
    }

    @Override
    @Transactional
    public void removeCompany(int id) {
        this.companyDao.removeCompany(id);
    }

    @Override
    @Transactional
    public CustomerCompany getCompanyById(int id) {
        return this.companyDao.getCompanyById(id);
    }

    @Override
    @Transactional
    public List<CustomerCompany> listCompany() {
        return this.companyDao.listCompany();
    }


}










