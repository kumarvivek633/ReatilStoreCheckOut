package com.retailstore.checkout.dto;

import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.builder.ToStringBuilder;

import com.retailstore.checkout.common.Category;

/**
 * The Class ProductInfo.
 */
public class ProductInfo {

	/** The bar code id. */
	@NotNull
	private String barCodeId;

	/** The name. */
	@NotNull
	private String name;

	/** The product category. */
	@NotNull
	private Category productCategory;

	/** The rate. */
	@NotNull
	@DecimalMin(value = "0.1")
	private double rate;

	/**
	 * Instantiates a new product info.
	 */
	public ProductInfo() {
		super();
	}

	/**
	 * Instantiates a new product info.
	 *
	 * @param barCodeId the bar code id
	 * @param rate the rate
	 * @param name the name
	 * @param productCategory the product category
	 */
	public ProductInfo(String barCodeId, double rate, String name, Category productCategory) {
		super();
		this.barCodeId = barCodeId;
		this.name = name;
		this.productCategory = productCategory;
		this.rate = rate;
	}

	/**
	 * Gets the bar code id.
	 *
	 * @return the bar code id
	 */
	public String getBarCodeId() {
		return barCodeId;
	}

	/**
	 * Gets the name.
	 *
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * Gets the product category.
	 *
	 * @return the product category
	 */
	public Category getProductCategory() {
		return productCategory;
	}

	/**
	 * Gets the rate.
	 *
	 * @return the rate
	 */
	public double getRate() {
		return rate;
	}

	/**
	 * Sets the bar code id.
	 *
	 * @param barCodeId the new bar code id
	 */
	public void setBarCodeId(String barCodeId) {
		this.barCodeId = barCodeId;
	}

	/**
	 * Sets the name.
	 *
	 * @param name the new name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Sets the product category.
	 *
	 * @param productCategory the new product category
	 */
	public void setProductCategory(Category productCategory) {
		this.productCategory = productCategory;
	}

	/**
	 * Sets the rate.
	 *
	 * @param rate the new rate
	 */
	public void setRate(double rate) {
		this.rate = rate;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

}
