package com.retailstore.checkout.dto;

import javax.validation.constraints.NotNull;

/**
 * The Class ProductInfoForBill.
 */
public class ProductInfoForBill {

	/** The bar code id. */
	@NotNull
	private String barCodeId;

	/** The quantity. */
	@NotNull
	private int quantity;

	/**
	 * Instantiates a new product info for bill.
	 */
	public ProductInfoForBill() {
		super();
	}

	/**
	 * Instantiates a new product info for bill.
	 *
	 * @param barCodeId the bar code id
	 * @param quantity the quantity
	 */
	public ProductInfoForBill(String barCodeId, int quantity) {
		super();
		this.barCodeId = barCodeId;
		this.quantity = quantity;
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
	 * Gets the quantity.
	 *
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
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
	 * Sets the quantity.
	 *
	 * @param quantity the new quantity
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

}
