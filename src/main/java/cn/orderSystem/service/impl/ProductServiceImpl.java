package cn.orderSystem.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.orderSystem.dao.AdminMapper;
import cn.orderSystem.dao.CategoryMapper;
import cn.orderSystem.dao.LevelMapper;
import cn.orderSystem.dao.ProductMapper;
import cn.orderSystem.dao.SeriesMapper;
import cn.orderSystem.dao.OrderMapper;
import cn.orderSystem.dao.UserMapper;
import cn.orderSystem.model.Admin;
import cn.orderSystem.model.Category;
import cn.orderSystem.model.Level;
import cn.orderSystem.model.Product;
import cn.orderSystem.model.Series;
import cn.orderSystem.model.Order;
import cn.orderSystem.model.User;
import cn.orderSystem.service.AdminService;
import cn.orderSystem.service.ProductService;
import cn.orderSystem.service.OrderService;
import cn.orderSystem.service.UserService;


@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductMapper ProductDAO;
	@Autowired
	private CategoryMapper CategoryDAO;
	@Autowired
	private SeriesMapper SeriesDAO;
	@Autowired
	private LevelMapper LevelDAO;
	

	public List<Product> getProductList(Product product) {
		Map<String, Object> params = new HashMap<>();
		return ProductDAO.searchProduct(product);
	}
	
	
	public PageInfo<Product> searchProduct(int pageNo, int pageSize,Product product) {
		PageHelper.startPage(pageNo, pageSize);
		List<Product> list = getProductList(product);
		return new PageInfo<Product>(list);
	}


	@Override
	public PageInfo<Product> searchProductStatus(int pageNo, int pageSize, Product product) {
		PageHelper.startPage(pageNo, pageSize);
		List<Product> list = getProductList(product);
		return new PageInfo<Product>(list);
	}


	@Override
	public List<Category> getCategoryList() {
		
		// TODO Auto-generated method stub
		return CategoryDAO.getCategoryList();
	}


	@Override
	public List<Series> getSeriesList() {
		
		// TODO Auto-generated method stub
		return SeriesDAO.getSeriesList();
	}


	@Override
	public List<Level> getLevelList() {
		
		// TODO Auto-generated method stub
		return LevelDAO.getLevelList();
	}


	@Override
	public void addProduct(Product product) {
		
		ProductDAO.addProduct(product);
		
	}
	

}
