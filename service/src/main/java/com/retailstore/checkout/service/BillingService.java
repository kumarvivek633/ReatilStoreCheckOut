package com.retailstore.checkout.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.retailstore.checkout.dao.entities.Bill;
import com.retailstore.checkout.dto.BillUpdateInfo;

/**
 * The Interface BillService.
 */
@Service
public interface BillingService {

	/**
	 * Creates the bill.
	 *
	 * @param bill the bill
	 * @return the bill
	 */
	public Bill createBill(Bill bill);

	/**
	 * Delete bill.
	 *
	 * @param id the id
	 */
	public void deleteBill(Long id);

	/**
	 * Gets the all bills.
	 *
	 * @return the all bills
	 */
	public List<Bill> getAllBills();

	/**
	 * Gets the bill by id.
	 *
	 * @param id the id
	 * @return the bill by id
	 */
	public Bill getBillById(Long id);

	/**
	 * Update bill.
	 *
	 * @param billUpdateInfo the bill update info
	 * @param billId the bill id
	 * @return the bill
	 */
	public Bill updateBill(BillUpdateInfo billUpdateInfo, Long billId);

}
