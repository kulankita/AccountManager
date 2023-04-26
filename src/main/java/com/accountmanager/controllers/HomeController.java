package com.accountmanager.controllers;

import java.util.Enumeration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.accountmanager.repository.ExpenseRepo;
import com.accountmanager.repository.IncomeRepo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	private IncomeRepo irep;

	@Autowired
	private ExpenseRepo erep;
	
	@GetMapping("/menu")
	public String getPage() {
		return "menubar";
	}
	
    @GetMapping("/home")
	public String getPage2(Model model, HttpServletRequest request) {
    	HttpSession session = request.getSession();
    	 if (session.getAttribute("uid") == null) {
    	        return "login";
    	    }
    	 {
		return "home";
    	 }
	}
    
    @PostMapping("/getbalance")
	public String home(Model model, HttpServletRequest request) {
    	int userId = (Integer) request.getSession().getAttribute("uid");

    	Double totalIncomeAmount = 0.0;
    	if(totalIncomeAmount != null) {
         totalIncomeAmount = irep.getTotalIncomeForUser(userId);
    	}
        Double totalExpenseAmount = erep.getTotalExpenseForUser(userId);
        Double balance = 0.0;
        if( totalIncomeAmount == null || totalExpenseAmount == null) {
         balance = 0.0;
        }else if (totalExpenseAmount != null && totalIncomeAmount != null) {
        	if(totalIncomeAmount < totalExpenseAmount) {
        		balance = 0.0;
        	}else {
        	balance = totalIncomeAmount - totalExpenseAmount;
        	}
        } 
        Double debt = 0.0;
        if(totalIncomeAmount == null  ) {
        	debt =totalExpenseAmount;
        }else if (totalExpenseAmount != null && totalIncomeAmount < totalExpenseAmount) {
        	debt = totalExpenseAmount - totalIncomeAmount;
        }else {
        	debt=0.0;
        }
        
        model.addAttribute("totalIncomeAmount", totalIncomeAmount);
        model.addAttribute("totalExpenseAmount", totalExpenseAmount);
        model.addAttribute("balance", balance);
        model.addAttribute("debt",debt);
        
		/*
		 * if(totalIncomeAmount == null) { model.addAttribute("totalIncomeAmount", 0.0);
		 * } else { model.addAttribute("totalIncomeAmount", totalIncomeAmount); }
		 * 
		 * if (totalExpenseAmount == null) { model.addAttribute("totalExpenseAmount",
		 * 0.0); } else { model.addAttribute("totalExpenseAmount", totalExpenseAmount);
		 * }
		 * 
		 * if(balance == null) { model.addAttribute("balance", 0.0); }else {
		 * model.addAttribute("balance", balance); }
		 */
       // System.out.println(totalIncomeAmount + totalExpenseAmount + balance);
       

        return getPage2(model, request);
	}
    
  //LOGOUT
  	@GetMapping("/logout")
      public String logout(HttpServletRequest request, HttpServletResponse response) {
          // Invalidate the session and redirect the user to the login page
          request.getSession().invalidate();
          return "redirect:/login?logout";
      }
	
	/*
	 * @PostMapping(path = "/balance") public String home3(Model model) { return
	 * home(model); }
	 */
}
