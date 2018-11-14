package com.retailstore.checkout.dao.entities;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.lang.NonNull;

/**
 * The Class Item.
 */
@Entity
@Table(name = "ITEMS")
public class Item {

	/** The id. */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	/** The product. */
	@OneToOne(fetch = FetchType.EAGER)
	private Product product;

	/** The quantity. */
	@NonNull
	private long quantity;

	/**
	 * Instantiates a new item.
	 */
	public Item() {
		super();
	}

	/**
	 * Instantiates a new item.
	 *
	 * @param product
	 *            the product
	 * @param quantity
	 *            the quantity
	 */
	public Item(Product product, int quantity) {
		super();
		this.product = product;
		this.quantity = quantity;
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
	 * Gets the product.
	 *
	 * @return the product
	 */
	public Product getProduct() {
		return product;
	}

	/**
	 * Gets the quantity.
	 *
	 * @return the quantity
	 */
	public long getQuantity() {
		return quantity;
	}

	/**
	 * Sets the id.
	 *
	 * @param id
	 *            the new id
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * Sets the product.
	 *
	 * @param product
	 *            the new product
	 */
	public void setProduct(Product product) {
		this.product = product;
	}

	/**
	 * Sets the quantity.
	 *
	 * @param quantity
	 *            the new quantity
	 */
	public void setQuantity(long quantity) {
		this.quantity = quantity;
	}

}
