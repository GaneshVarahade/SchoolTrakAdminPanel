package com.fidelit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fidelit.model.Device;
import com.fidelit.service.DeviceService;
import com.fidelit.service.GtsService;

@Controller
@RequestMapping({"/device"})
public class DeviceController {
	
	@Autowired
	DeviceService deviceService;
	
	@Autowired
	GtsService gtsService;
	
	@RequestMapping(value="/deviceList")
	String getDeviceList(HttpServletRequest request,HttpServletResponse response,ModelMap model){
	
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		List<Device> deviceList = deviceService.getAllDeviceByUsername(userName);
		
		model.addAttribute("deviceList",deviceList);
		model.addAttribute("device",new Device());
		return "device";
	}
	
	@RequestMapping(value="/addDevice")
	String addDevice(@ModelAttribute("device") Device device,HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		device.setAccountID(userName);
		deviceService.addDevice(device);
		gtsService.addDeviceInGts(device);
		model.addAttribute("device",new Device());
		return "device";
	}
	
}