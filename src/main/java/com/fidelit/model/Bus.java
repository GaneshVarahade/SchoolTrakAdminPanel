package com.fidelit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="bus")
public class Bus {
	
	Integer busId;
	String regNumber;
	String busType;
	Integer capacity;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="busId")
	public Integer getBusId() {
		return busId;
	}
	
	public void setBusId(Integer busId) {
		this.busId = busId;
	}
	
	@Column(name="regNumber")
	public String getRegNumber() {
		return regNumber;
	}
	
	public void setRegNumber(String regNumber) {
		this.regNumber = regNumber;
	}
	
	@Column(name="busType")
	public String getBusType() {
		return busType;
	}
	
	public void setBusType(String busType) {
		this.busType = busType;
	}
	
	@Column(name="capacity")
	public Integer getCapacity() {
		return capacity;
	}
	
	public void setCapacity(Integer capacity) {
		this.capacity = capacity;
	}
}
