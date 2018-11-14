package com.retailstore.checkout.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retailstore.checkout.dao.entities.Product;
import com.retailstore.checkout.dao.repository.ProductRepository;
import com.retailstore.checkout.dto.ProductInfo;

/**
 * The Class ProductService.
 */
@Service
public class ProductService {

	/** The product repo. */
	@Autowired
	private ProductRepository productRepo;

	/**
	 * Creates the product.
	 *
	 * @param productInfo the product info
	 * @return the product
	 * @throws Exception the exception
	 */
	public Product createProduct(ProductInfo productInfo) throws Exception {
		verifyIfProductExists(productInfo.getBarCodeId());
		Product product = new Product();
		product.setBarCodeId(productInfo.getBarCodeId());
		product.setName(productInfo.getName());
		product.setProductCategory(productInfo.getProductCategory());
		product.setRate(productInfo.getRate());

		product = productRepo.save(product);
		return product;

	}

	/**
	 * Gets the all products.
	 *
	 * @return the all products
	 */
	public Iterable<Product> getAllProducts() {
		return productRepo.findAll();
	}

	/**
	 * Verify if product exists.
	 *
	 * @param barCodeId the bar code id
	 * @throws Exception the exception
	 */
	private void verifyIfProductExists(String barCodeId) throws Exception {
		List<Product> productsByBarCodeID = productRepo.findByBarCodeId(barCodeId);
		if (null != productsByBarCodeID && !productsByBarCodeID.isEmpty()) {
			throw new Exception(
					"Problem with input data: BarCode ID  " + barCodeId + " already exists in Product Master");
		}
	}

}
