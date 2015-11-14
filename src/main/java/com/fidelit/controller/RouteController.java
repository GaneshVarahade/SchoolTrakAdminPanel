package com.fidelit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fidelit.model.Route;
import com.fidelit.model.Stop;
import com.fidelit.service.RouteService;
import com.fidelit.service.StopService;

@Controller
@RequestMapping({"/route"})
public class RouteController {

@Autowired
RouteService routeService;

@Autowired
StopService stopService;
	
	@RequestMapping("addStop")
	public String addStop(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String routeId=request.getParameter("id");
		model.addAttribute("routeId", routeId);
		return "stopMap";
	}

	@ResponseBody
	@RequestMapping(value="/addNewStops" , method=RequestMethod.POST)
	public String addNewStops(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		
		String list = request.getParameter("data");
		Stop stop= new Stop();
		String[] data=list.split(",");
		int id=Integer.parseInt(data[0]);
		Route route=routeService.getRouteId(id);
		int stopNo=Integer.parseInt(data[1]);
		double latitude=Double.parseDouble(data[3]);
		double longitude=Double.parseDouble(data[4]);
		stop.setRoute(route);
		stop.setStopNo(stopNo);
		stop.setStopName(data[2]);
		stop.setLatitude(latitude);
		stop.setLongitude(longitude);
		stopService.addStop(stop);
		model.addAttribute("latitude", latitude);
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
