package com.retailstore.checkout.data.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.retailstore.checkout.dao.entities.Bill;
import com.retailstore.checkout.dao.util.Status;
import com.retailstore.checkout.dao.util.Category;
import com.retailstore.checkout.dto.BillUpdateInfo;
import com.retailstore.checkout.dto.ProductInfo;
import com.retailstore.checkout.dto.ProductInfoForBill;
import com.retailstore.checkout.service.BillService;
import com.retailstore.checkout.service.ProductService;

@Component
public class DataSetupComponent implements CommandLineRunner {

	@Autowired
	private BillService billService;

	@Autowired
	private ProductService productService;

	@Override
	public void run(String... arg0) throws Exception {
		setUpProductData();
		setupBillData();
	}

	public void setupBillData() throws Exception {

		Bill o1 = billService.createBill(new Bill(0.0, 0, Status.IN_PROGRESS));

		Long billId = o1.getId();
		BillUpdateInfo billUpdateInfo = new BillUpdateInfo();
		List<ProductInfoForBill> productsToBeAdded = new ArrayList<>();

		productsToBeAdded.add(new ProductInfoForBill("barcode-1", 2));
		productsToBeAdded.add(new ProductInfoForBill("barcode-2", 3));
		productsToBeAdded.add(new ProductInfoForBill("barcode-3", 4));
		productsToBeAdded.add(new ProductInfoForBill("barcode-4", 3));
		productsToBeAdded.add(new ProductInfoForBill("barcode-5", 2));
		billUpdateInfo.setProductsToBeAdded(productsToBeAdded);
		billUpdateInfo.setStatus(Status.SETTLED);

		billService.updateBill(billUpdateInfo, billId);

	}

	private void setUpProductData() throws Exception {
		productService.createProduct(new ProductInfo("barcode-1", 210.0, "Apple", Category.A));
		productService.createProduct(new ProductInfo("barcode-2", 10.0, "Onion", Category.B));
		productService.createProduct(new ProductInfo("barcode-3", 20.0, "Potato", Category.C));
		productService.createProduct(new ProductInfo("barcode-4", 20.0, "Bread", Category.A));
		productService.createProduct(new ProductInfo("barcode-5", 35.0, "Orange", Category.B));
		productService.createProduct(new ProductInfo("barcode-6", 40.0, "Banana", Category.C));
	}
}
