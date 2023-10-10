package com.eams.dao;

import java.util.List;

import com.eams.model.User;

/**
 * userDao
 * @author MyBugBean
 *
 */
public interface UserDao {

public User login( User param);

public List<User> loginList(User param);

public int insertUser(User param);

public int delUser (User param);

public int updateUser (User param);

public Integer selectcountUser();
}
