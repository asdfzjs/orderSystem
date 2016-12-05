package cn.orderSystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.orderSystem.dao.AccountMapper;
import cn.orderSystem.dao.AdminMapper;
import cn.orderSystem.dao.EnterpriseMapper;
import cn.orderSystem.dao.OrderMapper;
import cn.orderSystem.dao.UserMapper;
import cn.orderSystem.model.Account;
import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Enterprise;
import cn.orderSystem.model.Order;
import cn.orderSystem.model.User;
import cn.orderSystem.service.AccountService;
import cn.orderSystem.service.AdminService;
import cn.orderSystem.service.EnterpriseService;
import cn.orderSystem.service.OrderService;
import cn.orderSystem.service.UserService;


@Service
public class AccountServiceImpl implements AccountService{

	@Autowired
	private AccountMapper accountDAO;

	@Override
	public void addAccount(Account account) {
		accountDAO.addAccount(account);
	}

	@Override
	public void delete(Account account) {
		
		accountDAO.delete(account);
		
	}

	@Override
	public void updateAccount(Account account) {
		
		accountDAO.updateAccount(account);
	}
	

}
