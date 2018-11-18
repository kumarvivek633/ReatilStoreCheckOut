package com.retailstore.checkout.controller;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import java.util.ArrayList;

import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import com.retailstore.checkout.common.Status;
import com.retailstore.checkout.dao.entities.Bill;
import com.retailstore.checkout.service.BillingService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class BillingControllerTest {

	@Mock
	private BillingService billingService;

	@InjectMocks
	private BillingController billingController;

	private MockMvc mockMvc;

	private Bill bill;

	@BeforeClass
	public void setUp() {
		MockitoAnnotations.initMocks(this);
		this.mockMvc = MockMvcBuilders.standaloneSetup(billingController).build();

		// Test object intialization
		bill = new Bill(1d, 1, Status.SETTLED);
	}

	@Test
	public void testGetAllBills() throws Exception {
		when(billingService.getAllBills()).thenReturn(new ArrayList<>());
		mockMvc.perform(get("/api/bills")).andExpect(status().isOk());
	}

	@Test
	public void testGetBillById() throws Exception {
		when(billingService.getBillById(Mockito.anyLong())).thenReturn(bill);
		mockMvc.perform(get("/api/bills/" + 10)).andExpect(status().isOk());
	}

	@Test
	public void testDeleteBill() throws Exception {
		mockMvc.perform(delete("/api/bills/" + 10)).andExpect(status().isOk());
	}

}
