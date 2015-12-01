package com.fidelit.controller;

import java.util.ArrayList;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Filters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fidelit.model.Employee;
import com.fidelit.model.Holidays;
import com.fidelit.model.LeavesApplied;
import com.fidelit.model.Route;
import com.fidelit.model.School;
import com.fidelit.model.SchoolAdmin;
import com.fidelit.model.SuperVisor;
import com.fidelit.model.empLeavesTaken;
import com.fidelit.service.EmployeeService;
import com.fidelit.service.GtsService;
import com.fidelit.service.HolidayService;
import com.fidelit.service.LeaveService;
import com.fidelit.service.RouteService;
import com.fidelit.service.SchoolAdminService;
import com.fidelit.service.SchoolService;
import com.fidelit.service.UserService;


@Controller
@RequestMapping({"/schoolAdmin"})
public class SchoolAdminController {
	
	@Autowired	
	private SchoolService schoolService;
	
	@Autowired
	private SchoolAdminService schoolAdminService;
	
	@Autowired	
    private GtsService gtsService;
	
	@Autowired
	RouteService routeService;
	
	@RequestMapping(value="/home" )
	public String userHome(ModelMap model){
		
		model.addAttribute("homeActive", "homeActive");
		return "schoolAdminHome";
	}
	
	@RequestMapping(value="/parentList")
	public String allParentList(@ModelAttribute("schoolAdmin") SchoolAdmin schoolAdmin,HttpServletRequest request,HttpServletResponse response,ModelMap model) throws ParseException{
		
		
		
		String action="action";
		if(request.getParameter("action")!=null){
			action=request.getParameter("action");
		}
		System.out.println("Action:"+action);
		if(action.equals("add")){
			
			System.out.println("Add Controller");
			 schoolAdmin.setRole("ROLE_PARENT");
				School school=schoolService.getSchool(schoolAdmin.getSchool().getSchoolName());
				schoolAdmin.setEnabled(true);
				gtsService.addAccountInGts(schoolAdmin.getUsername(),schoolAdmin.getPassword(),schoolAdmin.getAccountType());
				
				String userName = SecurityContextHolder.getContext().getAuthentication().getName();
				schoolAdmin.setAccountId(userName);
				schoolAdmin.setSchool(school);
				schoolAdmin.setAccountType("Parent");
				schoolAdminService.addSchoolAdmin(schoolAdmin);
				model.addAttribute(new SchoolAdmin());
		}
		
		HttpSession session = request.getSession();
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		List<SchoolAdmin> schoolAdminList= schoolAdminService.allSchoolAdminList(userName);
		model.addAttribute("schoolAdminList", schoolAdminList);
		SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
		System.out.println("currentUser"+currentUser.getAccountId());
		List<School> schoolList=schoolService.allSchoolList(currentUser.getAccountId());
		System.out.println("schoolList:"+schoolList.toString());
		for (School school : schoolList) {
			System.out.println("schoolList:"+school.toString());
		}
		
		
		SchoolAdmin currentUserr = (SchoolAdmin) session.getAttribute("currentUser");
		String username = currentUserr.getUsername();
		model.addAttribute("userName", username);
		
		model.addAttribute("schoolList", schoolList);
		model.addAttribute("parentActive", "parentActive");
		return "parentList";
	}
	
	@RequestMapping(value="/studentList")
	public String allStudentList(HttpServletRequest request,ModelMap model){
		
		HttpSession session = request.getSession();
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		List<SchoolAdmin> schoolAdminList= schoolAdminService.getAllStudentList(userName);
		model.addAttribute("schoolAdminList", schoolAdminList);
		SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
		List<School> schoolList=schoolService.allSchoolList(currentUser.getAccountId());
		
		
		SchoolAdmin currentUserr = (SchoolAdmin) session.getAttribute("currentUser");
		List<Route> routeList = routeService.getRouteList(userName);
		
		String username = currentUserr.getUsername();
		model.addAttribute("userName", username);
		
		model.addAttribute("routeList", routeList);
		model.addAttribute("schoolList", schoolList);
		model.addAttribute("studentActive", "studentActive");
		return "studentList";
	}
	
	@RequestMapping(value = "/deleteParentList")
	public String deleteParentList(@RequestParam("list") String str,HttpServletRequest request,ModelMap model){
		str = str.substring(0, str.length()-1);
		String[] str1 = str.split(",");
		
		for (int i = 0; i < str1.length; i++) {
			int id = Integer.parseInt(str1[i]);
	
			String accountID = schoolAdminService.getNameFromId(id);
			System.out.println("accountID:"+accountID);			
			gtsService.deleteAccountInGts(accountID);

			schoolAdminService.deleteSchoolAdmin(id);
		}
		
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
	    List<SchoolAdmin> schoolAdminList= schoolAdminService.allSchoolAdminList(userName);
		
	    HttpSession session = request.getSession();
		SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
		String username = currentUser.getUsername();
		model.addAttribute("userName", username);
	    
	    model.addAttribute("schoolAdminList", schoolAdminList);
		model.addAttribute("parentActive", "parentActive");
		return "parentList";
	}

	@RequestMapping(value = "/deleteStudentList")
	public String deleteStudentList(@RequestParam("list") String str,HttpServletRequest request,ModelMap model){
		str = str.substring(0, str.length()-1);
		String[] str1 = str.split(",");
		
		for (int i = 0; i < str1.length; i++) {
			int id = Integer.parseInt(str1[i]);
			
			String accountID = schoolAdminService.getNameFromId(id);
			System.out.println("accountID:"+accountID);			
			gtsService.deleteAccountInGts(accountID);
			
			schoolAdminService.deleteSchoolAdmin(id);
		}

		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
	    List<SchoolAdmin> schoolAdminList= schoolAdminService.getAllStudentList(userName);
		
	    HttpSession session = request.getSession();
		SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
		String username = currentUser.getUsername();
		model.addAttribute("userName", username);
	    
	    model.addAttribute("schoolAdminList", schoolAdminList);
	    model.addAttribute("studentActive", "studentActive");
		return "studentList";
	}
	
	@ResponseBody
	@RequestMapping(value="/editParent",method = RequestMethod.POST)
	public String editParent(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String list = request.getParameter("list");
		String [] dataList = list.split(",");
		SchoolAdmin schoolAdmin = new SchoolAdmin();
		School school =schoolService.getSchool(dataList[2]);
		Integer parentId=Integer.parseInt(dataList[0]);
		Integer age=Integer.parseInt(dataList[5]);
		schoolAdmin.setId(parentId);
		schoolAdmin.setName(dataList[1]);
		schoolAdmin.setSchool(school);
		schoolAdmin.setAddress(dataList[3]);
		schoolAdmin.setEmail(dataList[4]);
		schoolAdmin.setAge(age);
		schoolAdmin.setCity(dataList[6]);
		schoolAdmin.setPassword(dataList[7]);
		schoolAdmin.setUsername(dataList[8]);
		schoolAdmin.setAccountType("Parent");
		model.addAttribute(new SchoolAdmin());
		schoolAdmin.setRole("ROLE_PARENT");
		schoolAdmin.setEnabled(true);
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		schoolAdmin.setAccountId(userName);
		schoolAdmin.setSchool(school);
		schoolAdminService.updateSchoolAdmin(schoolAdmin);
		return "parentList";
	}

	
}
