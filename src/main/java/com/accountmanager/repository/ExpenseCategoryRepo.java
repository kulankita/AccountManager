package com.accountmanager.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.accountmanager.entities.ExpenseCategory;

@Repository
public interface ExpenseCategoryRepo extends JpaRepository<ExpenseCategory, Integer>{
	
	@Query("SELECT e FROM ExpenseCategory e WHERE e.id = :userId")
	public List<ExpenseCategory> findall(@Param("userId") int userId);

}
