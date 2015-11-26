package com.fidelit.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fidelit.model.Clients;
import com.fidelit.model.Employee;
import com.fidelit.model.EmployeeProject;
import com.fidelit.model.Holidays;
import com.fidelit.model.LeavesApplied;
import com.fidelit.model.Project;
import com.fidelit.model.School;
import com.fidelit.model.SchoolAdmin;
import com.fidelit.model.SuperVisor;
import com.fidelit.model.UserRole;
import com.fidelit.service.ClientService;
import com.fidelit.service.EmployeeProjectService;
import com.fidelit.service.EmployeeService;
import com.fidelit.service.GtsService;
import com.fidelit.service.SchoolAdminService;
import com.fidelit.service.SchoolService;
import com.fidelit.service.HolidayService;
import com.fidelit.service.LeaveService;
import com.fidelit.service.ProjectService;


@Controller
@RequestMapping({"/admin"})
public class AdminController {
   
  @Autowired	
  private EmployeeService employeeService;
  @Autowired
  private ClientService clientService;
  @Autowired
  private ProjectService projectService;
  @Autowired
  private LeaveService leaveService;
  @Autowired
  private HolidayService holidayService;
  @Autowired
  private EmployeeProjectService employeeProjectService;
  
  @Autowired
  private SchoolService schoolService;
  
  @Autowired
  private SchoolAdminService schoolAdminService;
  
  
  
  @Autowired
  private GtsService gtsService;
@RequestMapping("/home")
public String adminHome(){
	
	return "admin_home";
}
@RequestMapping(value = "/employeeManagement")
public String employeeManagement() {
	
	
	return "admin_employee_management";
}

@RequestMapping("/checkUserName")
public @ResponseBody String checkUserName(HttpServletRequest request){
    String userName = request.getParameter("userName"); 
    boolean flag = employeeService.checkUserName(userName);
    if(flag == true){
    	return "true";
    }
	return "false";		
}


@RequestMapping("/checkClientUsername")
public @ResponseBody String checkClientUsername(HttpServletRequest request){
    String userName = request.getParameter("ClientUsername"); 
    boolean flag = clientService.checkClientUsername(userName);
    if(flag == true){
    	return "true";
    }
	return "false";		
}

@ResponseBody
@RequestMapping(value="/addSchool" , method=RequestMethod.POST)
public String addSchool(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws ParseException{
	System.out.println("HII IN School");
	String userName = SecurityContextHolder.getContext().getAuthentication().getName();
	String list = request.getParameter("accessList");
	
	String [] dataList = list.split(",");
	School school = new School();
	school.setSchoolName(dataList[0]); 
	school.setAddress(dataList[1]);
	school.setDetails(dataList[2]);
	school.setLocation(dataList[3]);
	school.setCity(dataList[4]);

	school.setAccountId(userName);
	

	schoolService.addSchool(school);
	List<School> schoolList= schoolService.allSchoolList(userName);
	HttpSession session = request.getSession();
	SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
	String username = currentUser.getUsername();
	model.addAttribute("userName", username);
	
	model.addAttribute("schoolList", schoolList);
	return "schoolList";	

}




@ResponseBody
@RequestMapping(value="/checkUniqueUserName" , method=RequestMethod.POST)
public boolean checkUniqueUserName(HttpServletRequest request,HttpServletResponse response,ModelMap model){
	
	String userName = request.getParameter("userName");
	System.out.println("userName:::"+userName);
	boolean val = schoolAdminService.getUniqueUserName(userName);
	return val;
	
}



@ResponseBody
@RequestMapping(value="/addSchoolAdmin" , method=RequestMethod.POST)
public String addClient(HttpServletRequest request,HttpServletResponse response,ModelMap model){
	
	String list = request.getParameter("accessList");
	String SchoolName=request.getParameter("schoolName");
	
	
	
	String [] dataList = list.split(",");
	for (int i = 0; i < dataList.length; i++) {
		System.out.println("i"+i+"="+dataList[i]);
	}
	String SchoolName1=dataList[6];
	School school=schoolService.getSchool(SchoolName1);
	SchoolAdmin schoolAdmin = new SchoolAdmin();
	
	//school.setSchoolName(SchoolName1);
	schoolAdmin.setName(dataList[0]);
	schoolAdmin.setAddress(dataList[1]);
	schoolAdmin.setPassword(dataList[3]);
	schoolAdmin.setEmail(dataList[2]);
	schoolAdmin.setAge(Integer.parseInt(dataList[4]));
	schoolAdmin.setCity(dataList[5]);
	schoolAdmin.setAccountType(dataList[8]);
	schoolAdmin.setUsername(dataList[7]);
	schoolAdmin.setSchool(school);
	schoolAdmin.setEnabled(true);
	gtsService.addAccountInGts(schoolAdmin.getUsername(),schoolAdmin.getPassword(),schoolAdmin.getAccountType());
	if(dataList[8].equals("Student")){
		schoolAdmin.setRole("ROLE_STUDENT");
	}else if(dataList[8].equals("SchoolAdmin")){
		schoolAdmin.setRole("ROLE_SCHOOLADMIN");
	}else if(dataList[8].equalsIgnoreCase("Parent")){
		schoolAdmin.setRole("ROLE_PARENT");
	}else if(dataList[8].equalsIgnoreCase("Admin")){
		schoolAdmin.setRole("ROLE_ADMIN");
	}
	String userName = SecurityContextHolder.getContext().getAuthentication().getName();
	schoolAdmin.setAccountId(userName);
	schoolAdminService.addSchoolAdmin(schoolAdmin);
	List<SchoolAdmin> schoolAdminList= schoolAdminService.allSchoolAdminList(userName);
	
	HttpSession session = request.getSession();
	SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
	String username = currentUser.getUsername();
	model.addAttribute("userName", username);
	
	
	model.addAttribute("schoolAdminList", schoolAdminList);
	return "schoolAdmin";
}



@RequestMapping(value="/schoolList")
public String allSchoolList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
	
	String userName = SecurityContextHolder.getContext().getAuthentication().getName();
	List<School> schoolList= schoolService.allSchoolList(userName);
	for (School school2 : schoolList) {
		System.out.println("School    "+school2.getSchoolName());
	}
	
	HttpSession session = request.getSession();
	SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
	String username = currentUser.getUsername();
	model.addAttribute("userName", username);
	
	model.addAttribute("schoolList", schoolList);
	return "schoolList";
}





@RequestMapping(value="/reports")
public String allClientList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
	

	HttpSession session = request.getSession();
	SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
	String username = currentUser.getUsername();
	model.addAttribute("userName", username);
	
	return "reports";
}




@RequestMapping(value="/schoolAdmin")
public String allSchoolAdminList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
	String userName = SecurityContextHolder.getContext().getAuthentication().getName();
	List<SchoolAdmin> schoolAdminList= schoolAdminService.allSchoolAdminList(userName);
	model.addAttribute("schoolAdminList", schoolAdminList);
	List<School> schoolList=schoolService.allSchoolList(userName);
	

	HttpSession session = request.getSession();
	SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
	String username = currentUser.getUsername();
	model.addAttribute("userName", username);
	
	model.addAttribute("schoolList", schoolList);
	return "schoolAdmin";
}

@RequestMapping(value="/projectList")
public String allProjectList(ModelMap model){
	List<Project> projectList= projectService.allProjectList();
	model.addAttribute("projectList", projectList);
	return "projectList";
}


@RequestMapping(value="/routes")
public String allLeaveList(ModelMap model){
	List<LeavesApplied> leaveList= leaveService.allLeaveList();
	model.addAttribute("leaveList", leaveList);
		return "leaveList";
}


@RequestMapping(value="/settings")
public String allHolidayList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
	

	HttpSession session = request.getSession();
	SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
	String username = currentUser.getUsername();
	model.addAttribute("userName", username);
	
	return "settings";
}


@RequestMapping(value = "/deleteSchoolList")
public String deleteEmployeeList(@RequestParam("list") String str,HttpServletRequest request,HttpServletResponse response,ModelMap model){
	str = str.substring(0, str.length()-1);
	String[] str1 = str.split(",");
	
	for (int i = 0; i < str1.length; i++) {
		
		int id = Integer.parseInt(str1[i]);
		schoolService.deleteSchool(id);
	}
	
	String userName = SecurityContextHolder.getContext().getAuthentication().getName();
	List<School> schoolList= schoolService.allSchoolList(userName);
	

	HttpSession session = request.getSession();
	SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
	String username = currentUser.getUsername();
	model.addAttribute("userName", username);
	
	model.addAttribute("schoolList", schoolList);
	return "schoolList";
}

@RequestMapping(value = "/deleteSchoolAdminList")
public String deleteClientList(@RequestParam("list") String str,HttpServletRequest request,HttpServletResponse response,ModelMap model){
	str = str.substring(0, str.length()-1);
	String[] str1 = str.split(",");
	
	for (int i = 0; i < str1.length; i++) {
		int id = Integer.parseInt(str1[i]);
		schoolAdminService.deleteSchoolAdmin(id);
	}
	
	String userName = SecurityContextHolder.getContext().getAuthentication().getName();
    List<SchoolAdmin> schoolAdminList= schoolAdminService.allSchoolAdminList(userName);
	

	HttpSession session = request.getSession();
	SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
	String username = currentUser.getUsername();
	model.addAttribute("userName", username);
    
    model.addAttribute("schoolAdminList", schoolAdminList);
	return "schoolAdmin";
}





}


