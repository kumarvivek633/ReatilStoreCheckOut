package com.retailstore.checkout.data.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.retailstore.checkout.common.Category;
import com.retailstore.checkout.common.Status;
import com.retailstore.checkout.dao.entities.Bill;
import com.retailstore.checkout.dto.BillUpdateInfo;
import com.retailstore.checkout.dto.ProductForBill;
import com.retailstore.checkout.dto.ProductInfo;
import com.retailstore.checkout.service.BillingService;
import com.retailstore.checkout.service.ProductService;

/**
 * The Class DataSetupComponent.
 */
@Component
public class DataSetupComponent implements CommandLineRunner {

	/** The bill service. */
	@Autowired
	private BillingService billService;

	/** The product service. */
	@Autowired
	private ProductService productService;

	/* (non-Javadoc)
	 * @see org.springframework.boot.CommandLineRunner#run(java.lang.String[])
	 */
	@Override
	public void run(String... arg0) throws Exception {
		setUpProductData();
		setupBillData();
	}

	/**
	 * Setup bill data.
	 *
	 */
	public void setupBillData(){

		Bill bill = billService.createBill(new Bill(0.0, 0, Status.IN_PROGRESS));

		Long billId = bill.getId();
		BillUpdateInfo billUpdateInfo = new BillUpdateInfo();
		List<ProductForBill> productsToBeAdded = new ArrayList<>();

		productsToBeAdded.add(new ProductForBill("barcode-1", 2));
		productsToBeAdded.add(new ProductForBill("barcode-2", 3));
		productsToBeAdded.add(new ProductForBill("barcode-3", 4));
		productsToBeAdded.add(new ProductForBill("barcode-4", 3));
		productsToBeAdded.add(new ProductForBill("barcode-5", 2));
		billUpdateInfo.setProductsToBeAdded(productsToBeAdded);
		billUpdateInfo.setStatus(Status.SETTLED);

		billService.updateBill(billUpdateInfo, billId);

	}

	/**
	 * Sets the up product data.
	 *
	 */
	private void setUpProductData()  {
		productService.createProduct(new ProductInfo("barcode-1", 210.0, "Apple", Category.A));
		productService.createProduct(new ProductInfo("barcode-2", 10.0, "Onion", Category.B));
		productService.createProduct(new ProductInfo("barcode-3", 20.0, "Potato", Category.C));
		productService.createProduct(new ProductInfo("barcode-4", 20.0, "Bread", Category.A));
		productService.createProduct(new ProductInfo("barcode-5", 35.0, "Orange", Category.B));
		productService.createProduct(new ProductInfo("barcode-6", 40.0, "Banana", Category.C));
	}
}
