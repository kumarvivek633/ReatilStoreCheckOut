package com.retailstore.checkout.dto;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.retailstore.checkout.dao.util.Category;

public class ProductInfo {

	@NotNull
	private String barCodeId;

	@NotNull
	private String name;

	@NotNull
	private Category productCategory;

	@NotNull
	@DecimalMin(value = "0.1")
	private double rate;

	public ProductInfo() {
		super();
	}

	public ProductInfo(String barCodeId, double rate, String name, Category productCategory) {
		super();
		this.barCodeId = barCodeId;
		this.name = name;
		this.productCategory = productCategory;
		this.rate = rate;
	}

	public String getBarCodeId() {
		return barCodeId;
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

	public void setName(String name) {
		this.name = name;
	}

	public void setProductCategory(Category productCategory) {
		this.productCategory = productCategory;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
