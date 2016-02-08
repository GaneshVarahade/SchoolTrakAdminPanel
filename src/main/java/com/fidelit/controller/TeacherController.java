package com.fidelit.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/Teacher"})
public class TeacherController {
	
	@RequestMapping("/home")
	public String adminHome(){
		
		return "teacher_home";
	}

}
