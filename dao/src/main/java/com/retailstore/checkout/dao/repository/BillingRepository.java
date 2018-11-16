package com.retailstore.checkout.dao.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.retailstore.checkout.dao.entities.Bill;

/**
 * The Interface BillingRepository.
 */
public interface BillingRepository extends JpaRepository<Bill, Long> {

}
