package com.fidelit.implementation;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fidelit.model.Route;
import com.fidelit.service.RouteService;

@Transactional(propagation = Propagation.SUPPORTS, readOnly = true) 
@Service("routeService")
public class RouteServiceImpl implements RouteService{
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false) 
	@Override
	public void addRoute(Route route) {
		Session session = sessionFactory.getCurrentSession();
		session.save(route);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false) 
	@Override
	public List<Route> getRouteList() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Route.class);
		
		return criteria.list();
	}

}
