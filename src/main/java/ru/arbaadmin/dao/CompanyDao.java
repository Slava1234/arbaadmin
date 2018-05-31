package ru.arbaadmin.dao;

import ru.arbaadmin.model.Company;
import ru.arbaadmin.model.Order;

import java.util.List;

public interface CompanyDao {
    public void addCompany(Company company);

    public void updateCompany(Company Company);

    public void removeCompany(int id);

    public Company getCompanyById(int id);

    public List<Company> listCompany();

}
