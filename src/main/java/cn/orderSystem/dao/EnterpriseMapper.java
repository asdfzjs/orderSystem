package cn.orderSystem.dao;

import java.util.List;

import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Enterprise;
import cn.orderSystem.model.Order;

public interface EnterpriseMapper {

	List<Enterprise> searchEnterprise(Enterprise enterprise);

	void addEnterprise(Enterprise enterprise);

	void delete(Enterprise enterprise);

	void updateEnterprise(Enterprise enterprise);
}