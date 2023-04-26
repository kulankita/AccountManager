package com.accountmanager.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.accountmanager.entities.Income;
import com.accountmanager.entities.IncomeCategory;

@Repository
public interface IncomeRepo extends JpaRepository<Income, Integer> {
	
	@Query("SELECT i FROM Income i WHERE i.user.id= :userId")
     public List<Income> findallincome(@Param("userId") int userId);
	
	@Query("SELECT i FROM Income i WHERE i.user.id = :userId")
	public List<Income> findall(@Param("userId") int userId);
	
	@Query("SELECT SUM(i.amount) FROM Income i WHERE i.user.id = :userId")
	Double getTotalIncomeForUser(@Param("userId") int userId);
	
	@Query("SELECT i FROM Income i WHERE i.user.id = :userId AND i.date BETWEEN :startDate AND :endDate")
	public List<Income> findAllIncomeByDateRange(@Param("userId") int userId, @Param("startDate") Date startDate, @Param("endDate") Date endDate);
	
	
	/*
	 * @Query("SELECT i FROM Income i WHERE i.user.id = :userId AND i.incomeCategory = :category"
	 * ) List<Income> findIncomeByCategory(@Param("userId") int
	 * userId, @Param("category") IncomeCategory category);
	 */
	 

	@Query("SELECT i FROM Income i WHERE i.user.id = :userId AND i.incomeCategory = :category AND i.date BETWEEN :startDate AND :endDate")
	List<Income> findIncomeByUserAndCategoryAndDate(@Param("userId") int userId, @Param("category") IncomeCategory category, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

	
}
