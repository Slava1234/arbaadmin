package ru.arbaadmin.dao;

import ru.arbaadmin.model.User;
import ru.arbaadmin.model.carrier.CarrierCompany;

import java.util.List;

public interface UserDao {
    public void addUser(User user);

    public void updateUser(User user);

    public void removeUser(int id);

    public User getUserById(int id);

    public List<User> listUser();

    public User checkAuth(String login, String password);

}
