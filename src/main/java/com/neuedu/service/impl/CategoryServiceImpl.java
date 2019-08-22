package com.neuedu.service.impl;

import com.neuedu.dao.CategoryMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Page;
import com.neuedu.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    CategoryMapper categoryMapper;

    @Override
    public int addCategory(Category category) throws MyException {
        if(category.getName()==null||category.getName().equals("")){
            throw  new MyException("添加失败：类别名称不能为空");
        }
        return categoryMapper.insert(category);
    }

    @Override
    public int deleteCategory(int categoryId) throws MyException {
        return categoryMapper.deleteByPrimaryKey(categoryId);
    }

    @Override
    public int updateCategory(Category category) throws MyException {
        return categoryMapper.updateByPrimaryKey(category);
    }

    @Override
    public List<Category> findAll() throws MyException {

        return categoryMapper.selectAll();


    }

    @Override
    public Category findCategoryById(int categoryId) {

       return  categoryMapper.selectByPrimaryKey(categoryId);

    }

    @Override
    public int selectCount() {
        return categoryMapper.selectCount();
    }

    @Override
    public Page<Category> findByPage(int currentPage) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        Page<Category> pageBean = new Page<Category>();

        //封装当前页数
        pageBean.setCurrentPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setSize(pageSize);

        //封装总记录数
        int totalCount = categoryMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPages(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getSize());
        //封装每页显示的数据
        List<Category> lists = categoryMapper.findByPage(map);
        pageBean.setList(lists);

        return pageBean;
    }
}
