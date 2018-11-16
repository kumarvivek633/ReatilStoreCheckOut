package com.retailstore.checkout.dao.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.retailstore.checkout.common.Category;

/**
 * The Class Product.
 */
@Entity
@Table(name = "PRODUCT_MASTER")
public class Product {

	/** The id. */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	/** The bar code id. */
	@NotNull
	@Column(unique = true)
	private String barCodeId;

	/** The name. */
	@NotNull
	private String name;

	/** The product category. */
	@NotNull
	private Category productCategory;

	/** The rate. */
	@NotNull
	private double rate;

	/**
	 * Instantiates a new product.
	 */
	public Product() {
	}

	/**
	 * Instantiates a new product.
	 *
	 * @param barCodeId the bar code id
	 * @param rate the rate
	 * @param name the name
	 * @param productCategory the product category
	 */
	public Product(String barCodeId, double rate, String name, Category productCategory) {
		super();
		this.barCodeId = barCodeId;
		this.rate = rate;
		this.name = name;
		this.productCategory = productCategory;
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
	 * Gets the id.
	 *
	 * @return the id
	 */
	public long getId() {
		return id;
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
	 * Sets the id.
	 *
	 * @param id the new id
	 */
	public void setId(long id) {
		this.id = id;
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

}
