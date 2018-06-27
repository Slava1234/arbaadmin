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

import java.io.UnsupportedEncodingException;
import java.security.*;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class MainController {

    Logger logger = Logger.getLogger(this.getClass().getName());

    private final String f1 = "111";
    private final String f2 = "8164";

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
    public String t(HttpServletRequest request) {

        String c = f1+"arba778".hashCode()+f2;

        return c;


        /*if(c.equals("111-7492835448164"))
            return "treu";
        else {
            return "false";
        }*/

    }




    @RequestMapping(value = "/check-auth", method = RequestMethod.POST)
    public String checkCurrier(@RequestParam("login") String login, @RequestParam("password") String password, HttpServletRequest request) {

        String cPass = f1+password.hashCode()+f2;

        User user = this.userDao.checkAuth(login, cPass);
        HttpSession session = request.getSession();

        if (user != null)
            session.setAttribute("user", user);
        else
            return "redirect:/auth";

        return "redirect:/" + user.getRole().toLowerCase() + "/main";

    }


    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {

        HttpSession session = request.getSession();

        User user = (User) request.getSession().getAttribute("user");

        if (user != null)
            session.setAttribute("user", null);
        else
            return "redirect:/";

        return "redirect:/";
    }


}
















