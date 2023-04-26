package com.accountmanager.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.accountmanager.entities.Expense;
import com.accountmanager.entities.ExpenseCategory;
import com.accountmanager.entities.Income;
import com.accountmanager.entities.IncomeCategory;
@Repository
public interface ExpenseRepo extends JpaRepository<Expense, Integer>{
	
	public  List<Expense> findAll();
	
	@Query("SELECT e FROM Expense e WHERE e.user.id= :userId")
    public List<Expense> findallexpense(@Param("userId") int userId);
	
	@Query("SELECT e FROM Expense e WHERE e.user.id = :userId")
	public List<Expense> findall(@Param("userId") int userId);
	
	@Query("SELECT SUM(e.amount) FROM Expense e WHERE e.user.id = :userId")
	Double getTotalExpenseForUser(@Param("userId") int userId);
	
	@Query("SELECT e FROM Expense e WHERE e.user.id = :userId AND e.date BETWEEN :startDate AND :endDate")
	public List<Expense> findAllExpenseByDateRange(@Param("userId") int userId, @Param("startDate") Date startDate, @Param("endDate") Date endDate);

	@Query("SELECT i FROM Expense i WHERE i.user.id = :userId AND i.expenseCategory = :category AND i.date BETWEEN :startDate AND :endDate")
	List<Expense> findExpenseByUserAndCategoryAndDate(@Param("userId") int userId, @Param("category") ExpenseCategory category, @Param("startDate") Date startDate, @Param("endDate") Date endDate);


}
