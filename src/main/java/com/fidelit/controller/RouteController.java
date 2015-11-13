package com.fidelit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fidelit.model.Route;
import com.fidelit.service.RouteService;

@Controller
@RequestMapping({"/route"})
public class RouteController {

@Autowired
RouteService routeService;
	
@RequestMapping("addStop")
	public String addStop(){
		System.out.println("Route");
		return "stopMap";
	}

@RequestMapping(value="routeMap")
public String route(ModelMap model){
	List<Route> routes = routeService.getRouteList();
	
	model.addAttribute("routeList",routes);
	model.addAttribute(new Route());
	return "routeMap";
}

@RequestMapping(value="addRoute",method = RequestMethod.POST)
public String addRoute(@ModelAttribute("route") Route route,ModelMap model){
	System.out.println("Route"+route.getRouteName());
	routeService.addRoute(route);
    List<Route> routes = routeService.getRouteList();
	model.addAttribute("routeList",routes);
	
	return "routeMap";
}
}
