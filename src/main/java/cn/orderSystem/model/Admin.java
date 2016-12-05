package cn.orderSystem.model;

/**
 * 
 * ClassName: Admin <br/>
 * Function: TODO ADD FUNCTION. <br/>
 *
 * @author zhujisong
 * @version
 * @since JDK 1.6
 */
public class Admin {

	private int id;
	private String adminName;
	private String adminPwd;
	private String newPwd;
	
	
	
	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

}
