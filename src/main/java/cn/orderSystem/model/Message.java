/**
 * Project Name:orderSystem
 * File Name:Message.java
 * Package Name:cn.orderSystem.model
 * Date:2016年11月11日下午4:40:07
 * Copyright (c) 2016, chenzhou1025@126.com All Rights Reserved.
 *
*/

package cn.orderSystem.model;
/**
 * ClassName:Message <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason:	 TODO ADD REASON. <br/>
 * Date:     2016年11月11日 下午4:40:07 <br/>
 * @author   Administrator
 * @version  
 * @since    JDK 1.6
 * @see 	 
 */
public class Message {
	private int id;
	private String title;
	private String content;
	private String createTime;
	private String author;
	private String status;
	private String stick;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStick() {
		return stick;
	}
	public void setStick(String stick) {
		this.stick = stick;
	}
	
}

