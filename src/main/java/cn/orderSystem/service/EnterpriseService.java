package cn.orderSystem.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.orderSystem.model.Enterprise;

public interface EnterpriseService {

	public PageInfo<Enterprise> searchEnterprise(int pageNo, int pageSize,Enterprise enterprise);

	List<Enterprise> getEnterpriseList(Enterprise enterprise);

	public PageInfo<Enterprise> searchEnterpriseStatus(int pageNo, int pageSize, Enterprise enterprise);

	public void addEnterprise(Enterprise enterprise);

	public void delete(Enterprise enterprise);

	public void updateEnterprise(Enterprise enterprise);
	
	public String getProvinceCode (String name); 
	public String getCityCode (String name); 
}
