package com.accountmanager.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.accountmanager.entities.User;
import com.accountmanager.repository.UserRepo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserRepo rep;

	@GetMapping("/login")
	private String getPage() {
		return "login";
	}

	@PostMapping("/save")
	private String loginPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String username = request.getParameter("unm");
		String password = request.getParameter("pass");
		if (rep.findUsernameAndPassword(username, password) != null) {
			//model.addAttribute("success", "Login Successfull");
			String message = "Login successful!";
			String script = "<script>alert('" + message + "');</script>";
			model.addAttribute("message", script);
			session.setAttribute("uid", rep.findUsernameAndPassword(username, password).getId());
			 session.setAttribute("uname", rep.findUsernameAndPassword(username,  password).getUsername());
			 
			
			return "home";
		}else {
			model.addAttribute("error", "Invalid username or password");
			return "login";
		}

	}

	// FOR REGISTRATION,

	@GetMapping("/register")
	public String registerForm() {
		return "registration";
	}

	@PostMapping("/register")
	public String registerUser(HttpServletRequest request) {
		String username = request.getParameter("unm");
		String password = request.getParameter("pass");
		User user = new User(username, password);
		rep.save(user);
		return "login";
	}
	
	

}
