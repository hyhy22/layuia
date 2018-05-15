package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.User;
import com.jk.service.HyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value ="user")
public class HyController {
    @Autowired
    private HyService hyser;
    //查询
    @RequestMapping(value = "queryUser")
    @ResponseBody
    public String queryUser(){
        List<User> list = hyser.queryUser();
        JSONObject obj=new JSONObject();
        //前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count",1000);
        obj.put("data",list);



        return obj.toString();
    }
    //新增
    @RequestMapping(value = "addUser")
    @ResponseBody
    public void addUser(User user){
        hyser.addUser(user);
    }
    //删除

    @RequestMapping(value = "deleteUser")
    @ResponseBody
    public void deleteUser(Integer userid){
        hyser.deleteUser(userid);
    }
    //回显
    @RequestMapping(value = "queryhui")
    @ResponseBody
    public User queryhui(Integer userid){
       return hyser.queryhui(userid);
    }

    //修改
    @RequestMapping(value = "updateUser")
    @ResponseBody
    public void updateUser(User user){
        hyser.updateUser(user);
    }


}
