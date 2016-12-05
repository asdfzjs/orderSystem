package cn.orderSystem.dao;

import cn.orderSystem.model.Admin;

public interface AdminMapper {

	int updateByPrimaryKey(Admin admin);
	
	Admin selectByPrimaryKey(String id);

	Admin login(Admin admin);

	 void updatePwd(Admin admin);
}