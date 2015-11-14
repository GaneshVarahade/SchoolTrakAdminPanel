package com.fidelit.service;

import java.util.List;

import com.fidelit.model.Route;

public interface RouteService {

	void addRoute(Route route);
	List<Route> getRouteList();
	Route getRouteId(int id);
}
