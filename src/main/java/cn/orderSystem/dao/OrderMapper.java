package cn.orderSystem.dao;

import java.util.List;

import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Order;

public interface OrderMapper {

	List<Order> searchOrder(Order order);
}