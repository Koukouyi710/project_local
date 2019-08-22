package com.neuedu.service.impl;


import com.neuedu.dao.ProductMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Page;
import com.neuedu.pojo.Product;
import com.neuedu.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ProductServiceImpl implements IProductService{

    @Autowired
    ProductMapper productMapper;

    @Override
    public int addProduct(Product product) throws MyException {
        if(product.getName()==null||product.getName().equals("")){
            throw  new MyException("添加失败：商品名称不能为空");
        }
        if(product.getPrice()==null||product.getPrice().equals("")){
            throw  new MyException("添加失败：请设置商品价格");
        }
        if(product.getStock()==null||product.getStock().equals("")){
            throw  new MyException("添加失败：请设置商品库存");
        }
        return productMapper.insert(product);
    }

    @Override
    public int deleteProduct(int productId) throws MyException {
        return productMapper.deleteByPrimaryKey(productId);
    }

    @Override
    public int updateProduct(Product product) throws MyException {
        return productMapper.updateByPrimaryKey(product);
    }

    @Override
    public List<Product> findAll() throws MyException {
        return productMapper.selectAll();
    }

    @Override
    public Product findProductById(int productId) {
        return productMapper.selectByPrimaryKey(productId);
    }

    @Override
    public int selectCountup() {
        return productMapper.selectCountup();
    }

    @Override
    public int selectCountdown() {
        return productMapper.selectCountdown();
    }

    @Override
    public Page<Product> findByPageup(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        Page<Product> pageBean = new Page<Product>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int pageSize=2;
        pageBean.setSize(pageSize);

        //封装总记录数
        int totalCount = productMapper.selectCountup();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPages(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getSize());
        //封装每页显示的数据
        List<Product> lists = productMapper.findByPageup(map);
        pageBean.setList(lists);

        return pageBean;

    }

    @Override
    public Page<Product> findByPagedown(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        Page<Product> pageBean = new Page<Product>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int pageSize=1;
        pageBean.setSize(pageSize);

        //封装总记录数
        int totalCount = productMapper.selectCountdown();
        System.out.println("====totalCount="+totalCount);
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPages(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getSize());
        //封装每页显示的数据
        List<Product> lists = productMapper.findByPagedown(map);
        pageBean.setList(lists);

        return pageBean;
    }


}
