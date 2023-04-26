package com.accountmanager.controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.accountmanager.ExpensePDFExporter;
import com.accountmanager.IncomePDFExporter;
import com.accountmanager.entities.Expense;
import com.accountmanager.entities.ExpenseCategory;
import com.accountmanager.entities.Income;
import com.accountmanager.entities.IncomeCategory;
import com.accountmanager.entities.User;
import com.accountmanager.repository.ExpenseCategoryRepo;
import com.accountmanager.repository.ExpenseRepo;
import com.accountmanager.repository.UserRepo;
import com.lowagie.text.DocumentException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class ExpenseController {

	@Autowired
	private ExpenseRepo rep;
	
	@Autowired
	private ExpenseCategoryRepo erep;
	
	@Autowired
	private UserRepo urep;
	
	@Autowired
	private ExpenseService service;
	
	
	
	@GetMapping(path = "/exp")
	public String add(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
   	 if (session.getAttribute("uid") == null) {
   	        return "login";
   	    } {
		List<ExpenseCategory> categories = erep.findAll();
		model.addAttribute("expenscat", categories);
		int userId = (Integer) request.getSession().getAttribute("uid");
		List<Expense> expenses= rep.findall(userId);
		model.addAttribute("expenses", expenses);
		return "expense";
	}}
	
	@PostMapping("/expense")
	public String income1(HttpServletRequest request, Model model) {
		int a =Integer.parseInt(request.getParameter("id"));
	   ExpenseCategory ec = erep.findById(a).get();
	    model.addAttribute("a",ec);
		return add(model, request);
	}
	
	@PostMapping("/addexpense")
	public String addExpense(HttpServletRequest request, Model model) {
		 HttpSession session = request.getSession(); 
		  Date dt = Date.valueOf(request.getParameter("date")) ;	  
		  String nm = request.getParameter("name"); 
		  String dsc = request.getParameter("desc"); 
		  double a = Double.parseDouble(request.getParameter("amount")); 
		  String md = request.getParameter("mode"); 
		  String txn = request.getParameter("transactionId"); 
		  int cid = Integer.parseInt( request.getParameter("id"));
		  ExpenseCategory ic = erep.findById(cid).get();
		  int usrid = (Integer)session.getAttribute("uid");
		  User usr = urep.findById(usrid).get();
		 Expense expense =new  Expense(dt, nm, dsc, a, md, txn, usr, ic); 
		  rep.save(expense);
		    
		  return "home";
		  				
	}
	
	//SHOW ALL
	
	@GetMapping(path = "/showallexp")
	public String showAll(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
   	 if (session.getAttribute("uid") == null) {
   	        return "login";
   	    }{
   	    	int userId = (Integer) request.getSession().getAttribute("uid");
		List<Expense> expenses= rep.findall(userId);
		model.addAttribute("expenses", expenses);
		return "showexpense";
	}}
	
	//FOR UPDATE EXPENSE

	  @GetMapping(path="updateexp2")
	  public String updateexp1(Model model, HttpServletRequest request) {
		  HttpSession session = request.getSession();
	    	 if (session.getAttribute("uid") == null) {
	    	        return "login";
	    	    }{
	    	int userId = (Integer) request.getSession().getAttribute("uid");
			List<Expense> incomes= rep.findall(userId);
			model.addAttribute("incomes", incomes);
			return "updateexpense";
	  }}
	    
	  @PostMapping(path="/expe")
		public String in(Model model, HttpServletRequest request) {
			int a =Integer.parseInt(request.getParameter("id"));
		   Expense i = rep.findById(a).get();
		    model.addAttribute("a",i);
		 
			return updateexp1(model, request);
		}
		
		@Transactional
		@PostMapping(path="/expe2")
		public String in2(HttpServletRequest request, Model model) {
			int s = Integer.parseInt(request.getParameter("id"));
			Expense inc =  rep.findById(s).get();
			inc.setDate(Date.valueOf(request.getParameter("date")));
			inc.setName(request.getParameter("name"));
			inc.setDescription(request.getParameter("description"));
			inc.setAmount(Double.parseDouble(request.getParameter("amount")));
			inc.setMode(request.getParameter("mode"));
			inc.setTransactionId(request.getParameter("transactionId"));
		    rep.save(inc);
			
		    return updateexp1(model, request);
		}
		
		//DELETE
								
				@PostMapping("/deleteExpense")
				public String deleteIncome(HttpServletRequest request) {
					
				   rep.deleteById(Integer.parseInt(request.getParameter("expenseId")));
				    return "redirect:/delete";
				}
		
		
		//FOR PDF EXPORT

		 @PostMapping("/expenses/export/pdf")
		    public void exportToPDF(HttpServletResponse response, HttpServletRequest request) throws DocumentException, IOException {
		        response.setContentType("application/pdf");
		        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		        String currentDateTime = dateFormatter.format(new java.util.Date());
		         
		        String headerKey = "Content-Disposition";
		        String headerValue = "attachment; filename=expense_" + currentDateTime + ".pdf";
		        response.setHeader(headerKey, headerValue);
		         
		        List<Expense> listExpenses = service.listAll(request); 
		         
		        ExpensePDFExporter exporter = new ExpensePDFExporter(listExpenses);
		        exporter.export(response);
		         
		    }
		 
		 @PostMapping("/expenseDate")
		 public void exportToPDFDateWise(HttpServletResponse response, HttpServletRequest request) throws DocumentException, IOException {
		        response.setContentType("application/pdf");
		        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		        String currentDateTime = dateFormatter.format(new java.util.Date());
		         
		        String headerKey = "Content-Disposition";
		        String headerValue = "attachment; filename=expense_date_wise_" + currentDateTime + ".pdf";
		        response.setHeader(headerKey, headerValue);
		         
		        List<Expense> listExpensesByDate = service.datewiselist(request);
		         
		        ExpensePDFExporter exporter = new ExpensePDFExporter(listExpensesByDate);
		        exporter.export(response);
		         
		    }
		 @PostMapping("/expensecategory")
		 public void exportToPDFCategoryWise(HttpServletResponse response, HttpServletRequest request) throws DocumentException, IOException {
		        response.setContentType("application/pdf");
		        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		        String currentDateTime = dateFormatter.format(new java.util.Date());
		         
		        String headerKey = "Content-Disposition";
		        String headerValue = "attachment; filename=expense_category_wise_" + currentDateTime + ".pdf";
		        response.setHeader(headerKey, headerValue);
		         
		        List<Expense> listExpensesByDate = service.categorywiselist(request);
		         
		        ExpensePDFExporter exporter = new ExpensePDFExporter(listExpensesByDate);
		        exporter.export(response);
		         
		    }

}
