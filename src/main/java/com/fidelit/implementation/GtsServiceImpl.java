package com.fidelit.implementation;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.fidelit.service.GtsService;

public class GtsServiceImpl implements GtsService{

	@Autowired
	@Qualifier("gtsSessionFactory")
	SessionFactory sessionFactory; 
	
	@Override
	public void addAccountInGts(String accountId) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		String sql = "insert into Account (accountID) values ('"+accountId +"')";
		Query query = session.createQuery(sql);
		query.executeUpdate();
		session.close();
	}
	
	@Override
	public void addCorridorInGts(String accountId,String corridorID,String description) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		String sql = "insert into GeoCorridor (accountID,corridorID,description) values('"+accountId +"','"+corridorID +"','"+description +"')";
		Query query = session.createQuery(sql);
		query.executeUpdate();
		session.close();
	}

}
