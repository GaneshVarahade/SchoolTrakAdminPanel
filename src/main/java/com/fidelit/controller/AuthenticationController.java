package com.fidelit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fidelit.model.Account;
import com.fidelit.service.AuthenticationService;

@Controller
@RequestMapping("/loginAuth")
public class AuthenticationController {

	@Autowired
    AuthenticationService authenticationService;
    
	@RequestMapping("/authenticate")
	public String authenticate(@RequestParam("account") String accountId,@RequestParam("username") String username,@RequestParam("password") String password,ModelMap model){
		
		Account account = authenticationService.authenticateUser(username, password,accountId);
		
		if(account.getAccountId().equals("admin")){
			return "admin_home";
		    
		}else if(account.getAccountId().equals("schoolAdmin")){
			return "admin_home";
			
		}else if(account.getAccountId().equals("parent")){
			return "admin_home";
			
		}else if(account.getAccountId().equals("child")){
			return "admin_home";
		}else{
			model.addAttribute("message", "Login Failed !");
			return "login";	
		}
		
		
	}
}
