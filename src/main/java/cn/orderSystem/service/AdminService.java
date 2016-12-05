package cn.orderSystem.service;

import org.springframework.stereotype.Service;

import cn.orderSystem.model.Admin;
/**
 * 
 * ClassName: AdminService <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON(可选). <br/>
 * date: 2016年11月10日 下午12:33:37 <br/>
 *
 * @author zhujisong
 * @version 
 * @since JDK 1.8
 */
public interface AdminService {

	public Admin login(Admin admin);

	public void updatePwd(Admin admin);
}
