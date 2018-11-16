package com.retailstore.checkout.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.retailstore.checkout.dao.entities.Product;
import com.retailstore.checkout.service.ProductService;

/**
 * The Class ProductController.
 */
@RestController
public class ProductController {

	/** The product service. */
	@Autowired
	private ProductService productService;

	/**
	 * Gets the all products.
	 *
	 * @return the all products
	 */
	@GetMapping(value = "/api/products")
	public List<Product> getAllProducts() {
		return productService.getAllProducts();
	}

}
