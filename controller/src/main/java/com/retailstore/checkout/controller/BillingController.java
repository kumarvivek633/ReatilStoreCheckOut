package com.retailstore.checkout.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.retailstore.checkout.dao.entities.Bill;
import com.retailstore.checkout.service.BillService;

@RestController
public class BillingController {

	@Autowired
	private BillService billService;

	@PostMapping(value = "/api/bills")
	public Bill createBill(@RequestBody Bill bill) {
		return billService.createBill(bill);
	}

	@DeleteMapping(value = "/api/bills/{id}")
	public HttpStatus deleteBill(@PathVariable Long id) throws Exception {
		billService.deleteBill(id);
		return HttpStatus.OK;
	}

	@GetMapping(value = "/api/bills")
	public List<Bill> getAllBills() {
		return billService.getAllBills();
	}

	@GetMapping(value = "/api/bills/{id}")
	public Bill getBillById(@PathVariable Long id) throws Exception {
		return billService.getBillById(id);
	}
}
