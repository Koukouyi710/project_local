package com.neuedu.service;

import com.neuedu.consts.ServerResponse;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Order;
import com.neuedu.pojo.Page;
import com.neuedu.vo.OrderVO;

import java.util.List;
import java.util.Map;

public interface IOrderService {

    /**
     *分页
     */
    int selectCount();
    Page<Order> findByPage(int currentPage);

    /**
     * 查询
     * */
    public List<Order> findAll() throws MyException;

    /**
     *订单列表
     */
    public ServerResponse list(Integer userId,Integer pageNum,Integer pageSize);



    /**
     *取消订单
     */
    public int cancel(Integer userId,Long orderNo);


    /**
     *订单发货
     */
    public int send_goods(Integer userId,Long orderNo);


    /**
     *订单详情
     */
    public OrderVO detail(Integer userId, Long orderNo);
}
