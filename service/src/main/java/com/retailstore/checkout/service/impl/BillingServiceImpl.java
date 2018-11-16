package com.retailstore.checkout.service.impl;

import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retailstore.checkout.common.Category;
import com.retailstore.checkout.common.ErrorCodes;
import com.retailstore.checkout.common.RetailStoreApplicationException;
import com.retailstore.checkout.dao.entities.Bill;
import com.retailstore.checkout.dao.entities.Item;
import com.retailstore.checkout.dao.entities.Product;
import com.retailstore.checkout.dao.repository.BillingRepository;
import com.retailstore.checkout.dao.repository.ItemRepository;
import com.retailstore.checkout.dao.repository.ProductRepository;
import com.retailstore.checkout.dto.BillUpdateInfo;
import com.retailstore.checkout.dto.ProductForBill;
import com.retailstore.checkout.service.BillingService;

/**
 * The Class BillService.
 */
@Service
public class BillingServiceImpl implements BillingService {

	/** The bill repo. */
	@Autowired
	private BillingRepository billRepo;

	/** The line item repo. */
	@Autowired
	private ItemRepository itemRepo;

	/** The product repo. */
	@Autowired
	private ProductRepository productRepo;

	/**
	 * Adds the product to bill.
	 *
	 * @param billId
	 *            the bill id
	 * @param barCodeId
	 *            the bar code id
	 * @param quantity
	 *            the quantity
	 * @return the bill
	 * @throws Exception
	 *             the exception
	 */
	private Bill addProductToBill(Long billId, String barCodeId, int quantity) {
		Optional<Bill> optBill = billRepo.findById(billId);
		Product selectedPro = verifyProductExists(barCodeId);

		Item item = new Item(selectedPro, quantity);
		itemRepo.save(item);
		Bill bill = optBill.isPresent() ? optBill.get() : null;
		Set<Item> currentLineItems = bill != null ? bill.getItems() : null;
		if (currentLineItems != null) {
			Item existingLi = getItemWithBarCodeId(barCodeId, currentLineItems);
			if (existingLi == null) {
				bill.getItems().add(item);
			} else {
				long newQty = existingLi.getQuantity() + quantity;

				existingLi.setQuantity(newQty);
			}
		} else {
			currentLineItems = new LinkedHashSet<>();
			currentLineItems.add(item);
			if (bill != null) {
				bill.setItems(currentLineItems);
			}
		}
		return billRepo.save(bill);
	}

	/**
	 * Calculate total value.
	 *
	 * @param bill
	 *            the bill
	 */
	private void calculateTotalValue(Bill bill) {

		int noOfItems = 0;
		double totalValue = 0;
		double totalCost = 0;

		if (null != bill.getItems()) {
			Set<Item> lineItems = bill.getItems();
			Iterator<Item> lineItemsIter = lineItems.iterator();
			while (lineItemsIter.hasNext()) {
				Item li = lineItemsIter.next();
				double saleValue = calculateItemValue(li.getQuantity(), li.getProduct().getProductCategory(),
						li.getProduct().getRate());
				totalValue += saleValue;
				totalCost += li.getQuantity() * li.getProduct().getRate();
				noOfItems++;
			}
		}
		bill.setTotalItems(noOfItems);
		bill.setCostAfterTax(totalValue);
		bill.setTotalCost(totalCost);
		bill.setTax(totalValue - totalCost);
		billRepo.save(bill);
	}

	/**
	 * Calculate item value.
	 *
	 * @param quantity
	 *            the quantity
	 * @param productCategory
	 *            the product category
	 * @param rate
	 *            the rate
	 * @return the double
	 */
	private double calculateItemValue(long quantity, Category productCategory, double rate) {
		double saleValue = 0;
		if (productCategory.equals(Category.A)) {
			saleValue = quantity * rate * 1.1;

		} else if (productCategory.equals(Category.B)) {
			saleValue = quantity * rate * 1.2;

		} else if (productCategory.equals(Category.C)) {
			saleValue = quantity * rate;
		}
		return saleValue;
	}

	/**
	 * Creates the bill.
	 *
	 * @param bill
	 *            the bill
	 * @return the bill
	 */
	public Bill createBill(Bill bill) {
		return billRepo.save(bill);
	}

	/**
	 * Delete bill.
	 *
	 * @param id
	 *            the id
	 * @throws Exception
	 *             the exception
	 */
	public void deleteBill(Long id) {
		verifyBillExists(id);
		billRepo.deleteById(id);
	}

	/**
	 * Gets the all bills.
	 *
	 * @return the all bills
	 */
	public List<Bill> getAllBills() {
		return billRepo.findAll();
	}

	/**
	 * Gets the bill by id.
	 *
	 * @param id
	 *            the id
	 * @return the bill by id
	 * @throws Exception
	 *             the exception
	 */
	public Bill getBillById(Long id) {
		return verifyBillExists(id);
	}

	/**
	 * Gets the item with bar code id.
	 *
	 * @param barCodeId
	 *            the bar code id
	 * @param currentLineItems
	 *            the current line items
	 * @return the item with bar code id
	 */
	private Item getItemWithBarCodeId(String barCodeId, Set<Item> currentLineItems) {
		Iterator<Item> iterator = currentLineItems.iterator();
		while (iterator.hasNext()) {
			Item li = iterator.next();
			if (barCodeId.equals(li.getProduct().getBarCodeId())) {
				return li;
			}
		}
		return null;
	}

	/**
	 * Verify bill exists.
	 *
	 * @param id
	 *            the id
	 * @return the bill
	 * @throws Exception
	 *             the exception
	 */
	private Bill verifyBillExists(Long id) {
		Optional<Bill> bill = billRepo.findById(id);
		if (!bill.isPresent()) {
			throw new RetailStoreApplicationException("Bill with id " + id + " not found",
					ErrorCodes.INTERNAL_SERVER_ERROR);
		} else {
			return bill.get();
		}
	}

	/**
	 * Verify product exists.
	 *
	 * @param barCodeId
	 *            the bar code id
	 * @return the product
	 * @throws Exception
	 *             the exception
	 */
	private Product verifyProductExists(String barCodeId) {
		Product productsByBarCodeId = productRepo.findByBarCodeId(barCodeId);
		if (null == productsByBarCodeId) {
			throw new RetailStoreApplicationException(
					"Problem with input data: BarCode ID " + barCodeId + " does not exist in Product Master",
					ErrorCodes.INTERNAL_SERVER_ERROR);
		}
		return productsByBarCodeId;
	}

	/**
	 * Update bill.
	 *
	 * @param billUpdateInfo
	 *            the bill update info
	 * @param billId
	 *            the bill id
	 * @return the bill
	 * @throws Exception
	 *             the exception
	 */
	public Bill updateBill(BillUpdateInfo billUpdateInfo, Long billId) {

		if (null == billUpdateInfo) {
			throw new RetailStoreApplicationException("There is no information to be updated for id " + billId,
					ErrorCodes.INTERNAL_SERVER_ERROR);
		}
		Bill bill = verifyBillExists(billId);

		if (null != billUpdateInfo.getProductsToBeAdded()) {
			List<ProductForBill> prodToBeAdded = billUpdateInfo.getProductsToBeAdded();
			Iterator<ProductForBill> prodToBeAddedIter = prodToBeAdded.iterator();
			while (prodToBeAddedIter.hasNext()) {
				ProductForBill pInfo = prodToBeAddedIter.next();
				addProductToBill(billId, pInfo.getBarCodeId(), pInfo.getQuantity());
			}
		}

		bill.setStatus(billUpdateInfo.getStatus());
		calculateTotalValue(bill);
		return bill;
	}

}
