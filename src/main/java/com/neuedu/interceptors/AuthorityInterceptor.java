package com.neuedu.interceptors;

import com.neuedu.consts.Const;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import com.neuedu.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
public class AuthorityInterceptor implements HandlerInterceptor{

    @Autowired
    IUserService userService;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {

        System.out.println("=====preHandle======");
        Cookie[] cookies=request.getCookies();
        String username=null;
        String password=null;
        HttpSession session=request.getSession();
        if(session.getAttribute("user")!=null){
            return true;
        }
        if(cookies!=null&&cookies.length>0){
            for(Cookie c:cookies){
                //c->name value
                if(c.getName().equals("username")){
                    username=c.getValue();
                }
                if(c.getName().equals("password")){
                    password=c.getValue();
                }
            }
        }
        if(username!=null&&password!=null){
            //根据用户名和密码自动登录
            UserInfo userInfo=new UserInfo();
            userInfo.setUsername(username);
            userInfo.setPassword(password);
            UserInfo userInfo1= userService.login(userInfo);
            if(userInfo1!=null){
                //登录成功
                session.setAttribute(Const.CURRENT_USER,userInfo);
                return true;
            }
        }
        else{

            try {
                response.sendRedirect("/user/login");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) {
        System.out.println("=====postHandle======");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

        System.out.println("=====afterCompletion======");
    }

}
