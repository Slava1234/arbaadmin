package ru.arbaadmin.dao.currier;

import ru.arbaadmin.model.currier.Company;

import java.util.List;

public interface CompanyDao {
    public void addCompany(Company company);

    public void updateCompany(Company Company);

    public void removeCompany(int id);

    public Company getCompanyById(int id);

    public List<Company> listCompany();

}
