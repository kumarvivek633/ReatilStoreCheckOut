package com.retailstore.checkout.service.impl;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import com.retailstore.checkout.dao.entities.Bill;
import com.retailstore.checkout.dao.repository.BillingRepository;


public class BillingServiceImpTest {

	@InjectMocks
	BillingServiceImpl billingService;

	@Mock
	BillingRepository billingRepository;

	@BeforeMethod
	public void init() {
		MockitoAnnotations.initMocks(this);
	}

	@Test
	public void createBill() {
		billingService.createBill(new Bill());
	}
}
