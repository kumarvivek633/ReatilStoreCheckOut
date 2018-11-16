package com.retailstore.checkout.dto;

import java.util.List;

import javax.validation.constraints.NotNull;

import com.retailstore.checkout.common.Status;

/**
 * The Class BillUpdateInfo.
 */
public class BillUpdateInfo {

	/** The products to be added. */
	private List<ProductForBill> productsToBeAdded;

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
	public List<ProductForBill> getProductsToBeAdded() {
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
	public void setProductsToBeAdded(List<ProductForBill> productsToBeAdded) {
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
