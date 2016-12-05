/**
 * Project Name:orderSystem
 * File Name:OrderController.java
 * Package Name:cn.orderSystem.controller
 * Date:2016年11月10日下午5:37:50
 * Copyright (c) 2016, chenzhou1025@126.com All Rights Reserved.
 *
*/

package cn.orderSystem.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;

import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Order;
import cn.orderSystem.service.AdminService;
import cn.orderSystem.service.OrderService;

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
public class OrderController {
	@Autowired
	private OrderService orderService;

	@RequestMapping("searchOrder")
	public String searchOrder(@ModelAttribute Order order, Model model, HttpServletRequest request) {
		PageInfo<Order> pageinfo = new PageInfo<Order>();
		String page = request.getParameter("page");
		int pageNum = 1;
		if (page != null && page.trim().length() != 0) {
			pageNum = Integer.parseInt(page);
		}
		pageinfo = orderService.searchOrder(pageNum, 6, order);
		List<Order> orderlist = pageinfo.getList();
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("pageNum", pageinfo.getPageNum());
		model.addAttribute("pages", pageinfo.getPages());
		return "orderSearch";
	}

	// 待审核
	@RequestMapping("searchCheckOrder")
	public String searchCheckOrder(@ModelAttribute Order order, Model model, HttpServletRequest request) {
		PageInfo<Order> pageinfo = new PageInfo<Order>();
		String page = request.getParameter("page");
		int pageNum = 1;
		if (page != null && page.trim().length() != 0) {
			pageNum = Integer.parseInt(page);
		}
		order.setOrderStatus("10");
		pageinfo = orderService.searchOrderStatus(pageNum, 6, order);
		List<Order> orderlist = pageinfo.getList();
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("pageNum", pageinfo.getPageNum());
		model.addAttribute("pages", pageinfo.getPages());
		return "orderCheckSearch";
	}

	// 待付款
	@RequestMapping("searchPayOrder")
	public String searchPayOrder(@ModelAttribute Order order, Model model, HttpServletRequest request) {
		PageInfo<Order> pageinfo = new PageInfo<Order>();
		String page = request.getParameter("page");
		int pageNum = 1;
		if (page != null && page.trim().length() != 0) {
			pageNum = Integer.parseInt(page);
		}
		order.setOrderStatus("02");
		pageinfo = orderService.searchOrderStatus(pageNum, 6, order);
		List<Order> orderlist = pageinfo.getList();
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("pageNum", pageinfo.getPageNum());
		model.addAttribute("pages", pageinfo.getPages());
		return "orderPaySearch";
	}

	// 待发货
	@RequestMapping("searchSendOrder")
	public String searchSendOrder(@ModelAttribute Order order, Model model, HttpServletRequest request) {
		PageInfo<Order> pageinfo = new PageInfo<Order>();
		String page = request.getParameter("page");
		int pageNum = 1;
		if (page != null && page.trim().length() != 0) {
			pageNum = Integer.parseInt(page);
		}
		order.setOrderStatus("06");
		pageinfo = orderService.searchOrderStatus(pageNum, 6, order);
		List<Order> orderlist = pageinfo.getList();
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("pageNum", pageinfo.getPageNum());
		model.addAttribute("pages", pageinfo.getPages());
		return "orderSendSearch";
	}
}
