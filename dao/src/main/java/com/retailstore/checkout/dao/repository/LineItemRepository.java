package com.retailstore.checkout.dao.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.retailstore.checkout.dao.entities.Item;

public interface LineItemRepository extends JpaRepository<Item, Long> {
	
	public List<Item> findByProduct_id(long prodId);

}
