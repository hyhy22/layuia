package com.jk.dao;

import com.jk.model.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HyDao {

    List<User> queryUser();

    void addUser(User user);

    void deleteUser(Integer userid);

    User queryhui(Integer userid);

    void updateUser(User user);

}
