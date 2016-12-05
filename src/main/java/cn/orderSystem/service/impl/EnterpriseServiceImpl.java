package cn.orderSystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.orderSystem.dao.AdminMapper;
import cn.orderSystem.dao.CityMapper;
import cn.orderSystem.dao.EnterpriseMapper;
import cn.orderSystem.dao.OrderMapper;
import cn.orderSystem.dao.ProvinceMapper;
import cn.orderSystem.dao.UserMapper;
import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Enterprise;
import cn.orderSystem.model.Order;
import cn.orderSystem.model.User;
import cn.orderSystem.service.AdminService;
import cn.orderSystem.service.EnterpriseService;
import cn.orderSystem.service.OrderService;
import cn.orderSystem.service.UserService;


@Service
public class EnterpriseServiceImpl implements EnterpriseService{

	@Autowired
	private EnterpriseMapper enterpriseDAO;
	@Autowired
	private CityMapper cityDAO;
	@Autowired
	private ProvinceMapper provinceDAO;

	public List<Enterprise> getEnterpriseList(Enterprise enterprise) {
		Map<String, Object> params = new HashMap<>();
		return enterpriseDAO.searchEnterprise(enterprise);
	}
	
	
	public PageInfo<Enterprise> searchEnterprise(int pageNo, int pageSize,Enterprise enterprise) {
		PageHelper.startPage(pageNo, pageSize);
		List<Enterprise> list = getEnterpriseList(enterprise);
		return new PageInfo<Enterprise>(list);
	}


	@Override
	public PageInfo<Enterprise> searchEnterpriseStatus(int pageNo, int pageSize, Enterprise enterprise) {
		PageHelper.startPage(pageNo, pageSize);
		List<Enterprise> list = getEnterpriseList(enterprise);
		return new PageInfo<Enterprise>(list);
	}


	@Override
	public void addEnterprise(Enterprise enterprise) {
		enterpriseDAO.addEnterprise(enterprise);
		
	}


	@Override
	public void delete(Enterprise enterprise) {
		
		 enterpriseDAO.delete(enterprise);
		
	}


	@Override
	public void updateEnterprise(Enterprise enterprise) {
		
		enterpriseDAO.updateEnterprise(enterprise);
	}


	@Override
	public String getProvinceCode(String name) {
		
		return provinceDAO.getProvinceCode(name);
	}


	@Override
	public String getCityCode(String name) {
		
		return cityDAO.getCityCode(name);
	}
	

}
