package cn.orderSystem.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.orderSystem.model.Category;
import cn.orderSystem.model.Level;
import cn.orderSystem.model.Product;
import cn.orderSystem.model.Series;

public interface ProductService {

	public PageInfo<Product> searchProduct(int pageNo, int pageSize,Product product);

	List<Product> getProductList(Product product);

	public PageInfo<Product> searchProductStatus(int pageNo, int pageSize, Product product);
	
	
	List<Category> getCategoryList();
	
	List<Series> getSeriesList();
	
	List<Level> getLevelList();

	public void addProduct(Product product);
}
