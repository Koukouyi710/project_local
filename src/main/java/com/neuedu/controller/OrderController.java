package com.neuedu.controller;

import com.github.pagehelper.PageHelper;
import com.neuedu.consts.Const;
import com.neuedu.consts.ServerResponse;
import com.neuedu.dao.OrderMapper;
import com.neuedu.dao.ShippingMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Order;
import com.neuedu.pojo.Shipping;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IOrderService;
import com.neuedu.service.IUserService;
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
    IUserService userService;

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    ShippingMapper shippingMapper;


    /**
     *订单列表
     */
    @RequestMapping(value = "findorder",method = RequestMethod.GET)
    public  String  findorder(HttpSession session,@RequestParam(value = "currentPage", defaultValue = "1") int currentPage){

        List<UserInfo> userlist=userService.findAll();

        session.setAttribute("userlist",userlist);

        List<Order> orderList = orderService.findAll();

        session.setAttribute("orderList", orderService.findByPage(currentPage));

        return "order/list";
    }

    /**
     *取消订单
     */
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

    /**
     *订单发货
     */
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
     *地址详情
     */
    @ResponseBody
    @RequestMapping("shippingdetail/{shippingId}")
    public  ServerResponse  shippingdetail(@PathVariable("shippingId") Integer shippingId, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");
        Shipping shipping = shippingMapper.selectByPrimaryKey(shippingId);
        if (shipping==null){
            throw new MyException("无地址详细信息!","order/findorder");
        }
        return ServerResponse.createServerResponseBySucess(shipping);
        //return "redirect:/user/order/findorder";
    }

    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public  String  totest(){

        return "order/detail";
    }
    @RequestMapping(value = "/test",method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse test(){
        Order order = orderMapper.selectByPrimaryKey(4);
        return orderService.detail(null,order.getOrderNo());
    }

    @ResponseBody
    @RequestMapping(value = "detail/{id}")
    public ServerResponse detail(@PathVariable("id") Integer id){
        Order order = orderMapper.selectByPrimaryKey(id);
        return orderService.detail(null,order.getOrderNo());
    }
}
