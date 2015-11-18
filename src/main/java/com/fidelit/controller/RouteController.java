package com.fidelit.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fidelit.model.Route;
import com.fidelit.model.SchoolAdmin;
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
	public String route(ModelMap model) throws JsonGenerationException, JsonMappingException, IOException{
		List<Route> routes = routeService.getRouteList();
		System.out.println(routes.toString());
		List<Map<String,String>>  list = new ArrayList<Map<String,String>>();
		for (Route product : routes) {
			   HashMap<String,String> routeMap = new HashMap<String, String>();
			   routeMap.put("RouteName", product.getRouteName());
			   list.add(routeMap);
			}
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		System.out.println("json"+json);
		model.addAttribute("routeMap",json);
		
		model.addAttribute("routeList",routes);
		model.addAttribute(new Route());
		return "routeMap";
	}
	
	@RequestMapping(value="routeMapMenu")
	public String routeMap(ModelMap model){
		List<Route> routes = routeService.getRouteList();
		System.out.println(routes.toString());
		HashMap<String, Route> productMap = new HashMap<String, Route>();
		for (Route product : routes) {
			   productMap.put(product.getRouteName(), product);
			}
		model.addAttribute("routeMap",productMap);
		model.addAttribute(new Route());
		return "routeMap";
	}

	@ResponseBody
	@RequestMapping(value="routeMapMenuAjax")
	public String routeMapMenuAjax(ModelMap model) throws JsonGenerationException, JsonMappingException, IOException{
		List<Route> routes = routeService.getRouteList();
		System.out.println(routes.toString());
		List<Map<String,Object>>  list = new ArrayList<Map<String,Object>>();
		int cnt=1;
		for (Route product : routes) {
			   Map<String,Object> routeMap = new HashMap<String, Object>();
			   routeMap.put("Id", cnt);
			   routeMap.put("RouteId", product.getRouteNo());
			   routeMap.put("RouteName", product.getRouteName());
			   routeMap.put("PID",-1);
			   list.add(routeMap);
			   System.out.println( "Route"+product.getRouteName());
			   List<Stop> stopList = product.getStopList();
			   for (Stop stop : stopList) {
				   cnt++;
				System.out.println("stop:"+stop.toString());
				 Map<String,Object> routeMapLocal = new HashMap<String, Object>();
				 routeMapLocal.put("Id", cnt);
				 routeMapLocal.put("RouteId", stop.getRoute().getRouteNo());
				// routeMapLocal.put("RouteName", stop.getRoute().getRouteName());
				 routeMapLocal.put("StopId", stop.getStopNo());
				 routeMapLocal.put("StopName", stop.getStopName());
				 routeMapLocal.put("PID", product.getRouteNo());
				 list.add(routeMapLocal);
			}
			   cnt++;
			}
		System.out.println(list.toString());
//		List<Stop> stops = stopService.getAllStop();
//		System.out.println(stops.toString());
		//List<Map<String,Object>>  stoplist = new ArrayList<Map<String,Object>>();
		/*for (Route product : routes) {
			   Map<String,Object> routeMap = new HashMap<String, Object>();
			   routeMap.put("RouteId", product.getRouteNo());
			   routeMap.put("RouteName", product.getRouteName());
			   routeMap.put("PID",-1);
			   list.add(routeMap);
			}*/
		
		/*Map<String,List<Map<String,Object>> > megaRouteMap = new HashMap<String, List<Map<String,Object>> >();
		List<Map<String,Object>>  list1 = new ArrayList<Map<String,Object>>();
		Map<String,Object> routeMap = new HashMap<String, Object>();
		routeMap.put("RouteName", "value");
		list1.add(routeMap);
		megaRouteMap.put("product", list1);*/
		//list.add(megaRouteMap);
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(list);
		return json;
	}
	@RequestMapping(value="addRoute",method = RequestMethod.POST)
	public String addRoute(@ModelAttribute("route") Route route,ModelMap model){
		System.out.println("Route"+route.getRouteName());
		routeService.addRoute(route);
		List<Route> routes = routeService.getRouteList();
		model.addAttribute("routeList",routes);
	
		return "routeMap";
	}
	@RequestMapping(value="editRoute",method = RequestMethod.POST)
	public String editRoute(HttpServletRequest request,HttpServletResponse response,ModelMap model){
		String list = request.getParameter("list");
		System.out.println(list);
		String [] dataList = list.split(",");
		Route route = new Route();
		Integer routeId=Integer.parseInt(dataList[0]);
		route.setRouteNo(routeId);
		route.setRouteName(dataList[1]);
		route.setRouteStatus(true);
		route.setStartStop(dataList[3]);
		route.setEndStop(dataList[4]);
		routeService.updateRoute(route);
	/*	Integer stopNo=Integer.parseInt(dataList[4]);
		Integer routeNo=Integer.parseInt(dataList[5]);
		Integer id=Integer.parseInt(dataList[0]);
		double latitude=Double.parseDouble(dataList[2]);
		double longitude=Double.parseDouble(dataList[3]);
		Route routes=routeService.getRouteId(routeNo);
		stop.setRoute(route);
		stop.setStopId(id);
		stop.setStopName(dataList[1]);
		stop.setLatitude(latitude);
		stop.setLongitude(longitude);
		stop.setStopNo(stopNo);
		stopService.updateStop(stop);*/
		return "stopMap";
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
	
	@RequestMapping(value = "/deleteRouteList")
	public String deleteParentList(@RequestParam("list") String str,ModelMap model){
		str = str.substring(0, str.length()-1);
		String[] str1 = str.split(",");
		
		for (int i = 0; i < str1.length; i++) {
			int id = Integer.parseInt(str1[i]);
			routeService.deleteRoute(id);
		}
		

	    List<Route> routeList= routeService.getRouteList();
		model.addAttribute("routeList", routeList);
		model.addAttribute(new Route());
		return "routeMap";
	}

}
