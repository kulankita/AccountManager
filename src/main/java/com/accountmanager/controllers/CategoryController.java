package com.accountmanager.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.accountmanager.entities.Expense;
import com.accountmanager.entities.ExpenseCategory;
import com.accountmanager.entities.Income;
import com.accountmanager.entities.IncomeCategory;
import com.accountmanager.repository.ExpenseCategoryRepo;
import com.accountmanager.repository.IncomeCategoryRepo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;

@Controller
public class CategoryController {
	
	@Autowired
	private IncomeCategoryRepo inc;
	
	@Autowired
	private ExpenseCategoryRepo exp;
	
	
	
	//FOR INCOME CATEGORY

	@GetMapping("/addcat")
	public String getPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
   	 if (session.getAttribute("uid") == null) {
   	        return "login";
   	    }
   	 {
   		List<IncomeCategory> incomes= inc.findAll();
		model.addAttribute("incomeCat", incomes);
		List<ExpenseCategory> expenses= exp.findAll();
		model.addAttribute("expenseCat1", expenses);
		return "addcategory";
   	 }
	}
	
	@PostMapping("/incomecat")
	public String addIncomeCat(HttpServletRequest request, Model model) {
		String nm = request.getParameter("iname");
		String d = request.getParameter("idesc");
		IncomeCategory ic = new IncomeCategory(nm,d);
		model.addAttribute("name",nm);
		inc.save(ic);
		return "home";
	}
	
	
	//FOR EXPENSE CATEGORY
	
	@GetMapping("/add")
	public String getPage2(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
   	 if (session.getAttribute("uid") == null) {
   	        return "login";
   	    }
   	 {
   		List<ExpenseCategory> expenses= exp.findAll();
		model.addAttribute("expenseCat1", expenses);
		return "addcategory";
   	 }
   	 }
	
	@PostMapping("/expensecat")
	public String addExpenseCat(HttpServletRequest request, Model model) {
		String nam = request.getParameter("ename");
		String ds = request.getParameter("edesc");
		ExpenseCategory ec = new ExpenseCategory(nam, ds);
		model.addAttribute("name2",nam);
		exp.save(ec);
		return "home";
	}
	
	//FOR UPDATE INCOME CAT
	@GetMapping(path = "/updateinc")
	public String add(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
   	 if (session.getAttribute("uid") == null) {
   	        return "login";
   	    } {
		List<IncomeCategory> categories = inc.findAll();
		model.addAttribute("categories", categories);
		return "updateincomecategory";
   	    }
	}
	
	@PostMapping(path="/abc")
	public String mm(Model model, HttpServletRequest request) {
		int a =Integer.parseInt(request.getParameter("category"));
	    IncomeCategory ic = inc.findById(a).get();
	    model.addAttribute("i",ic);
	 
		return add(model, request);
	}
	
	@Transactional
	@PostMapping(path="/nd")
	public String nd(HttpServletRequest request, Model model) {
		int s = Integer.parseInt(request.getParameter("id"));
		IncomeCategory cat =  inc.findById(s).get();
		cat.setName(request.getParameter("newname"));
		cat.setDescription(request.getParameter("newdesc"));
	    inc.save(cat);
		
	    return add(model, request);
	}
	
	//FOR UPDATE EXPENSE CAT
	@GetMapping(path = "/updateexp")
	public String add2(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
   	 if (session.getAttribute("uid") == null) {
   	        return "login";
   	    } {
		List<ExpenseCategory> categories = exp.findAll();
		model.addAttribute("categories", categories);
		return "updateexpensecategory";
	}}
	
	@PostMapping(path="/pqr")
	public String mm2(Model model, HttpServletRequest request) {
		int a =Integer.parseInt(request.getParameter("category"));
	    ExpenseCategory ec = exp.findById(a).get();
	    model.addAttribute("i",ec);
	 
		return add2(model, request);
	}
	
	@Transactional
	@PostMapping(path="/nd2")
	public String nd2(HttpServletRequest request, Model model) {
		int s = Integer.parseInt(request.getParameter("id"));
		ExpenseCategory cat =  exp.findById(s).get();
		cat.setName(request.getParameter("newname"));
		cat.setDescription(request.getParameter("newdesc"));
	    exp.save(cat);
		
	    return add2(model, request);
	}
	

	//DELETE
			@GetMapping("/deletecategory")
			public String dIncome(HttpServletRequest request, Model model) {   
				/* int userId = (Integer) request.getSession().getAttribute("uid"); */
				List<IncomeCategory> incomes= inc.findAll();
				model.addAttribute("incomeCat", incomes);
				List<ExpenseCategory> expenses= exp.findAll();
				model.addAttribute("expenseCat", expenses);
				    return "deletecategory";
				}
			
			@PostMapping("/deleteIncomeCat")
			public String deleteCategory(HttpServletRequest request) {
			   inc.deleteById(Integer.parseInt(request.getParameter("incomeCId")));
			    return "redirect:/deletecategory";
			}

			
			@PostMapping("/deleteExpenseCat")
			public String deleteExpCat(HttpServletRequest request) {
				
			   exp.deleteById(Integer.parseInt(request.getParameter("expenseCId")));
			    return "redirect:/deletecategory";
			}

}
