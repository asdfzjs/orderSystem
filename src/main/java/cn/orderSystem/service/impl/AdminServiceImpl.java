package cn.orderSystem.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.orderSystem.dao.AdminMapper;
import cn.orderSystem.dao.UserMapper;
import cn.orderSystem.model.Admin;
import cn.orderSystem.model.User;
import cn.orderSystem.service.AdminService;
import cn.orderSystem.service.UserService;


@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminMapper adminDAO;
	
	public Admin login(Admin admin) {
		return adminDAO.login(admin);
	}

	public int insertUser(User user) {
		return 0;
	}

	@Override
	public void updatePwd(Admin admin) {
		adminDAO.updatePwd(admin);
	}

}
