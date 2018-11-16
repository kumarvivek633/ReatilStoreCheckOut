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
import com.retailstore.checkout.service.BillingService;

/**
 * The Class BillingController.
 */
@RestController
public class BillingController {

	/** The bill service. */
	@Autowired
	private BillingService billService;

	/**
	 * Creates the bill.
	 *
	 * @param bill the bill
	 * @return the bill
	 */
	@PostMapping(value = "/api/bills")
	public Bill createBill(@RequestBody Bill bill) {
		return billService.createBill(bill);
	}

	/**
	 * Delete bill.
	 *
	 * @param id the id
	 * @return the http status
	 * @throws Exception the exception
	 */
	@DeleteMapping(value = "/api/bills/{id}")
	public HttpStatus deleteBill(@PathVariable Long id) throws Exception {
		billService.deleteBill(id);
		return HttpStatus.OK;
	}

	/**
	 * Gets the all bills.
	 *
	 * @return the all bills
	 */
	@GetMapping(value = "/api/bills")
	public List<Bill> getAllBills() {
		return billService.getAllBills();
	}

	/**
	 * Gets the bill by id.
	 *
	 * @param id the id
	 * @return the bill by id
	 * @throws Exception the exception
	 */
	@GetMapping(value = "/api/bills/{id}")
	public Bill getBillById(@PathVariable Long id) throws Exception {
		return billService.getBillById(id);
	}
}
