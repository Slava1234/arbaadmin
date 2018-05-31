package ru.arbaadmin.service.carrier;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.arbaadmin.dao.carrier.CarrierCompanyDao;
import ru.arbaadmin.model.carrier.CarrierCompany;

import java.util.List;

@Service
public class CarrierCompanyServiceImpl implements CarrierCompanyDao {

    private CarrierCompanyDao companyDao;

    public void setCompanyDao(CarrierCompanyDao companyDao) {
        this.companyDao = companyDao;
    }

    @Override
    @Transactional
    public void addCompany(CarrierCompany company) {
        this.companyDao.addCompany(company);
    }

    @Override
    @Transactional
    public void updateCompany(CarrierCompany company) {
        this.companyDao.updateCompany(company);
    }

    @Override
    @Transactional
    public void removeCompany(int id) {
        this.companyDao.removeCompany(id);
    }

    @Override
    @Transactional
    public CarrierCompany getCompanyById(int id) {
        return this.companyDao.getCompanyById(id);
    }

    @Override
    @Transactional
    public List<CarrierCompany> listCompany() {
        return this.companyDao.listCompany();
    }


}










