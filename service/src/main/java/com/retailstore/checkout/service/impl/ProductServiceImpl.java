package com.retailstore.checkout.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retailstore.checkout.common.ErrorCodes;
import com.retailstore.checkout.common.RetailStoreApplicationException;
import com.retailstore.checkout.dao.entities.Product;
import com.retailstore.checkout.dao.repository.ProductRepository;
import com.retailstore.checkout.dto.ProductInfo;
import com.retailstore.checkout.service.ProductService;

/**
 * The Class ProductServiceImpl.
 */
@Service
public class ProductServiceImpl implements ProductService {

	/** The product repo. */
	@Autowired
	private ProductRepository productRepo;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.retailstore.checkout.service.ProductService#createProduct(com.
	 * retailstore.checkout.dto.ProductInfo)
	 */
	public Product createProduct(ProductInfo productInfo) {
		verifyIfProductExists(productInfo.getBarCodeId());
		Product product = new Product();
		product.setBarCodeId(productInfo.getBarCodeId());
		product.setName(productInfo.getName());
		product.setProductCategory(productInfo.getProductCategory());
		product.setRate(productInfo.getRate());
		return productRepo.save(product);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.retailstore.checkout.service.ProductService#getAllProducts()
	 */
	public List<Product> getAllProducts() {
		return productRepo.findAll();
	}

	/**
	 * Verify if product exists.
	 *
	 * @param barCodeId            the bar code id
	 */
	private void verifyIfProductExists(String barCodeId) {
		Product productsByBarCodeID = productRepo.findByBarCodeId(barCodeId);
		if (null != productsByBarCodeID) {
			throw new RetailStoreApplicationException(
					"Problem with input data: BarCode ID  " + barCodeId + " already exists in Product Master",
					ErrorCodes.INTERNAL_SERVER_ERROR);
		}
	}

}
