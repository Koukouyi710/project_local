package com.neuedu.controller;

import com.neuedu.pojo.Category;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;


@Controller
@RequestMapping("/user/category/")
public class CategoryController {

    @Autowired
    ICategoryService categoryService;

    @RequestMapping("find")
    public  String  findAll(HttpSession session){

        List<Category> categoryList=categoryService.findAll();

        session.setAttribute("categorylist",categoryList);

        return "category/list";
        //return "categorylist";
    }


    @RequestMapping(value = "update/{id}",method = RequestMethod.GET)
    public  String  update(HttpSession session,@PathVariable("id") Integer categoryId, HttpServletRequest request){

        List<Category> categoryList=categoryService.findAll();

        session.setAttribute("categorylist",categoryList);

        Category category=categoryService.findCategoryById(categoryId);

        request.setAttribute("category",category);

        return "category/index";
        //return "categoryupdate";
    }

    @RequestMapping(value = "update/{id}",method = RequestMethod.POST)
    public  String  update(Category category, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");

       //
       int count= categoryService.updateCategory(category);

       if(count>0){
           //修改成功
           return "redirect:/user/category/find";
       }

        return "category/index";
        //return "categoryupdate";
    }

    //删除类别
    @RequestMapping(value = "delete/{id}",method = RequestMethod.GET)
    public  String  delete(@PathVariable("id") Integer categoryId, HttpServletRequest request){


        int category_result = categoryService.deleteCategory(categoryId);

        return "redirect:/user/category/find";
    }

    //添加类别
    @RequestMapping(value = "categoryadd",method = RequestMethod.GET)
    public String addCategory(HttpSession session){

        List<Category> categoryList=categoryService.findAll();

        session.setAttribute("categorylist",categoryList);

        return "category/index";
        //return "categoryadd";
    }

    @RequestMapping(value = "categoryadd",method = RequestMethod.POST)
    public  String  addCategory(Category category, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");
        int count= categoryService.addCategory(category);

        if(count>0){
            //添加成功
            return "redirect:/user/category/find";
        }
        return "category/index";
        //return "categoryadd";
    }
}
