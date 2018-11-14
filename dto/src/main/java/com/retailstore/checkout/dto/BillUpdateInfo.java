package com.retailstore.checkout.dto;

import java.util.List;

import javax.validation.constraints.NotNull;

import com.retailstore.checkout.dao.util.Status;

/**
 * The Class BillUpdateInfo.
 */
public class BillUpdateInfo {

	/** The products to be added. */
	private List<ProductInfoForBill> productsToBeAdded;

	/** The status. */
	@NotNull
	private Status status;

	/**
	 * Instantiates a new bill update info.
	 */
	public BillUpdateInfo() {
		super();
	}

	/**
	 * Gets the products to be added.
	 *
	 * @return the products to be added
	 */
	public List<ProductInfoForBill> getProductsToBeAdded() {
		return productsToBeAdded;
	}

	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public Status getStatus() {
		return status;
	}

	/**
	 * Sets the products to be added.
	 *
	 * @param productsToBeAdded
	 *            the new products to be added
	 */
	public void setProductsToBeAdded(List<ProductInfoForBill> productsToBeAdded) {
		this.productsToBeAdded = productsToBeAdded;
	}

	/**
	 * Sets the status.
	 *
	 * @param status
	 *            the new status
	 */
	public void setStatus(Status status) {
		this.status = status;
	}

}
