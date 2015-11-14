package com.fidelit.controller;

import java.util.ArrayList;
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
	
	

	@RequestMapping(value="/addNewStops")
	public String addNewStops(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		int stopCounter = 0;
		int stopNo=0;
		String stopName=null;
		double latitude=0.00;
		double longitude=0.00;
		
		if(request.getParameter("stopNo") != null){
	       stopNo = Integer.parseInt(request.getParameter("stopNo"));
		}
		if(request.getParameter("stopName") != null){
		    stopName = request.getParameter("stopName");
		}
		if(request.getParameter("latitude") != null){
			latitude = Double.parseDouble(request.getParameter("latitude"));
		}
		if(request.getParameter("longitude") != null){
			longitude = Double.parseDouble(request.getParameter("longitude"));
		}
		int routeId= Integer.parseInt(request.getParameter("routeId"));
		
	
		if(stopName != null){
		 Stop stop= new Stop();
		 Route route=routeService.getRouteId(routeId);
		 stop.setRoute(route);
		 stop.setStopNo(stopNo);
		 stop.setStopName(stopName);
		 stop.setLatitude(latitude);
		 stop.setLongitude(longitude);
		 stopService.addStop(stop);
		}
		
		Route fetchRoute=routeService.getRouteId(routeId);
		
		List<Stop> stopList =  fetchRoute.getStopList();
	    StringBuilder coordinateList = new StringBuilder();
		for (Stop stop2 : stopList) {
			stopCounter++;
			coordinateList.append(stop2.getLatitude());
			coordinateList.append(",");
			coordinateList.append(stop2.getLongitude());
			coordinateList.append(",");
		}
		stopCounter++;
		model.addAttribute("stopCounter", stopCounter);
		model.addAttribute("stopList", stopList);
		model.addAttribute("routeId", routeId);
		model.addAttribute("coordinateList", coordinateList);
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
	@RequestMapping(value="editStop",method = RequestMethod.POST)
	public String editStop(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String list = request.getParameter("list");
		System.out.println(list);
		String [] dataList = list.split(",");
		Stop stop = new Stop();
		Integer stopNo=Integer.parseInt(dataList[4]);
		Integer routeNo=Integer.parseInt(dataList[5]);
		Integer id=Integer.parseInt(dataList[0]);
		double latitude=Double.parseDouble(dataList[2]);
		double longitude=Double.parseDouble(dataList[3]);
		Route route=routeService.getRouteId(routeNo);
		stop.setRoute(route);
		stop.setStopId(id);
		stop.setStopName(dataList[1]);
		stop.setLatitude(latitude);
		stop.setLongitude(longitude);
		stop.setStopNo(stopNo);
		stopService.updateStop(stop);
		return "stopMap";
	}

}
