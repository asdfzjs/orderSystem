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
import cn.orderSystem.model.Category;
import cn.orderSystem.model.Enterprise;
import cn.orderSystem.model.Level;
import cn.orderSystem.model.Product;
import cn.orderSystem.model.Series;
import cn.orderSystem.model.Order;
import cn.orderSystem.service.AdminService;
import cn.orderSystem.service.EnterpriseService;
import cn.orderSystem.service.ProductService;
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
public class ProductController {
	@Autowired
	private ProductService productService;

	@RequestMapping("searchProduct")
	public String searchEnterprise(@ModelAttribute Product product, Model model, HttpServletRequest request) {
		PageInfo<Product> pageinfo = new PageInfo<Product>();
		String page = request.getParameter("page");
		int pageNum = 1;
		if (page != null && page.trim().length() != 0) {
			pageNum = Integer.parseInt(page);
		}
		pageinfo = productService.searchProduct(pageNum, 6, product);
		List<Product> productlist = pageinfo.getList();
		model.addAttribute("productlist", productlist);
		model.addAttribute("pageNum", pageinfo.getPageNum());
		model.addAttribute("pages", pageinfo.getPages());
		return "ProductSearch";
	}
	
	
	@RequestMapping("addProduct2")
	public String addProduct(@ModelAttribute Product product, Model model, HttpServletRequest request) {
		//把维度表信息取出来，类别，系列，等级
		List<Category> categoryList = 	productService.getCategoryList();
		List<Series> seriesList = 	productService.getSeriesList();
		List<Level> levelList = 	productService.getLevelList();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("seriesList", seriesList);
		model.addAttribute("levelList", levelList);
		return "addProduct";
	}
	
	@RequestMapping("addProduct3")
	public String addProduct3(@ModelAttribute Product product, Model model, HttpServletRequest request) {
		StringBuffer specification =  new StringBuffer();
		specification.append(product.getLength()).append("*").append(product.getWidth()).append("*").append(product.getHeight()).append("/").append(product.getCount());
		product.setSpecification(specification.toString());
		productService.addProduct(product);
		return  "redirect:searchProduct.do";
	}

}
