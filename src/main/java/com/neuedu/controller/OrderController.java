package com.neuedu.controller;

import com.github.pagehelper.PageHelper;
import com.neuedu.consts.Const;
import com.neuedu.consts.ServerResponse;
import com.neuedu.dao.OrderMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Order;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/user/order/")
public class OrderController {

    @Autowired
    IOrderService orderService;

    @Autowired
    OrderMapper orderMapper;


    @RequestMapping("findorder")
    public  String  findorder(HttpSession session,@RequestParam(value = "currentPage", defaultValue = "1") int currentPage){

        List<Order> orderList = orderService.findAll();

        session.setAttribute("orderList", orderService.findByPage(currentPage));

        return "order/list";
    }

    @RequestMapping("cancel/{id}")
    public  String  cancel(@PathVariable("id") Integer id, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");
        Order order = orderMapper.selectByPrimaryKey(id);
        if (order==null){
            throw new MyException("error!","findorder");
        }
        int count = orderService.cancel(null,order.getOrderNo());

        if (count > 0) {
            return "redirect:/user/order/findorder";
        }
        return "order/findorder";
    }

    @RequestMapping("send/{id}")
    public  String  send(@PathVariable("id") Integer id, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");
        Order order = orderMapper.selectByPrimaryKey(id);
        if (order==null){
            throw new MyException("error!","findorder");
        }
        int count = orderService.send_goods(null,order.getOrderNo());

        if (count > 0) {
            return "redirect:/user/order/findorder";
        }
        return "order/findorder";
    }

    /**
     *订单列表
     */
    @ResponseBody
    @RequestMapping(value = "list")
    public ServerResponse list(
                               @RequestParam(name = "pageNum",required = false,defaultValue = "1")Integer pageNum,
                               @RequestParam(name = "pageSize",required = false,defaultValue = "10")Integer pageSize
    ){
        return orderService.list(null,pageNum,pageSize);
    }
}
