package com.neuedu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.neuedu.consts.Const;
import com.neuedu.consts.ServerResponse;
import com.neuedu.dao.*;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Order;
import com.neuedu.pojo.OrderItem;
import com.neuedu.pojo.Page;
import com.neuedu.service.IOrderService;
import com.neuedu.service.IUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class OrderServiceImpl implements IOrderService{

    @Autowired
    ProductMapper productMapper;

    @Autowired
    OrderMapper orderMapper;

    @Autowired
    OrderItemMapper orderItemMapper;

    @Autowired
    ShippingMapper shippingMapper;

    @Autowired
    IUploadService uploadService;

    @Override
    public int selectCount() {
        return orderMapper.selectCount();
    }

    @Override
    public Page<Order> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        Page<Order> pageBean = new Page<Order>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int pageSize=15;
        pageBean.setSize(pageSize);

        //封装总记录数
        int totalCount = orderMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPages(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getSize());
        //封装每页显示的数据
        List<Order> lists = orderMapper.findByPage(map);
        pageBean.setList(lists);

        return pageBean;
    }

    @Override
    public List<Order> findAll() throws MyException {
        return orderMapper.selectAll();
    }

    @Override
    public ServerResponse list(Integer userId, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<Order> orderList = Lists.newArrayList();
        if (userId==null){//管理员
            orderList = orderMapper.selectAll();
        }else{
            orderList = orderMapper.findOrderListByUserId(userId);

        }
        if (orderList==null||orderList.size()==0){
            return ServerResponse.createServerResponseByFail("未查询到订单信息！");
        }
        //返回结果
        PageInfo pageInfo = new PageInfo(orderList);
        return ServerResponse.createServerResponseBySucess(pageInfo);
    }

    @Override
    public int cancel(Integer userId, Long orderNo) {
        Order order = orderMapper.findOrderListByUserIdAndOrderNO(userId,orderNo);
        if (order==null){
            throw new MyException("未查询到订单信息！","/user/product/findorder");
        }
        order.setStatus(Const.OrderStatusEunm.ORDER_CANCELED.getCode());
        return orderMapper.updateClose(order);
    }

    @Override
    public int send_goods(Integer userId, Long orderNo) {
        Order order = orderMapper.findOrderListByUserIdAndOrderNO(userId,orderNo);
        if (order==null){
            throw new MyException("未查询到订单信息！","/user/product/findorder");
        }
        order.setStatus(Const.OrderStatusEunm.ORDER_SEND.getCode());
        return orderMapper.updateSend(order);
    }
}
