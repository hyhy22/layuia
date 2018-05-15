package com.jk.service;

import com.jk.dao.HyDao;
import com.jk.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HyService {
    @Autowired
    private HyDao hyd;

    public List<User> queryUser(){

        List<User> list = hyd.queryUser();
        return list;
    }


    public void addUser(User user) {

        hyd.addUser(user);

    }

    public void deleteUser(Integer userid) {
        hyd.deleteUser(userid);
    }

    public User queryhui(Integer userid) {
        return hyd.queryhui(userid);
    }

    public void updateUser(User user) {
        hyd.updateUser(user);

    }
}
