package com.neuedu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/order/")
public class OrderController {

    @RequestMapping("findorder")
    public  String  findorder(){

        return "order/list";
    }
}
