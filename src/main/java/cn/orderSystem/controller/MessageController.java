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
import cn.orderSystem.model.Enterprise;
import cn.orderSystem.model.Message;
import cn.orderSystem.model.Order;
import cn.orderSystem.service.AdminService;
import cn.orderSystem.service.EnterpriseService;
import cn.orderSystem.service.MessageService;
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
public class MessageController {
	@Autowired
	private MessageService messageService;

	@RequestMapping("searchMessage")
	public String searchEnterprise(@ModelAttribute Message message, Model model, HttpServletRequest request) {
		PageInfo<Message> pageinfo = new PageInfo<Message>();
		String page = request.getParameter("page");
		int pageNum = 1;
		if (page != null && page.trim().length() != 0) {
			pageNum = Integer.parseInt(page);
		}
		pageinfo = messageService.searchMessage(pageNum, 6, message);
		List<Message> messagelist = pageinfo.getList();
		model.addAttribute("messagelist", messagelist);
		model.addAttribute("pageNum", pageinfo.getPageNum());
		model.addAttribute("pages", pageinfo.getPages());
		return "MessageSearch";
	}
	
	@RequestMapping("addMessage")
	public String addMessage(@ModelAttribute Message message, Model model, HttpServletRequest request) {
		messageService.addMessage(message);
		return "redirect:searchMessage.do";
	}
	
}
