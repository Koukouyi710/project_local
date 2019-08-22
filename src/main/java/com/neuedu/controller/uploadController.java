package com.neuedu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class uploadController {

    @RequestMapping(value = "/upload")
    public String upload(@RequestParam("picfile")MultipartFile uploadFile){
        if(uploadFile!=null){

            String uuid = UUID.randomUUID().toString();
            //获取扩展名
            String fileName = uploadFile.getOriginalFilename();
            System.out.println("===filename="+fileName+"===");
            String extraName = fileName.substring(fileName.lastIndexOf("."));

            String newFileName = uuid+extraName;
            System.out.println("===新名="+newFileName+"===");

            File file = new File("D:\\upload");
            if(!file.exists()){
                file.mkdir();
            }
            File newFile = new File(file,newFileName);

            try {
                uploadFile.transferTo(newFile);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        return "product/index";
    }
}
