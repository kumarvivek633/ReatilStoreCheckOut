package com.retailstore.checkout.dao.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.retailstore.checkout.dao.entities.Product;

/**
 * The Interface ProductRepository.
 */
public interface ProductRepository extends JpaRepository<Product, Long> {

	/**
	 * Find by bar code id.
	 *
	 * @param barCodeId
	 *            the bar code id
	 * @return the product
	 */
	public Product findByBarCodeId(String barCodeId);

}
