package ru.arbaadmin.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.arbaadmin.dao.CompanyDao;
import ru.arbaadmin.model.Company;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyDao {

    private CompanyDao companyDao;

    public void setCompanyDao(CompanyDao companyDao) {
        this.companyDao = companyDao;
    }

    @Override
    @Transactional
    public void addCompany(Company company) {
        this.companyDao.addCompany(company);
    }

    @Override
    @Transactional
    public void updateCompany(Company company) {
        this.companyDao.updateCompany(company);
    }

    @Override
    @Transactional
    public void removeCompany(int id) {
        this.companyDao.removeCompany(id);
    }

    @Override
    @Transactional
    public Company getCompanyById(int id) {
        return this.companyDao.getCompanyById(id);
    }

    @Override
    @Transactional
    public List<Company> listCompany() {
        return this.companyDao.listCompany();
    }


}










