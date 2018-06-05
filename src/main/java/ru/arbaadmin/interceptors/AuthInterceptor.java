package ru.arbaadmin.interceptors;


import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import ru.arbaadmin.model.Roles;
import ru.arbaadmin.model.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Logger;

public class AuthInterceptor extends HandlerInterceptorAdapter {

    Logger logger = Logger.getLogger(this.getClass().getName());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        StringBuffer direction = request.getRequestURL();

        logger.info("url: " + direction.toString());

        User user;

        if (request.getSession().getAttribute("user") != null) {
            user = (User) request.getSession().getAttribute("user");
            logger.info("test " + user.getRole());
            if(user.getRole().equals(Roles.CUSTOMER) ) {
                logger.info("true" );
                return true;
            }


        }

            //return true;
            //
           // if (user.getRole().toLowerCase().equals())






        response.sendRedirect(request.getContextPath()+"/auth");
        return false;
        //return super.preHandle(request, response, handler);
    }
}
