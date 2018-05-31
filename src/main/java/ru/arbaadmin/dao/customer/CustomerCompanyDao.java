package ru.arbaadmin.dao.customer;

import ru.arbaadmin.model.customer.CustomerCompany;

import java.util.List;

public interface CustomerCompanyDao {
    public void addCompany(CustomerCompany company);

    public void updateCompany(CustomerCompany Company);

    public void removeCompany(int id);

    public CustomerCompany getCompanyById(int id);

    public List<CustomerCompany> listCompany();

}
