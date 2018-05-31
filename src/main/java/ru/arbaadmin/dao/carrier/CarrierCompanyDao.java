package ru.arbaadmin.dao.carrier;

import ru.arbaadmin.model.carrier.CarrierCompany;

import java.util.List;

public interface CarrierCompanyDao {
    public void addCompany(CarrierCompany company);

    public void updateCompany(CarrierCompany Company);

    public void removeCompany(int id);

    public CarrierCompany getCompanyById(int id);

    public List<CarrierCompany> listCompany();

}
