package com.doorit.spring.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "SERVICECITY")
public class ServiceCity implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="cityId")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	private long serviceCityId; // pk
	
	@Version
	@Column(name = "version")
	private Date version;
	
	private String formatted_address;
	//private String street_number;
	private String locality;
	private String sublocality;
	private String postal_code;
	private String country;
	private String State;
	private String lat ;
	private String lng ;
	public long getServiceCityId() {
		return serviceCityId;
	}
	public void setServiceCityId(long serviceCityId) {
		this.serviceCityId = serviceCityId;
	}
	public Date getVersion() {
		return version;
	}
	public void setVersion(Date version) {
		this.version = version;
	}
	public String getFormatted_address() {
		return formatted_address;
	}
	public void setFormatted_address(String formatted_address) {
		this.formatted_address = formatted_address;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public String getSublocality() {
		return sublocality;
	}
	public void setSublocality(String sublocality) {
		this.sublocality = sublocality;
	}
	public String getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	
	
			
	
	
	
	
}
