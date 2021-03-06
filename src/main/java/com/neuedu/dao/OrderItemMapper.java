package com.neuedu.dao;

import com.neuedu.pojo.OrderItem;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OrderItemMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table neuedu_order_item
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(@Param("id") Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table neuedu_order_item
     *
     * @mbggenerated
     */
    int insert(@Param("orderItem") OrderItem record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table neuedu_order_item
     *
     * @mbggenerated
     */
    OrderItem selectByPrimaryKey(@Param("id") Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table neuedu_order_item
     *
     * @mbggenerated
     */
    List<OrderItem> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table neuedu_order_item
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(@Param("orderItem") OrderItem record);

    /**
     * 订单明细批量插入
     */
    int insertBatch(@Param("orderItemList") List<OrderItem> orderItemList);

    /**
     * 按照userid和订单号查找
     */
    List<OrderItem>findOrderItemListByUserIdAndOrderNO(@Param("userId") Integer userId, @Param("orderNO") Long orderNO);

    /**
     * 按照订单号模糊查找
     */
    List<OrderItem>findOrderItemListByOrderNO(@Param("orderNO") String orderNO);
}