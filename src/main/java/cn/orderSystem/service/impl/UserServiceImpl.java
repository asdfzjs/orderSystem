package cn.orderSystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.orderSystem.dao.UserMapper;
import cn.orderSystem.model.User;
import cn.orderSystem.service.UserService;


@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userDAO;
	
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.insert(user);
	}

}
