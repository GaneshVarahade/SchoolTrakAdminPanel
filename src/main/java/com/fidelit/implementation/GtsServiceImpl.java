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
		String sql = "INSERT INTO Account (accountID) VALUES ('"+accountId +"');";
		Query query = session.createSQLQuery(sql);
		query.executeUpdate();
		session.close();
	}
	
	@Override
	public void addCorridorInGts(String accountId,String corridorID,String description) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		String sql = "insert into GeoCorridor (accountID,corridorID,description) values('"+accountId +"','"+corridorID +"','"+description +"')";
		Query query = session.createSQLQuery(sql);
		query.executeUpdate();
		session.close();
	}


	@Override
	public void addCorridorInGtsList(String accountId, String corridorID,
			double latitude, double longitude, int stopID) {
		Session session = sessionFactory.openSession();
		String sql=null;
		if(stopID==1){
			sql="insert into GeoCorridorList (accountID,corridorID,latitude"+stopID+",longitude"+stopID+",sortID) values('"+accountId +"','"+corridorID +"',"+latitude+stopID +","+longitude+stopID +",1)"; 
		}else{
			sql="update GeoCorridorList set latitude"+stopID+" = "+latitude +", longitude"+stopID+" ="+longitude +"where corridorID = '"+corridorID +"'" ;
		}
		Query query = session.createSQLQuery(sql);
		query.executeUpdate();
		session.close();
		
		// TODO Auto-generated method stub
		
	}

}
