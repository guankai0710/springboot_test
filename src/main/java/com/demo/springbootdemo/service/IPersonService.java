package com.demo.springbootdemo.service;

import com.demo.springbootdemo.entity.Person;
import com.demo.springbootdemo.entity.PersonCriteria;

import java.util.List;

/**
 * 用户操作接口
 *
 * @Author: guan.kai
 * @CreateTime: 2019/8/14 22:17
 * @Version: 0.0.1
 **/
public interface IPersonService {

    /**
     * 根据用户id获取用户数据
     *
     * @Author: guan.kai
     * @CreateTime: 2019/8/28 14:36
     * @Param: [id]
     * @Return: com.demo.springbootdemo.entity.Person
     **/
    Person getById(String id);

    /**
     * 根据条件查询用户数据
     *
     * @Author: guan.kai
     * @CreateTime: 2019/8/28 14:37
     * @Param: [criteria]
     * @Return: java.util.List<com.demo.springbootdemo.entity.Person>
     **/
    List<Person> selectByExample(PersonCriteria criteria);

}
