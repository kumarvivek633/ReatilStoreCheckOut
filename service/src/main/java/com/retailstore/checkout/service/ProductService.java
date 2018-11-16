package com.retailstore.checkout.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.retailstore.checkout.dao.entities.Product;
import com.retailstore.checkout.dto.ProductInfo;

/**
 * The Class ProductService.
 */
@Service
public interface ProductService {

	/**
	 * Creates the product.
	 *
	 * @param productInfo
	 *            the product info
	 * @return the product
	 * @throws Exception
	 *             the exception
	 */
	public Product createProduct(ProductInfo productInfo);

	/**
	 * Gets the all products.
	 *
	 * @return the all products
	 */
	public List<Product> getAllProducts();

}
