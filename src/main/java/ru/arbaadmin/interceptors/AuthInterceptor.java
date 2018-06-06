package ru.arbaadmin.interceptors;


import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import ru.arbaadmin.model.Roles;
import ru.arbaadmin.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.logging.Logger;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    Logger logger = Logger.getLogger(this.getClass().getName());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.info("user came through AuthInterceptor");


        String direction = request.getRequestURL().toString();

        User user;

        if (request.getSession().getAttribute("user") != null) {
            user = (User) request.getSession().getAttribute("user");
            logger.info("test " + user.getRole());

            if (direction.contains(Roles.CUSTOMER.toString().toLowerCase())) {
                logger.info("test right direction: " + user.getRole());
                if(user.getRole().equals(Roles.CUSTOMER.toString())) {
                    logger.info(Roles.CUSTOMER + " logged in test" );
                    return true;
                }
            }

            if (direction.contains(Roles.CARRIER.toString().toLowerCase())) {
                logger.info("test right direction: " + user.getRole());
                if(user.getRole().equals(Roles.CARRIER.toString())) {
                    logger.info(Roles.CARRIER + " logged in test");
                    return true;
                }
            }


        }


        response.sendRedirect(request.getContextPath()+"/auth");
        return false;
        //return super.preHandle(request, response, handler);
    }
}
