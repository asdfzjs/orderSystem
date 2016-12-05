package cn.orderSystem.model;

public class Product {
	private int id;
	private String commodityID; //商品
	private String commdityCategoryID;
	private String commditySeriesID;
	private String commdityName;
	private String specification;
	private String commdityLevelID;
	private Double length;
	private Double height;
	private Double price;
	private String sizeunit;
	private String priceunit;
	private String description;
	private String status;
	private Double width;
	private String colorCode;
	private int count;//每包片数
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getColorCode() {
		return colorCode;
	}
	public void setColorCode(String colorCode) {
		this.colorCode = colorCode;
	}
	public Double getWidth() {
		return width;
	}
	public void setWidth(Double width) {
		this.width = width;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCommodityID() {
		return commodityID;
	}
	public void setCommodityID(String commodityID) {
		this.commodityID = commodityID;
	}
	public String getCommdityCategoryID() {
		return commdityCategoryID;
	}
	public void setCommdityCategoryID(String commdityCategoryID) {
		this.commdityCategoryID = commdityCategoryID;
	}
	public String getCommditySeriesID() {
		return commditySeriesID;
	}
	public void setCommditySeriesID(String commditySeriesID) {
		this.commditySeriesID = commditySeriesID;
	}
	public String getCommdityName() {
		return commdityName;
	}
	public void setCommdityName(String commdityName) {
		this.commdityName = commdityName;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public String getCommdityLevelID() {
		return commdityLevelID;
	}
	public void setCommdityLevelID(String commdityLevelID) {
		this.commdityLevelID = commdityLevelID;
	}
	public Double getLength() {
		return length;
	}
	public void setLength(Double length) {
		this.length = length;
	}
	
	public Double getHeight() {
		return height;
	}
	public void setHeight(Double height) {
		this.height = height;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getSizeunit() {
		return sizeunit;
	}
	public void setSizeunit(String sizeunit) {
		this.sizeunit = sizeunit;
	}
	public String getPriceunit() {
		return priceunit;
	}
	public void setPriceunit(String priceunit) {
		this.priceunit = priceunit;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}
