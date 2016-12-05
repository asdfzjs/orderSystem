/**
 * Project Name:orderSystem
 * File Name:Order.java
 * Package Name:cn.orderSystem.model
 * Date:2016年11月10日下午4:29:45
 * Copyright (c) 2016, chenzhou1025@126.com All Rights Reserved.
 *
*/

package cn.orderSystem.model;

import java.util.Date;

/**
 * ClassName:Order <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason:	 TODO ADD REASON. <br/>
 * Date:     2016年11月10日 下午4:29:45 <br/>
 * @author   Administrator
 * @version  
 * @since    JDK 1.6
 * @see 	 
 */
public class Order {
	
	//订单
	private Long id;
	private String orderID; //订单号
	private String orderType;//'订单类型 01 - 默认类型'
	private String orderStatus;//'订单状态：01 - 草稿状态；10 - 待审核； 02 - 待支付；11 - 待审核；06 - 待发货；08 - 待收货； 09 - 已收货'
	private String seller;//'卖家 常量：evip201612011'
	private String buyer; //'经销商, 格式：e+手机号+1，如：e139112233441'
	private Double amount;//DEFAULT '0.00' COMMENT '订单金额
	private Date deliveryDate; //'送货时间'
	private String urgent;//'紧急程度，空为不紧急；如经销商填写了预期送货日期，则转换成文本格式后记录在此字段'
	private Date createTime;//下单时间
	private Date updateTime;//订单更新时间
	private int couponTicket;//优惠券， 为空
	private int points;//积分点数
	private String deleteFlag; //数据软删除标记： 0 - 未删除；1 - 删除
	private Date deleteTime;//删除日期
	private String channelDistributorCode;//渠道经销商代码， 常量：02手机端
	
	//厂家
	private String fullname;
	private String province;
	private String city;
	
	//查询条件
	private String txtBeginDate;
	private String txtEndDate;
	
	
	public String getTxtBeginDate() {
		return txtBeginDate;
	}
	public void setTxtBeginDate(String txtBeginDate) {
		this.txtBeginDate = txtBeginDate;
	}
	public String getTxtEndDate() {
		return txtEndDate;
	}
	public void setTxtEndDate(String txtEndDate) {
		this.txtEndDate = txtEndDate;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getOrderID() {
		return orderID;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	public String getBuyer() {
		return buyer;
	}
	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Date getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getUrgent() {
		return urgent;
	}
	public void setUrgent(String urgent) {
		this.urgent = urgent;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCeateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public int getCouponTicket() {
		return couponTicket;
	}
	public void setCouponTicket(int couponTicket) {
		this.couponTicket = couponTicket;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public Date getDeleteTime() {
		return deleteTime;
	}
	public void setDeleteTime(Date deleteTime) {
		this.deleteTime = deleteTime;
	}
	public String getChannelDistributorCode() {
		return channelDistributorCode;
	}
	public void setChannelDistributorCode(String channelDistributorCode) {
		this.channelDistributorCode = channelDistributorCode;
	}
	
}

