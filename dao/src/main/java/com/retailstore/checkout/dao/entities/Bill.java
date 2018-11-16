package com.retailstore.checkout.dao.entities;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.retailstore.checkout.common.Status;

/**
 * The Class Bill.
 */
@Entity
@Table(name = "BILLS")
public class Bill {

	/** The id. */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	/** The total items. */
	private int totalItems;

	/** The total cost. */
	private double totalCost;

	/** The tax. */
	private double tax;

	/** The cost after tax. */
	private double costAfterTax;

	/** The status. */
	private Status status;

	/** The items. */
	@OneToMany(fetch = FetchType.EAGER)
	private Set<Item> items;

	/** The user. */
	@OneToOne(fetch = FetchType.EAGER)
	private User user;

	/**
	 * Instantiates a new bill.
	 */
	public Bill() {
		super();
	}

	/**
	 * Instantiates a new bill.
	 *
	 * @param costAfterTax
	 *            the cost after tax
	 * @param totalItems
	 *            the total items
	 * @param status
	 *            the status
	 */
	public Bill(double costAfterTax, int totalItems, Status status) {
		super();
		this.costAfterTax = costAfterTax;
		this.totalItems = totalItems;
		this.status = status;
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
	 * Sets the id.
	 *
	 * @param id
	 *            the new id
	 */
	public void setId(long id) {
		this.id = id;
	}

	/**
	 * Gets the total items.
	 *
	 * @return the total items
	 */
	public int getTotalItems() {
		return totalItems;
	}

	/**
	 * Sets the total items.
	 *
	 * @param totalItems
	 *            the new total items
	 */
	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	/**
	 * Gets the total cost.
	 *
	 * @return the total cost
	 */
	public double getTotalCost() {
		return totalCost;
	}

	/**
	 * Sets the total cost.
	 *
	 * @param totalCost
	 *            the new total cost
	 */
	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}

	/**
	 * Gets the tax.
	 *
	 * @return the tax
	 */
	public double getTax() {
		return tax;
	}

	/**
	 * Sets the tax.
	 *
	 * @param tax
	 *            the new tax
	 */
	public void setTax(double tax) {
		this.tax = tax;
	}

	/**
	 * Gets the cost after tax.
	 *
	 * @return the cost after tax
	 */
	public double getCostAfterTax() {
		return costAfterTax;
	}

	/**
	 * Sets the cost after tax.
	 *
	 * @param costAfterTax
	 *            the new cost after tax
	 */
	public void setCostAfterTax(double costAfterTax) {
		this.costAfterTax = costAfterTax;
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
	 * Sets the status.
	 *
	 * @param status
	 *            the new status
	 */
	public void setStatus(Status status) {
		this.status = status;
	}

	/**
	 * Gets the items.
	 *
	 * @return the items
	 */
	public Set<Item> getItems() {
		return items;
	}

	/**
	 * Sets the items.
	 *
	 * @param items
	 *            the new items
	 */
	public void setItems(Set<Item> items) {
		this.items = items;
	}

	/**
	 * Gets the user.
	 *
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * Sets the user.
	 *
	 * @param user
	 *            the new user
	 */
	public void setUser(User user) {
		this.user = user;
	}
}
