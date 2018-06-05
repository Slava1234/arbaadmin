package ru.arbaadmin.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import ru.arbaadmin.model.User;
import ru.arbaadmin.model.carrier.CarrierCompany;

import java.util.List;

@Repository
public class UserImpl implements UserDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
    }

    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);

        if (user != null) {
            session.delete(user);
        }
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.get(User.class, id);
        return user;
    }

    @Override
    //@Cacheable("indexResults")
    @SuppressWarnings("unchecked")
    public List<User> listUser() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> userList = session.createCriteria(User.class).list();
        return userList;
    }

    public User checkAuth(String login, String password) {
        Session session = this.sessionFactory.getCurrentSession();

        User user1 = (User)session.createCriteria(User.class)
                .add(Restrictions.eq("login", login))
                .add(Restrictions.eq("password", password)).uniqueResult();

        return user1;
    }



}












