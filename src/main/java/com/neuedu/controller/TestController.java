package com.neuedu.controller;

import com.neuedu.consts.ServerResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {


    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public  String  totest(){

        return "test";
    }
    @RequestMapping(value = "/test",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse test(){

        return ServerResponse.createServerResponseBySucess("成功！");
    }

}
