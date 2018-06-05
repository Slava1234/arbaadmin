package ru.arbaadmin.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.arbaadmin.dao.UserDao;
import ru.arbaadmin.dao.customer.CustomerCompanyDao;
import ru.arbaadmin.dao.customer.CustomerOrderDao;
import ru.arbaadmin.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class MainController {


    private UserDao userDao;

    @Autowired(required = true)
    @Qualifier(value = "userServiceImpl")
    public void setUserService(UserDao userDao) {
        this.userDao = userDao;
    }


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "arbaadmin/welcome";
    }

    @RequestMapping(value = "/auth", method = RequestMethod.GET)
    public String carrierAuth() {
        return "arbaadmin/auth";
    }





    @RequestMapping(value = "/t", method = RequestMethod.GET)
    @ResponseBody
    public StringBuffer t(HttpServletRequest request) {
        return request.getRequestURL();
    }




    @RequestMapping(value = "/check-auth", method = RequestMethod.POST)
    public String checkCurrier(@RequestParam("login") String login, @RequestParam("password") String password, HttpServletRequest request) {

        User user = this.userDao.checkAuth(login, password);

        HttpSession session = request.getSession();


        if (user != null)
            session.setAttribute("user", user);
        else
            return "redirect:/auth";


        return "redirect:/" + user.getRole().toLowerCase() + "/main";

    }


}
















