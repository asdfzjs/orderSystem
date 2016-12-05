/**
 * Project Name:orderSystem
 * File Name:OrderController.java
 * Package Name:cn.orderSystem.controller
 * Date:2016年11月10日下午5:37:50
 * Copyright (c) 2016, chenzhou1025@126.com All Rights Reserved.
 *
*/

package cn.orderSystem.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;

import cn.orderSystem.model.Account;
import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Enterprise;
import cn.orderSystem.model.Order;
import cn.orderSystem.service.AccountService;
import cn.orderSystem.service.AdminService;
import cn.orderSystem.service.EnterpriseService;
import cn.orderSystem.service.OrderService;
import cn.orderSystem.service.util.DateUtil;

/**
 * ClassName:OrderController <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2016年11月10日 下午5:37:50 <br/>
 * 
 * @author Administrator
 * @version
 * @since JDK 1.6
 * @see
 */
@Controller
@RequestMapping("/")
public class EnterpriseController {
	@Autowired
	private EnterpriseService enterpriseService;
	@Autowired
	private AccountService accountService;

	@RequestMapping("searchEnterprise")
	public String searchEnterprise(@ModelAttribute Enterprise enterprise, Model model, HttpServletRequest request) {
		//获取地址信息
		if(!StringUtils.isEmpty(enterprise.getProvince()) && enterprise.getProvince().contains("请选择")){
			enterprise.setProvince("");
		}
		if(!StringUtils.isEmpty(enterprise.getCity()) && enterprise.getCity().contains("请选择")){
			enterprise.setCity("");
		}
		PageInfo<Enterprise> pageinfo = new PageInfo<Enterprise>();
		String page = request.getParameter("page");
		int pageNum = 1;
		if (page != null && page.trim().length() != 0) {
			pageNum = Integer.parseInt(page);
		}
		pageinfo = enterpriseService.searchEnterprise(pageNum, 6, enterprise);
		List<Enterprise> enterpriselist = pageinfo.getList();
		model.addAttribute("enterpriselist", enterpriselist);
		model.addAttribute("pageNum", pageinfo.getPageNum());
		model.addAttribute("pages", pageinfo.getPages());
		return "enterpriseSearch";
	}

	@RequestMapping("addProduct")
	public String addProduct(@ModelAttribute Enterprise enterprise, Model model, HttpServletRequest request) throws ParseException {
		Account account = new Account();
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String status = request.getParameter("status");
		if(!StringUtils.isEmpty(province)){
			enterprise.setProvince(province);
		}
		if(!StringUtils.isEmpty(city)){
			enterprise.setCity(city);
		}
		if(!StringUtils.isEmpty(status)){
			enterprise.setStatus(status);
		}
		StringBuffer mem_id = new StringBuffer();
		mem_id.append("e").append(enterprise.getTelephone()).append("1");
		enterprise.setMem_id(mem_id.toString());
		Date a = new Date();
		enterprise.setRegistTime(DateUtil.formatDate(a));
		//设置供应商的地区编码
		enterprise.setProvinceCode(enterpriseService.getProvinceCode(province));
		enterprise.setCityCode(enterpriseService.getCityCode(city));
		account.setRegistTime(DateUtil.formatDate(a));
		account.setMem_id(mem_id.toString());
		account.setStatus(status);
		account.setPhone(enterprise.getTelephone());
		account.setUname(enterprise.getTelephone());
		account.setChannel("02");
		accountService.addAccount(account);
		enterpriseService.addEnterprise(enterprise);
		return  "redirect:searchEnterprise.do";
	}
	
	@RequestMapping("deleteEnterprise")
	public String deleteEnterprise(@ModelAttribute Enterprise enterprise, Model model, HttpServletRequest request) {
		Account account = new Account();
		String mem_id = request.getParameter("mem_id");
		enterprise.setMem_id(mem_id);
		account.setMem_id(mem_id);
		accountService.delete(account);
		enterpriseService.delete(enterprise);
		return "redirect:searchEnterprise.do";
	}
	
	@RequestMapping("getEnterprise")
	public String getEnterprise(@ModelAttribute Enterprise enterprise, Model model, HttpServletRequest request) {
		String mem_id = request.getParameter("mem_id");
		enterprise.setMem_id(mem_id);
		List<Enterprise> enterpriseList = enterpriseService.getEnterpriseList(enterprise);
		model.addAttribute("enterprise", enterpriseList.get(0));
		return "enterpriseUpdate";
	}
	
	
	@RequestMapping("updateProduct")
	public String updateProduct(@ModelAttribute Enterprise enterprise, Model model, HttpServletRequest request) throws ParseException {
		Account account = new Account();
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String status = request.getParameter("status");
		if(!StringUtils.isEmpty(province)){
			enterprise.setProvince(province);
		}
		if(!StringUtils.isEmpty(city)){
			enterprise.setCity(city);
		}
		if(!StringUtils.isEmpty(status)){
			enterprise.setStatus(status);
		}
		String mem_id = request.getParameter("mem_id");
		enterprise.setMem_id(mem_id);
		Date a = new Date();
		enterprise.setRegistTime(DateUtil.formatDate(a));//没有修改时间
		account.setRegistTime(DateUtil.formatDate(a));
		account.setMem_id(mem_id.toString());
		account.setStatus(status);
		account.setPhone(enterprise.getTelephone());
		account.setUname(enterprise.getTelephone());
		account.setChannel("02");
		accountService.updateAccount(account);
		enterpriseService.updateEnterprise(enterprise);
		return  "redirect:searchEnterprise.do";
	}
}
