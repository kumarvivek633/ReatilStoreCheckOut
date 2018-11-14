package com.retailstore.checkout.dao.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.retailstore.checkout.dao.entities.Bill;

public interface BillRepository extends JpaRepository<Bill, Long> {

}
