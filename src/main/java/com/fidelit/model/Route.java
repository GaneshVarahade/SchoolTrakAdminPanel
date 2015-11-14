package com.fidelit.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="route")
public class Route implements Serializable{

	 /**
	 * 
	 */
	 private static final long serialVersionUID = 3165354130753674683L;
	 private Integer routeNo;
	 private String  routeName;
	 private Boolean routeStatus;
	 private String  startStop;
	 private String  endStop;
	 private List<Stop> stopList;
	 

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO) 
	public Integer getRouteNo() {
		return routeNo;
	}
	public void setRouteNo(Integer routeNo) {
		this.routeNo = routeNo;
	}
	public String getRouteName() {
		return routeName;
	}
	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	public Boolean getRouteStatus() {
		return routeStatus;
	}
	public void setRouteStatus(Boolean routeStatus) {
		this.routeStatus = routeStatus;
	}
	public String getStartStop() {
		return startStop;
	}
	public void setStartStop(String startStop) {
		this.startStop = startStop;
	}
	public String getEndStop() {
		return endStop;
	}
	public void setEndStop(String endStop) {
		this.endStop = endStop;
	}
	
	@OneToMany(fetch=FetchType.EAGER, cascade = {CascadeType.ALL}, mappedBy="route")
	public List<Stop> getStopList() {
		return stopList;
	}
	public void setStopList(List<Stop> stopList) {
		this.stopList = stopList;
	}
	 
	 
}
