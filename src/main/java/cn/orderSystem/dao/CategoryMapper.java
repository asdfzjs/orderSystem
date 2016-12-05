package cn.orderSystem.dao;

import java.util.List;

import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Category;
import cn.orderSystem.model.Enterprise;
import cn.orderSystem.model.Order;

public interface CategoryMapper {

	List<Category> getCategoryList();
}