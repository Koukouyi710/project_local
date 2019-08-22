package com.neuedu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {


    @RequestMapping("/test")
    public  String  login(){

        return "test";
    }

}
