package com.neuedu.service.impl;

import com.neuedu.dao.UserInfoMapper;
import com.neuedu.exception.MyException;
import com.neuedu.pojo.UserInfo;
import com.neuedu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    UserInfoMapper userInfoMapper;

    @Override
    public UserInfo login(UserInfo userInfo) throws MyException {

        //step1:参数的非空校验

        if(userInfo==null){
            throw  new MyException("参数不能为空");
        }
        if(userInfo.getUsername()==null||userInfo.getUsername().equals("")){
            throw  new MyException("用户名不能为空");
        }
        if(userInfo.getPassword()==null||userInfo.getPassword().equals("")){
            throw  new MyException("密码不能为空");
        }
        //step2:判断用户名是否存在

       int username_result= userInfoMapper.exsitsUsername(userInfo.getUsername());

        if(username_result==0){//用户名不存在

            throw  new MyException("用户名不存在");
        }

        //step3: 根据用户名和密码登录
        UserInfo userinfo_result=    userInfoMapper.findByUsernameAndPassword(userInfo);
        if(userinfo_result==null){
            throw  new MyException("密码错误");
        }
        //step4: 判断权限

        if(userinfo_result.getRole()!=0){//不是管理员
            throw  new MyException("没有权限访问");
        }


        return userinfo_result;
    }

    @Override
    public List<UserInfo> findAll() throws MyException {
        return userInfoMapper.selectAll();
    }

    @Override
    public int addUser(UserInfo userInfo) throws MyException {
        if(userInfo==null){
            throw  new MyException("参数不能为空");
        }
        if(userInfo.getUsername()==null||userInfo.getUsername().equals("")){
            throw  new MyException("用户名不能为空");
        }
        int username_result= userInfoMapper.exsitsUsername(userInfo.getUsername());

        if(username_result!=0){//用户名存在

            throw  new MyException("用户名已存在");
        }
        if(userInfo.getPassword()==null||userInfo.getPassword().equals("")){
            throw  new MyException("密码不能为空");
        }
        if(userInfo.getEmail()==null||userInfo.getEmail().equals("")){
            throw  new MyException("email不能为空");
        }
        if(userInfo.getPhone()==null||userInfo.getPhone().equals("")){
            throw  new MyException("phone不能为空");
        }
        if(userInfo.getQuestion()==null||userInfo.getQuestion().equals("")){
            throw  new MyException("密保问题不能为空");
        }
        if(userInfo.getAnswer()==null||userInfo.getAnswer().equals("")){
            throw  new MyException("密保问题答案不能为空");
        }
        return userInfoMapper.insert(userInfo);
    }

    @Override
    public int deleteUser(int userId) throws MyException {
        return userInfoMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public int updateUser(UserInfo userInfo) throws MyException {
        return userInfoMapper.updateByPrimaryKey(userInfo);
    }

    @Override
    public UserInfo findUserById(int userId) {
        return userInfoMapper.selectByPrimaryKey(userId);
    }
}
