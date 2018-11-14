package com.retailstore.checkout.dao.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.retailstore.checkout.dao.entities.Product;


public interface ProductRepository extends CrudRepository<Product, Long> {

	public long count();

	public List<Product> findByBarCodeId(String barCodeId);

}
