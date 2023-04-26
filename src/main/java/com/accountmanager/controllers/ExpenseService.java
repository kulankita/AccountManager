package com.accountmanager.controllers;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.accountmanager.entities.Expense;
import com.accountmanager.entities.ExpenseCategory;
import com.accountmanager.entities.Income;
import com.accountmanager.entities.IncomeCategory;
import com.accountmanager.repository.ExpenseCategoryRepo;
import com.accountmanager.repository.ExpenseRepo;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class ExpenseService {

	@Autowired
	private ExpenseRepo rep;
	
	@Autowired
	private ExpenseCategoryRepo erep;
	
	 public List<Expense> listAll(HttpServletRequest request) {
		 int userId = (Integer) request.getSession().getAttribute("uid");
	        return rep.findallexpense(userId);
	    }
	 
	 public List<Expense> datewiselist(HttpServletRequest request){
	    	int userId = (Integer) request.getSession().getAttribute("uid");
	    	Date startDate = Date.valueOf(request.getParameter("startDate"));
	    	Date endDate = Date.valueOf(request.getParameter("endDate"));
	    	return rep.findAllExpenseByDateRange(userId, startDate, endDate);
	    }
	 
	  public List<Expense> categorywiselist(HttpServletRequest request){
	        int userId = (Integer) request.getSession().getAttribute("uid");
	     
	        int categoryId =Integer.parseInt(request.getParameter("category"));
	        ExpenseCategory category = erep.findById(categoryId).get();
	        Date startDate = Date.valueOf(request.getParameter("startDate"));
	    	Date endDate = Date.valueOf(request.getParameter("endDate"));
	      //  IncomeCategory category = request.getParameter("category");
	        return rep.findExpenseByUserAndCategoryAndDate(userId, category, startDate, endDate);
	    }
}
