package com.retailstore.checkout.dao.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.retailstore.checkout.dao.entities.Item;

/**
 * The Interface ItemRepository.
 */
public interface ItemRepository extends JpaRepository<Item, Long> {
	
}
