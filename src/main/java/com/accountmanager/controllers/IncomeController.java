package com.accountmanager.controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.accountmanager.IncomePDFExporter;
import com.accountmanager.entities.Expense;
import com.accountmanager.entities.ExpenseCategory;
import com.accountmanager.entities.Income;
import com.accountmanager.entities.IncomeCategory;
import com.accountmanager.entities.User;
import com.accountmanager.repository.ExpenseCategoryRepo;
import com.accountmanager.repository.ExpenseRepo;
import com.accountmanager.repository.IncomeCategoryRepo;
import com.accountmanager.repository.IncomeRepo;
import com.accountmanager.repository.UserRepo;
import com.lowagie.text.DocumentException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class IncomeController {

	@Autowired
	private IncomeRepo rep;

	@Autowired
	private UserRepo urep;
	
	@Autowired
	private IncomeCategoryRepo irep;
	
	@Autowired
	private IncomeService service;
	
	@Autowired
	private ExpenseRepo erep;
	
	@Autowired
	private ExpenseCategoryRepo ecat;

	@GetMapping(path = "/inc")
	public String add(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
   	 if (session.getAttribute("uid") == null) {
   	        return "login";
   	    }{
		List<IncomeCategory> categories = irep.findAll();
		model.addAttribute("incomecat", categories);
		int userId = (Integer) request.getSession().getAttribute("uid");
		List<Income> incomes= rep.findall(userId);
		model.addAttribute("incomes", incomes);
		return "income";
	}}
	
	@PostMapping("/income")
	public String income1(HttpServletRequest request, Model model) {
		int a =Integer.parseInt(request.getParameter("id"));
	   IncomeCategory ec = irep.findById(a).get();
	    model.addAttribute("a",ec);
		return add(model, request);
	}
	
	  @PostMapping("/addincome") 
	  public String addIncome(HttpServletRequest request, Model model) {
	  HttpSession session = request.getSession(); 
	  Date dt = Date.valueOf(request.getParameter("date")) ;  
	  String nm = request.getParameter("name"); 
	  String dsc = request.getParameter("desc"); 
	  double a = Double.parseDouble(request.getParameter("amount")); 
	  String md = request.getParameter("mode"); 
	  String txn = request.getParameter("transactionId"); 
	  int cid = Integer.parseInt( request.getParameter("id"));
	  IncomeCategory ic = irep.findById(cid).get();
	  int usrid = (Integer)session.getAttribute("uid");
	  User usr = urep.findById(usrid).get();
	  Income income =new  Income(dt, nm, dsc, a, md, txn, usr, ic); 
	  rep.save(income);
	    
	  return "home";
	  
	  }
	  
	  //SHOW ALL
	  
	  @GetMapping(path = "/showallinc")
		public String showAll(Model model, HttpServletRequest request) {
		  HttpSession session = request.getSession();
	    	 if (session.getAttribute("uid") == null) {
	    	        return "login";
	    	    }{
	    	int userId = (Integer) request.getSession().getAttribute("uid");
			List<Income> incomes= rep.findall(userId);
			model.addAttribute("incomes", incomes);
			return "showincome";
		}}
	  
	  //FOR UPDATE INCOME
	  @GetMapping(path="get")
	  public String get(Model model, HttpServletRequest request) {
		  HttpSession session = request.getSession();
	    	 if (session.getAttribute("uid") == null) {
	    	        return "login";
	    	    }{
	    	int userId = (Integer) request.getSession().getAttribute("uid");
			List<Income> incomes= rep.findall(userId);
			model.addAttribute("incomes", incomes);
			return "updateincome";
	  }}
	    
	  @PostMapping(path="/lmn")
		public String in(Model model, HttpServletRequest request) {
			int a =Integer.parseInt(request.getParameter("id"));
		   Income i = rep.findById(a).get();
		    model.addAttribute("a",i);
		 
			return get(model, request);
		}
		
		@Transactional
		@PostMapping(path="/lmn2")
		public String in2(HttpServletRequest request, Model model) {
			int s = Integer.parseInt(request.getParameter("id"));
			Income inc =  rep.findById(s).get();
			inc.setDate(Date.valueOf(request.getParameter("date")));
			inc.setName(request.getParameter("name"));
			inc.setDescription(request.getParameter("description"));
			inc.setAmount(Double.parseDouble(request.getParameter("amount")));
			inc.setMode(request.getParameter("mode"));
			inc.setTransactionId(request.getParameter("transactionId"));
		    rep.save(inc);
			
		    return get(model, request);
		}
		
		//REPORT GENERATION
		@GetMapping(path="report")
		 public String getReportPage(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession();
	    	 if (session.getAttribute("uid") == null) {
	    	        return "login";
	    	    }{
	    	    	List<IncomeCategory> categories = irep.findAll();
	    			model.addAttribute("incomes", categories);
	    			List<ExpenseCategory> categories1 = ecat.findAll();
	    			model.addAttribute("expenses", categories1);
			 return "report";
		 }}
		 
		//DELETE
		@GetMapping("/delete")
		public String dIncome(HttpServletRequest request, Model model) {   
			int userId = (Integer) request.getSession().getAttribute("uid");
			List<Income> incomes= rep.findall(userId);
			model.addAttribute("incomes", incomes);
			List<Expense> expenses= erep.findall(userId);
			model.addAttribute("expenses", expenses);
			    return "delete";
			}
		
		@PostMapping("/deleteIncome")
		public String deleteIncome(HttpServletRequest request) {
			
		   rep.deleteById(Integer.parseInt(request.getParameter("incomeId")));
		    return "redirect:/delete";
		}


	      //PDF EXPORT
		 //GENERAL
		 @PostMapping("/incomes/export/pdf")
		    public void exportToPDF(HttpServletResponse response, HttpServletRequest request) throws DocumentException, IOException {
		        response.setContentType("application/pdf");
		        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		        String currentDateTime = dateFormatter.format(new java.util.Date());
		         
		        String headerKey = "Content-Disposition";
		        String headerValue = "attachment; filename=income_" + currentDateTime + ".pdf";
		        response.setHeader(headerKey, headerValue);
		         
		        List<Income> listIncomes = service.listAll(request); 
		         
		        IncomePDFExporter exporter = new IncomePDFExporter(listIncomes);
		        exporter.export(response);
		         
		    }
		 
		 @PostMapping("/incomeDate")
		 public void exportToPDFDateWise(HttpServletResponse response, HttpServletRequest request) throws DocumentException, IOException {
		        response.setContentType("application/pdf");
		        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		        String currentDateTime = dateFormatter.format(new java.util.Date());
		         
		        String headerKey = "Content-Disposition";
		        String headerValue = "attachment; filename=income_by_date_" + currentDateTime + ".pdf";
		        response.setHeader(headerKey, headerValue);
		         
		        List<Income> listIncomesByDate = service.datewiselist(request);
		         
		        IncomePDFExporter exporter = new IncomePDFExporter(listIncomesByDate);
		        exporter.export(response);
		 }
		 
		 @PostMapping("/categoryreport")
		 public void exportToPDFCategoryWise(HttpServletResponse response, HttpServletRequest request) throws DocumentException, IOException {
		        response.setContentType("application/pdf");
		        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		        String currentDateTime = dateFormatter.format(new java.util.Date());
		         
		        String headerKey = "Content-Disposition";
		        String headerValue = "attachment; filename=income_by_category_" + currentDateTime + ".pdf";
		        response.setHeader(headerKey, headerValue);
		         
		        List<Income> listIncomesByCategory = service.categorywiselist(request);
		         
		        IncomePDFExporter exporter = new IncomePDFExporter(listIncomesByCategory);
		        exporter.export(response);
		 }
		
	 }
