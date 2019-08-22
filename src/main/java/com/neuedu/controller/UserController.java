package com.neuedu.controller;

import com.neuedu.consts.Const;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import com.neuedu.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;


@Controller
@RequestMapping("/user/")
public class UserController {

    @Autowired
    IUserService userService;



    @RequestMapping(value = "login",method = RequestMethod.GET)
    public  String login(){
        return "common/login";
    }

    @RequestMapping(value = "login",method = RequestMethod.POST)
    public  String login(UserInfo userInfo, HttpSession session, HttpServletResponse response){

        String pwd = MD5Utils.getMD5Code(userInfo.getPassword());
        userInfo.setPassword(pwd);
       UserInfo loginUserInfo= userService.login(userInfo);

        System.out.println(loginUserInfo);

        if(loginUserInfo!=null){
            session.setAttribute(Const.CURRENT_USER,loginUserInfo);
            Cookie username_cookie = new Cookie("username",loginUserInfo.getUsername());
            Cookie password_cookie = new Cookie("password",loginUserInfo.getPassword());
            //Cookie password_cookie = new Cookie("password",loginUserInfo.getPassword());

            username_cookie.setMaxAge(60*60*24*7);
            password_cookie.setMaxAge(60*60*24*7);

            response.addCookie(username_cookie);
            response.addCookie(password_cookie);

            return "redirect:home";
        }
        return "common/login";
    }


    @RequestMapping("home")
    public  String  home(){

        return "home/home";
    }

    @RequestMapping("finduser")
    public  String  findAll(HttpSession session){

        List<UserInfo> userlist=userService.findAll();

        session.setAttribute("userlist",userlist);
        return "users/list";
        //return "userlist";
    }

    @RequestMapping(value = "updateuser/{id}",method = RequestMethod.GET)
    public  String  update(HttpSession session,@PathVariable("id") Integer userId, HttpServletRequest request){

        List<UserInfo> userlist=userService.findAll();

        session.setAttribute("userlist",userlist);

        UserInfo user=userService.findUserById(userId);

        request.setAttribute("user",user);

        return "users/index";
        //return "userupdate";
    }

    @RequestMapping(value = "updateuser/{id}",method = RequestMethod.POST)
    public  String  update(UserInfo user, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");

        if (user.getPassword()!=null&&!user.getPassword().equals(""))
        {
            String pwd = MD5Utils.getMD5Code(user.getPassword());
            user.setPassword(pwd);
        }
        //
        int count= userService.updateUser(user);

        if(count>0){
            //修改成功
            return "redirect:/user/finduser";
        }

        return "users/index";
        //return "userupdate";
    }

    //删除用户
    @RequestMapping(value = "deleteuser/{id}",method = RequestMethod.GET)
    public  String  delete(@PathVariable("id") Integer userId, HttpServletRequest request){


        int user_result = userService.deleteUser(userId);

        return "redirect:/user/finduser";
    }

    //添加用户
    @RequestMapping(value = "useradd",method = RequestMethod.GET)
    public String addCategory(HttpSession session){

        List<UserInfo> userlist=userService.findAll();

        session.setAttribute("userlist",userlist);

        return "users/index";
        //return "useradd";
    }

    @RequestMapping(value = "useradd",method = RequestMethod.POST)
    public  String  addUser(UserInfo user, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");

        String pwd = MD5Utils.getMD5Code(user.getPassword());
        user.setPassword(pwd);
        int count= userService.addUser(user);

        if(count>0){
            //添加成功
            return "redirect:/user/finduser";
        }
        return "users/index";
        //return "useradd";
    }

}
