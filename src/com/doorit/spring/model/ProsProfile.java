package com.doorit.spring.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;

/**
 * This domain will hold the User profile / Vendor profile details  * 
 * @author Anil
 * 15-12-2014 
 */

/**
 * @author Rishu
 *
 */
@Entity
@Table(name="PROSPROFILE")
public class ProsProfile implements Serializable{
	
	



	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="Profile_id")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	
	private long ProsProfileId;
	
	
	/*@Column(name="proImage",length=100000)
	private byte[] proImage;
	public byte[] getProImage() {
		return proImage;
	}

	public void setProImage(byte[] proImage) {
		this.proImage = proImage;
	}*/

	@Column(name="company_name", length = 100)
	private String companyName;
	
	@Column(name="company_profile",nullable = false, length = 1000)
	private String companyProfile= "";
	
	@Column(name="website", length = 100)
	private String website;
	
	@Column(name="logo", length = 100)
	private String logo;
	
	private String ListedIn ; // services offred by pros
	
	private String ListedInOthers ; // services offred by pros
	
	private String HrsOfOperation; //Monday, Tuesday, Wednesday, Thursday, Friday, Saturday: 06:00 am to 01:00 pm & 05:00 pm to 08:00 pm //Sunday: Closed Modes
	
	private String modesOfPayment; // Cash / Visa Card / Diners Club Card
	
	private String YearEstablished ; // 2003
	
	private String verification;    //Set to nothing(Default) (sushant)
	
	
	private String yearOfEstablishment;
	
	private String weekdaysFrom;
	
	private String weekdaysTo;
	
	private String satFrom;
	
	private String satTo;
	
	public String getWeekdaysFrom() {
		return weekdaysFrom;
	}

	public void setWeekdaysFrom(String weekdaysFrom) {
		this.weekdaysFrom = weekdaysFrom;
	}

	public String getWeekdaysTo() {
		return weekdaysTo;
	}

	public void setWeekdaysTo(String weekdaysTo) {
		this.weekdaysTo = weekdaysTo;
	}

	public String getSatFrom() {
		return satFrom;
	}

	public void setSatFrom(String satFrom) {
		this.satFrom = satFrom;
	}

	public String getSatTo() {
		return satTo;
	}

	public void setSatTo(String satTo) {
		this.satTo = satTo;
	}

	
	public String getSundayFrom() {
		return sundayFrom;
	}

	public void setSundayFrom(String sundayFrom) {
		this.sundayFrom = sundayFrom;
	}

	

	public String getSundayTo() {
		return sundayTo;
	}

	public void setSundayTo(String sundayTo) {
		this.sundayTo = sundayTo;
	}



	private String sundayFrom;
	
	private String sundayTo;
	

	@Version
	//@Column(name = "version")
	private Date version;
	private String bussinessDistance;
	public String getBussinessDistance() {
		return bussinessDistance;
	}

	public void setBussinessDistance(String bussinessDistance) {
		this.bussinessDistance = bussinessDistance;
	}

	private String bussinessType;//TTOC(TRAVEL TO CUSTOMERS),CTOM(CUSTOMERS TRAVEL TO ME),NIETHER
	public String getBussinessType() {
		return bussinessType;
	}

	public void setBussinessType(String bussinessType) {
		this.bussinessType = bussinessType;
	}
	@OneToOne
	@MapsId
	@JoinColumn(name = "pros_id")
	private User user;
	
		
	public String getListedInOthers() {
		return ListedInOthers;
	}

	public void setListedInOthers(String listedInOthers) {
		ListedInOthers = listedInOthers;
	}

	public Date getVersion() {
		return version;
	}

	public void setVersion(Date version) {
		this.version = version;
	}

	public String getVerification() {
		return verification;
	}

	public void setVerification(String verification) {
		this.verification = verification;
	}

	public String getListedIn() {
		return ListedIn;
	}

	public void setListedIn(String listedIn) {
		ListedIn = listedIn;
	}

	public String getHrsOfOperation() {
		return HrsOfOperation;
	}

	public void setHrsOfOperation(String hrsOfOperation) {
		HrsOfOperation = hrsOfOperation;
	}

	public String getModesOfPayment() {
		return modesOfPayment;
	}

	public void setModesOfPayment(String modesOfPayment) {
		this.modesOfPayment = modesOfPayment;
	}

	public String getYearEstablished() {
		return YearEstablished;
	}

	public void setYearEstablished(String yearEstablished) {
		YearEstablished = yearEstablished;
	}

	public ProsProfile() {
		//super();
	}
	
			
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public long getProsProfileId() {
		return ProsProfileId;
	}

	public void setProsProfileId(long prosProfileId) {
		ProsProfileId = prosProfileId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyProfile() {
		return companyProfile;
	}

	public void setCompanyProfile(String companyProfile) {
		this.companyProfile = companyProfile;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getYearOfEstablishment() {
		return yearOfEstablishment;
	}

	public void setYearOfEstablishment(String yearOfEstablishment) {
		this.yearOfEstablishment = yearOfEstablishment;
	}
	
	/*
	****
	***
	****/
	/*@Column(name="VendorVerify")
	boolean VendorVerify;

	public void setVendorVerify(boolean vendorVerify) {
		VendorVerify = vendorVerify;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean isVendorVerify() {
		return VendorVerify;
	}*/



	
	}
