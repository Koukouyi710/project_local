package com.neuedu.service;

import com.neuedu.consts.ServerResponse;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Page;
import com.neuedu.pojo.Product;


import java.util.List;

public interface IProductService {

    /**
     * 添加商品
     * */
    public int addProduct(Product product) throws MyException;
    /**
     * 删除商品
     * */
    public int deleteProduct(int productId) throws MyException;
    /**
     * 修改商品
     * */
    public int updateProduct(Product product) throws MyException;
    /**
     * 查询商品
     * */
    public List<Product> findAll() throws MyException;


    /**
     * 根据id查询信息
     * */

    public Product findProductById(int productId);

    /**
     *商品列表
     */
    public ServerResponse search(Integer categoryId, String keyword, Integer pageNum, Integer pageSize, String orderBy);


    //上架商品数量
    int selectCountup();

    //未上架商品数量
    int selectCountdown();

    //分页
    Page<Product> findByPageup(int currentPage);

    //分页
    Page<Product> findByPagedown(int currentPage);
}
