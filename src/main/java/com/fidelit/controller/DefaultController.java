package com.fidelit.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

@RequestMapping(value="default")
public String defaultUrl(HttpServletRequest req,SecurityContextHolderAwareRequestWrapper request){
	
	Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>)    SecurityContextHolder.getContext().getAuthentication().getAuthorities();
//	req.getAuthType();
	String url="";
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
