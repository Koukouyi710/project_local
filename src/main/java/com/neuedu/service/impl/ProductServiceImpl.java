package com.neuedu.service.impl;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import com.neuedu.consts.ServerResponse;
import com.neuedu.dao.CategoryMapper;
import com.neuedu.dao.ProductMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Page;
import com.neuedu.pojo.Product;
import com.neuedu.service.ICategoryService;
import com.neuedu.service.IProductService;
import com.neuedu.vo.ProductListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

@Service
public class ProductServiceImpl implements IProductService{

    @Autowired
    ProductMapper productMapper;

    @Autowired
    CategoryMapper categoryMapper;

    @Autowired
    ICategoryService categoryService;

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
    public ServerResponse search(Integer categoryId, String keyword, Integer pageNum, Integer pageSize, String orderBy) {
        //step1:参数校验 categoryid与keyword不能同时为空
        if (categoryId==null&&(keyword==null||keyword.equals(""))){
            return ServerResponse.createServerResponseByFail("参数错误！");
        }
        //step2:categoryId
        Set<Integer> integerSet = Sets.newHashSet();
        if (categoryId!=null){
            Category category = categoryMapper.selectByPrimaryKey(categoryId);
            if (category==null&&(keyword==null||keyword.equals(""))){
                //没有商品数据
                PageHelper.startPage(pageNum,pageSize);
                List<ProductListVO> productListVOList = Lists.newArrayList();
                PageInfo pageInfo = new PageInfo(productListVOList);
                return ServerResponse.createServerResponseBySucess(pageInfo);
            }
            ServerResponse serverResponse = categoryService.get_deep_category(categoryId);
            if (serverResponse.isSucess()){
                integerSet = (Set<Integer>)serverResponse.getData();
            }
        }
        if (keyword!=null&&!keyword.equals("")){
            keyword="%"+keyword+"%";
        }
        if (orderBy.equals("")){
            PageHelper.startPage(pageNum,pageSize);
        }else{
            String[] orderByArr = orderBy.split("_");
            if (orderByArr.length>1){
                PageHelper.startPage(pageNum,pageSize,orderByArr[0]+" "+orderByArr[1]);
            }else{
                PageHelper.startPage(pageNum,pageSize);
            }
        }
        List<Product> productList = productMapper.searchProduct(integerSet,keyword);
        PageInfo pageInfo = new PageInfo(productList);
        List<ProductListVO> productListVOList = Lists.newArrayList();
        if (productList!=null&&productList.size()>0){
            for (Product product:productList){
                ProductListVO productListVO = assembleProductListVO(product);
                productListVOList.add(productListVO);
            }
        }
        pageInfo.setList(productListVOList);
        return ServerResponse.createServerResponseBySucess(pageInfo);
    }

    private ProductListVO assembleProductListVO(Product product){
        ProductListVO productListVO = new ProductListVO();
        productListVO.setId(product.getId());
        productListVO.setCategoryId(product.getCategoryId());
        productListVO.setName(product.getName());
        productListVO.setSubtitle(product.getSubtitle());
        productListVO.setMainImage(product.getMainImage());
        productListVO.setStatus(product.getStatus());
        productListVO.setPrice(product.getPrice());
        return productListVO;
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
        int pageSize=10;
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
        int pageSize=10;
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
