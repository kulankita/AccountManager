package com.accountmanager.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.accountmanager.entities.ExpenseCategory;
import com.accountmanager.entities.IncomeCategory;

@Repository
public interface IncomeCategoryRepo extends JpaRepository<IncomeCategory, Integer> {

	
	public IncomeCategory findByName(String name);
	
	@Query("SELECT i FROM IncomeCategory i WHERE i.id = :userId")
	public List<IncomeCategory> findall(@Param("userId") int userId);
	
	/*
	 * @Modifying
	 * 
	 * @Query("DELETE FROM IncomeCategory ic WHERE ic.id = :categoryId") void
	 * deleteIncomeCategoryById(@Param("categoryId") int categoryId);
	 */

	
}
