package com.neuedu.controller;

import com.neuedu.consts.ServerResponse;
import com.neuedu.pojo.Category;
import com.neuedu.pojo.Product;
import com.neuedu.service.ICategoryService;
import com.neuedu.service.IProductService;
import com.neuedu.vo.ProductListVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

import static com.neuedu.consts.Const.CURRENT_ADDR;

@Controller
@RequestMapping("/user/product/")
public class ProductController {
    @Autowired
    IProductService productService;

    @Autowired
    ICategoryService categoryService;

    @RequestMapping("findproduct")
    public String findAll(@RequestParam(value = "currentPageup", defaultValue = "1") int upcurrentPage, @RequestParam(value = "currentPagedown", defaultValue = "1") int currentPage, HttpSession session) {

        List<Product> productList = productService.findAll();

        session.setAttribute("productlist", productList);

        List<Category> categoryList = categoryService.findAll();

        session.setAttribute("categorylist", categoryList);

        session.setAttribute("uplist", productService.findByPageup(upcurrentPage));

        session.setAttribute("downlist", productService.findByPagedown(currentPage));

        return "product/list";
        //return "productlist";
    }


    @RequestMapping(value = "productupdate/{id}", method = RequestMethod.GET)
    public String update(HttpSession session, @PathVariable("id") Integer productId, HttpServletRequest request) {

        List<Product> productList = productService.findAll();

        session.setAttribute("productlist", productList);

        List<Category> categoryList = categoryService.findAll();

        session.setAttribute("categorylist", categoryList);

        Product product = productService.findProductById(productId);

        request.setAttribute("product", product);

        return "product/index";
        //return "productupdate";
    }

    @RequestMapping(value = "productupdate/{id}", method = RequestMethod.POST)
    public String update(@RequestParam("picfile") MultipartFile[] uploadFilelist, Product product, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");
        if (uploadFilelist != null || !uploadFilelist.equals("")) {

            for (MultipartFile uploadFile : uploadFilelist) {
                String uuid = UUID.randomUUID().toString();
                //获取扩展名
                String fileName = uploadFile.getOriginalFilename();
                System.out.println("===filename=" + fileName + "===");
                String extraName = fileName.substring(fileName.lastIndexOf("."));

                String newFileName = uuid + extraName;
                System.out.println("===新名=" + newFileName + "===");

                if (product.getMainImage() == null || product.getMainImage().equals("")) {
                    product.setMainImage(CURRENT_ADDR + newFileName);
                    product.setSubImages(CURRENT_ADDR + newFileName);
                } else {
                    product.setSubImages(product.getSubImages() + ";" + CURRENT_ADDR + newFileName);
                }
                File file = new File("D:\\upload");
                if (!file.exists()) {
                    file.mkdir();
                }
                File newFile = new File(file, newFileName);

                try {
                    uploadFile.transferTo(newFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
        //
        int count = productService.updateProduct(product);

        if (count > 0) {
            //修改成功
            return "redirect:/user/product/findproduct";
        }

        return "product/index";
        //return "productupdate";
    }

    //删除类别
    @RequestMapping(value = "productdelete/{id}", method = RequestMethod.GET)
    public String delete(@PathVariable("id") Integer productId, HttpServletRequest request) {


        int product_result = productService.deleteProduct(productId);

        return "redirect:/user/product/findproduct";
    }

    //添加类别
    @RequestMapping(value = "productadd", method = RequestMethod.GET)
    public String addProduct(HttpSession session) {

        List<Product> productList = productService.findAll();

        session.setAttribute("productlist", productList);

        List<Category> categoryList = categoryService.findAll();

        session.setAttribute("categorylist", categoryList);

        return "product/index";
        //return "productadd";
    }

    @RequestMapping(value = "productadd", method = RequestMethod.POST)
    public String addProduct(@RequestParam("picfile") MultipartFile[] uploadFileList, Product product, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");

        if (uploadFileList != null || !uploadFileList.equals("")) {

            for (MultipartFile uploadFile : uploadFileList) {
                String uuid = UUID.randomUUID().toString();
                //获取扩展名
                String fileName = uploadFile.getOriginalFilename();
                System.out.println("===filename=" + fileName + "===");
                String extraName = fileName.substring(fileName.lastIndexOf("."));

                String newFileName = uuid + extraName;
                System.out.println("===新名=" + newFileName + "===");

                System.out.println(product.getMainImage());
                if (product.getMainImage() == null || product.getMainImage().equals("")) {
                    product.setMainImage(CURRENT_ADDR + newFileName);
                    product.setSubImages(CURRENT_ADDR + newFileName);
                } else {
                    product.setSubImages(product.getSubImages() + ";" + CURRENT_ADDR + newFileName);
                }
                File file = new File("D:\\upload");
                if (!file.exists()) {
                    file.mkdir();
                }
                File newFile = new File(file, newFileName);

                try {
                    uploadFile.transferTo(newFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }

        int count = productService.addProduct(product);

        if (count > 0) {
            //添加成功
            return "redirect:/user/product/findproduct";
        }
        return "product/index";
        //return "productadd";
    }


    @RequestMapping(value = "productup/{id}")
    public String upProduct(Product product, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");

        product.setStatus(1);

        int count = productService.updateProduct(product);

        if (count > 0) {
            //添加成功
            return "redirect:/user/product/findproduct";
        }
        return "product/list";
        //return "productadd";
    }

    @RequestMapping(value = "productdown/{id}")
    public String downProduct(Product product, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("GBK");

        product.setStatus(2);

        int count = productService.updateProduct(product);

        if (count > 0) {
            //添加成功
            return "redirect:/user/product/findproduct";
        }
        return "product/findproduct";
        //return "productadd";
    }

    /**
     * 搜索商品
     */
  /*  @RequestMapping(value = "search")
    public String search(HttpSession session,
                               @RequestParam(name = "categoryId",required = false) Integer categoryId,
                               @RequestParam(name = "keyword",required = false) String keyword,
                               @RequestParam(name = "pageNum",required = false,defaultValue = "1")Integer pageNum,
                               @RequestParam(name = "pageSize",required = false,defaultValue = "10")Integer pageSize,
                               @RequestParam(name ="orderBy",required = false,defaultValue = "")String orderBy){
        List<Product> productList = productService.search(categoryId,keyword,pageNum,pageSize,orderBy);
        session.setAttribute("productList",productList);
        return "product/search";
    }*/
    /**
     * 搜索商品
     */
    @RequestMapping(value = "search")
    public String search(HttpSession session,
                         @RequestParam(name = "categoryId",required = false) Integer categoryId,
                         @RequestParam(name = "keyword",required = false) String keyword,
                         @RequestParam(value = "currentPage", defaultValue = "1") int currentPage){


        /*if (currentPage!=1){
            if (categoryId!=null){
                session.setAttribute("categoryId", categoryId);
            }
            if (keyword!=null&&!keyword.equals("")){
                session.setAttribute("keyword", keyword);
            }
        }else {
            session.setAttribute("categoryId", categoryId);
            session.setAttribute("keyword", keyword);
        }*/
        session.setAttribute("categoryId", categoryId);
        session.setAttribute("keyword", keyword);
        List<Category> categoryList = categoryService.findAll();
        session.setAttribute("categorylist", categoryList);

        categoryId = (Integer) session.getAttribute("categoryId");
        keyword = (String) session.getAttribute("keyword");
        session.setAttribute("SproductList", productService.findByPage(currentPage,categoryId,keyword));

        return "product/search";
    }
    @RequestMapping(value = "productdetail/{id}")
    public String productdetail(HttpSession session, @PathVariable("id") Integer productId, HttpServletRequest request) throws UnsupportedEncodingException {

        Product product = productService.findProductById(productId);

        if (product!=null) {
            session.setAttribute("product",product);
        }
        return "product/detail";
        //return "productadd";
    }

}
