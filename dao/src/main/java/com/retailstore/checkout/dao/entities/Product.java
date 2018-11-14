package com.retailstore.checkout.dao.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.retailstore.checkout.dao.util.Category;


@Entity
@Table(name = "PRODUCT_MASTER")

public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	
	@NotNull
	@Column(unique = true)
	private String barCodeId;

	@NotNull
	private String name;

	@NotNull
	private Category productCategory;

	@NotNull
	private double rate;

	public Product() {
	}

	public Product(String barCodeId, double rate, String name, Category productCategory) {
		super();
		this.barCodeId = barCodeId;
		this.rate = rate;
		this.name = name;
		this.productCategory = productCategory;
	}

	public String getBarCodeId() {
		return barCodeId;
	}

	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public Category getProductCategory() {
		return productCategory;
	}

	public double getRate() {
		return rate;
	}

	public void setBarCodeId(String barCodeId) {
		this.barCodeId = barCodeId;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setProductCategory(Category productCategory) {
		this.productCategory = productCategory;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

}