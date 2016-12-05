package cn.orderSystem.dao;

import java.util.List;

import cn.orderSystem.model.Message;
import cn.orderSystem.model.Product;

public interface ProductMapper {

	List<Product> searchProduct(Product product);

	void addProduct(Product product);
}