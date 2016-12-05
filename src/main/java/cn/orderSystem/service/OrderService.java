package cn.orderSystem.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.orderSystem.model.Order;


public interface OrderService {

	public PageInfo<Order> searchOrder(int pageNo, int pageSize,Order order);

	List<Order> getOrderList(Order order);

	public PageInfo<Order> searchOrderStatus(int pageNo, int pageSize, Order order);
}
