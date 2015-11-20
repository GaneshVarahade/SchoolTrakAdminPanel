package com.fidelit.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fidelit.model.SchoolAdmin;
import com.fidelit.service.AuthenticationService;
import com.fidelit.service.SchoolAdminService;

@Controller
public class DefaultController {

private AuthenticationService authenticationService;
	
@RequestMapping(value="default")
public String defaultUrl(HttpServletRequest req,SecurityContextHolderAwareRequestWrapper request){
	
	HttpSession session = req.getSession();
	
	Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>)    SecurityContextHolder.getContext().getAuthentication().getAuthorities();
//	req.getAuthType();
	String url="";
	String userName = SecurityContextHolder.getContext().getAuthentication().getName();
	

	if(userName != null){
		SchoolAdmin currentUser = authenticationService.authenticateUser(userName);
		session.setAttribute("currentUser", currentUser);
	}
	System.out.println("authorities"+authorities);
	
	
	
	if(authorities.toString().contains("ROLE_ADMIN")){
		 url = "admin_home";
		 
	}else if(authorities.toString().contains("ROLE_PARENT")){
		url = "parent_home";
	}else if(authorities.toString().contains("ROLE_STUDENT")){
		url = "student_home";
	}else{
		url = "schoolAdminHome";
	}
	return url;	
}
}
