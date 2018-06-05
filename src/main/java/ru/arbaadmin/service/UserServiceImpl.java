package ru.arbaadmin.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.arbaadmin.dao.UserDao;
import ru.arbaadmin.dao.carrier.CarrierCompanyDao;
import ru.arbaadmin.model.User;
import ru.arbaadmin.model.carrier.CarrierCompany;

import java.util.List;

@Service
public class UserServiceImpl implements UserDao {

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    @Transactional
    public void addUser(User user) {
        this.userDao.addUser(user);
    }

    @Override
    @Transactional
    public void updateUser(User user) {
        this.userDao.updateUser(user);
    }

    @Override
    @Transactional
    public void removeUser(int id) {
        this.userDao.removeUser(id);
    }

    @Override
    @Transactional
    public User getUserById(int id) {
        return this.userDao.getUserById(id);
    }

    @Override
    @Transactional
    public List<User> listUser() {
        return this.userDao.listUser();
    }

    @Override
    @Transactional
    public User checkAuth(String login, String password) {
        return this.userDao.checkAuth(login, password);
    }

}










