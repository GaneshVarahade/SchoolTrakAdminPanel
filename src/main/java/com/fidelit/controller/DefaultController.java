package com.fidelit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

@RequestMapping(value="default")
public String defaultUrl(HttpServletRequest req){
	
	String url="";
	if(req.isUserInRole("ROLE_USER")){
		  url = "user";
	}else if(req.isUserInRole("ROLE_ADMIN")){
		  url = "admin_home";
	}else{
		  url = "client";
	}
	return url;	
}
}
