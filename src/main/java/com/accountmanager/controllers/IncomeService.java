package com.accountmanager.controllers;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.accountmanager.entities.Income;
import com.accountmanager.entities.IncomeCategory;
import com.accountmanager.repository.IncomeCategoryRepo;
import com.accountmanager.repository.IncomeRepo;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class IncomeService {

    @Autowired
    private IncomeRepo incomeRepository;
    
    @Autowired
    private IncomeCategoryRepo irep;


    
    public List<Income> listAll(HttpServletRequest request) {
    	int userId = (Integer) request.getSession().getAttribute("uid");
        return incomeRepository.findallincome(userId);
    }
    

    public List<Income> datewiselist(HttpServletRequest request){
    	int userId = (Integer) request.getSession().getAttribute("uid");
    	Date startDate = Date.valueOf(request.getParameter("startDate"));
    	Date endDate = Date.valueOf(request.getParameter("endDate"));
    	return incomeRepository.findAllIncomeByDateRange(userId, startDate, endDate);
    }

    
    public List<Income> categorywiselist(HttpServletRequest request){
        int userId = (Integer) request.getSession().getAttribute("uid");
     
        int categoryId =Integer.parseInt(request.getParameter("category"));
        IncomeCategory category = irep.findById(categoryId).get();
        Date startDate = Date.valueOf(request.getParameter("startDate"));
    	Date endDate = Date.valueOf(request.getParameter("endDate"));
      //  IncomeCategory category = request.getParameter("category");
        return incomeRepository.findIncomeByUserAndCategoryAndDate(userId, category, startDate, endDate);
    }

    
   
}