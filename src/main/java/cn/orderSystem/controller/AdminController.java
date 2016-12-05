package cn.orderSystem.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.orderSystem.model.Admin;
import cn.orderSystem.service.AdminService;

@Controller
@RequestMapping("/")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("login")
	public String login(@ModelAttribute Admin admin, HttpServletRequest request){
		Admin loginAdmin = new Admin();
		loginAdmin = adminService.login(admin);
		HttpSession session = request.getSession(); 
		if(loginAdmin!=null){
			session.setAttribute("admin", loginAdmin);
			return "index";
		}
		return "login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession(); 
		session.removeAttribute("admin");
		return "login";
	}
	
	@RequestMapping("updatePwd")
	public String updatePwd(@ModelAttribute Admin admin,HttpServletRequest request){
		Admin loginAdmin = new Admin();
		HttpSession session = request.getSession(); 
	    loginAdmin = (Admin) session.getAttribute("admin");
	    if(loginAdmin.getAdminPwd().equals(admin.getAdminPwd())){
	    	admin.setAdminName(loginAdmin.getAdminName());
	    	adminService.updatePwd(admin);
	    }
		return "login";
	}
}

