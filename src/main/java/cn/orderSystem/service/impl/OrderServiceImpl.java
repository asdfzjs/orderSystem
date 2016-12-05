package cn.orderSystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.orderSystem.dao.AdminMapper;
import cn.orderSystem.dao.OrderMapper;
import cn.orderSystem.dao.UserMapper;
import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Order;
import cn.orderSystem.model.User;
import cn.orderSystem.service.AdminService;
import cn.orderSystem.service.OrderService;
import cn.orderSystem.service.UserService;


@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderMapper orderDAO;

	public List<Order> getOrderList(Order order) {
		Map<String, Object> params = new HashMap<>();
		return orderDAO.searchOrder(order);
	}
	
	
	public PageInfo<Order> searchOrder(int pageNo, int pageSize,Order order) {
		PageHelper.startPage(pageNo, pageSize);
		List<Order> list = getOrderList(order);
		return new PageInfo<Order>(list);
	}


	@Override
	public PageInfo<Order> searchOrderStatus(int pageNo, int pageSize, Order order) {
		PageHelper.startPage(pageNo, pageSize);
		List<Order> list = getOrderList(order);
		return new PageInfo<Order>(list);
	}
	

}
