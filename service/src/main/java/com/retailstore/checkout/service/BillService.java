package com.retailstore.checkout.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.retailstore.checkout.dao.entities.Bill;
import com.retailstore.checkout.dao.entities.Item;
import com.retailstore.checkout.dao.entities.Product;
import com.retailstore.checkout.dao.repository.BillRepository;
import com.retailstore.checkout.dao.repository.LineItemRepository;
import com.retailstore.checkout.dao.repository.ProductRepository;
import com.retailstore.checkout.dao.util.Category;
import com.retailstore.checkout.dto.BillUpdateInfo;
import com.retailstore.checkout.dto.ProductInfoForBill;

@Service
public class BillService {

	@Autowired
	private BillRepository billRepo;

	@Autowired
	private LineItemRepository lineItemRepo;

	@Autowired
	private ProductRepository productRepo;

	private Bill addProductToBill(Long billId, String barCodeId, int quantity) throws Exception {
		Optional<Bill> o1 = billRepo.findById(billId);
		Product selectedProduct1 = verifyIfProductExists(barCodeId);

		Item l1 = new Item(selectedProduct1, quantity);
		lineItemRepo.save(l1);

		Set<Item> currentLineItems = o1.get().getItems();
		if (currentLineItems != null) { // There are lineItems in the bill
										// already.
			Item existingLi = getLineItemWithBarCodeId(barCodeId, currentLineItems);
			if (existingLi == null) {

				o1.get().getItems().add(l1); // there is no line item with
												// existing product
			} else {
				long newQty = existingLi.getQuantity() + quantity;

				existingLi.setQuantity(newQty); // increment the quantity of the
												// product if it already exists
												// in the Bill.
			}

		} else {
			currentLineItems = new LinkedHashSet<>();
			currentLineItems.add(l1);
			o1.get().setItems(currentLineItems);
		}
		billRepo.save(o1.get());
		return o1.get();
	}

	private void computeTotalValues(Bill bill) {

		int noOfItems = 0;
		double totalValue = 0;
		double totalCost = 0;

		if (null != bill.getItems()) {
			Set<Item> lineItems = bill.getItems();
			Iterator<Item> lineItemsIter = lineItems.iterator();
			while (lineItemsIter.hasNext()) {
				Item li = lineItemsIter.next();
				double saleValue = computeValueForItem(li.getQuantity(), li.getProduct().getProductCategory(),
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

	private double computeValueForItem(long quantity, Category productCategory, double rate) {
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

	public Bill createBill(Bill bill) {
		return billRepo.save(bill);
	}

	public void deleteBill(Long id) throws Exception {
		verifyBillExists(id);
		billRepo.deleteById(id);
	}

	public List<Bill> getAllBills() {
		return billRepo.findAll();
	}

	public Bill getBillById(Long id) throws Exception {
		verifyBillExists(id);
		return billRepo.findById(id).get();
	}

	private Item getLineItemWithBarCodeId(String barCodeId, Set<Item> currentLineItems) {
		Iterator<Item> iterator = currentLineItems.iterator();
		while (iterator.hasNext()) {
			Item li = iterator.next();
			if (barCodeId.equals(li.getProduct().getBarCodeId())) {
				return li;
			}
		}
		return null;
	}

	private void verifyBillExists(Long id) throws Exception {
		Bill bill = billRepo.findById(id).get();
		if (bill == null) {
			throw new Exception("Bill with id " + id + " not found");
		}
	}

	private Product verifyIfProductExists(String barCodeId) throws Exception {
		List<Product> productsByBarCodeID = productRepo.findByBarCodeId(barCodeId);
		if (null == productsByBarCodeID || productsByBarCodeID.isEmpty()) {
			throw new Exception(
					"Problem with input data: BarCode ID " + barCodeId + " does not exist in Product Master");
		}
		return productsByBarCodeID.get(0);
	}
	
	public Bill updateBill(BillUpdateInfo billUpdateInfo, Long billId) throws Exception {

		if (null == billUpdateInfo) {
			throw new Exception("There is no information to be updated for id " + billId);
		}
		verifyBillExists(billId);

		if (null != billUpdateInfo.getProductsToBeAdded()) {
			List<ProductInfoForBill> prodToBeAdded = billUpdateInfo.getProductsToBeAdded();
			Iterator<ProductInfoForBill> prodToBeAddedIter = prodToBeAdded.iterator();
			while (prodToBeAddedIter.hasNext()) {
				ProductInfoForBill pInfo = prodToBeAddedIter.next();
				addProductToBill(billId, pInfo.getBarCodeId(), pInfo.getQuantity());
			}
		}

		Bill bill = billRepo.findById(billId).get();
		bill.setStatus(billUpdateInfo.getStatus());
		computeTotalValues(bill);
		return bill;
	}

}
