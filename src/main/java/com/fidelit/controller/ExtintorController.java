package com.fidelit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fidelit.model.Bus;
import com.fidelit.model.BusDriver;
import com.fidelit.model.Extintor;
import com.fidelit.model.Route;
import com.fidelit.model.SchoolAdmin;
import com.fidelit.service.BusService;
import com.fidelit.service.ExtinctorService;
import com.fidelit.service.GtsService;


@Controller
@RequestMapping({"/extintor"})
public class ExtintorController {

	@Autowired
	ExtinctorService extinctorService;
	
	@Autowired
	BusService busService;
		
	@RequestMapping(value="extintorList")
	public String extintorList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Extintor> extintorList = extinctorService.getExtintorList(userName);
		List<Bus> busList=busService.allBusList(userName);
		
		HttpSession session = request.getSession();
		SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
		String username = currentUser.getUsername();
		model.addAttribute("userName", username);
		
		model.addAttribute("extintorList",extintorList);
		model.addAttribute("busList",busList);
		model.addAttribute(new Extintor());
		return "extintorList";
	}
	
	@RequestMapping(value="addExtintor",method = RequestMethod.POST)
	public String addExtintor(@ModelAttribute("extintor") Extintor extintor,HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Bus> busList=busService.allBusList(userName);
		String busNumber=extintor.getBus().getRegNumber();
		Bus bus=busService.getBusRegNo(busNumber);
		extintor.setBus(bus);
		extintor.setAccountId(userName);
		extinctorService.addExtintor(extintor);
		List<Extintor> extintorList =extinctorService.getExtintorList(userName);
		
		HttpSession session = request.getSession();
		SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
		String username = currentUser.getUsername();
		model.addAttribute("userName", username);
		
		
		model.addAttribute("extintorList",extintorList);
		model.addAttribute("busList",busList);
		return "extintorList";
	}
	
	@RequestMapping(value="editExtintor",method = RequestMethod.POST)
	public String editExtintor(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		String list = request.getParameter("list");
		String [] dataList = list.split(",");
		Extintor extintor = new Extintor();
		Boolean status;
	//	System.out.println("Status"+dataList[2]);
		if(dataList[2].equals("1")){
			
			System.out.println("Status : "+dataList[2]);
			status=false;
		}
		else{
			System.out.println("Status1 :"+dataList[2]);
			status=true;
		}
		String busNo=dataList[3];
		Bus bus=busService.getBusRegNo(busNo);
		Integer id=Integer.parseInt(dataList[0]);
		extintor.setId(id);
		extintor.setType(dataList[1]);
		extintor.setStatus(status);
		extintor.setBus(bus);
		extintor.setAccountId(userName);
		extinctorService.updateExtintor(extintor);
		
		HttpSession session = request.getSession();
		SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
		String username = currentUser.getUsername();
		model.addAttribute("userName", username);
		
		
		return "stopMap";
	}
	
	@RequestMapping(value = "/deleteExtintorList")
	public String deleteParentList(@RequestParam("list") String str,HttpServletRequest request,HttpServletResponse response,ModelMap model){
		str = str.substring(0, str.length()-1);
		String[] str1 = str.split(",");
		
		for (int i = 0; i < str1.length; i++) {
			int id = Integer.parseInt(str1[i]);
			extinctorService.deleteExtintor(id);
			
		}
		
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
	    List<Extintor> extintorList= extinctorService.getExtintorList(userName);
		
	    HttpSession session = request.getSession();
		SchoolAdmin currentUser = (SchoolAdmin) session.getAttribute("currentUser");
		String username = currentUser.getUsername();
		model.addAttribute("userName", username);
		
	    
	    model.addAttribute("extintorList", extintorList);
		model.addAttribute(new Extintor());
		return "extintorList";
	}
	
	
	
}
