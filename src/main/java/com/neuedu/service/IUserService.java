package com.neuedu.service;

import com.neuedu.exception.MyException;
import com.neuedu.pojo.Page;
import com.neuedu.pojo.UserInfo;

import java.util.List;

public interface IUserService {

    public UserInfo login(UserInfo userInfo) throws MyException;

    public List<UserInfo> findAll() throws MyException;


    /**
     * 添加
     * */
    public int addUser(UserInfo userInfo) throws MyException;
    /**
     * 删除
     * */
    public int deleteUser(int userId) throws MyException;
    /**
     * 修改
     * */
    public int updateUser(UserInfo userInfo) throws MyException;
    /**
     * 根据id查询信息
     * */
    public UserInfo findUserById(int userId);

    //用户数量
    int selectCount();

    //分页
    Page<UserInfo> findByPage(int currentPage);

}
