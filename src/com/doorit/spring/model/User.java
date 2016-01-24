package com.doorit.spring.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;



@Entity
@Table(name="USER")
public class User implements Serializable {
	
	public User(){
		
	}
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="user_id")
	@GenericGenerator(name="gen",strategy="increment")
	@GeneratedValue(generator="gen")
	
	private long userId;
	
	//private String username;
	private boolean enabled;
	
	private UUID UUIDNo;
	
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<UserRole> userRole = new HashSet<UserRole>();
	
	
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Set<UserRole> getUserRole() {
		return this.userRole;
	}

	public void setUserRole(Set<UserRole> userRole) {
		this.userRole = userRole;
	}

	
	@Column(name="name" )
	private String name;
	
	@Column(name="email",unique=true , nullable = false )
	private String emailId;
	
	@Column(name="mobile")
	private String mobile;
	
	@Column(name="phone1")
	private int phone1;
	
	@Column(name="phone2")
	private int phone2;
	
	@Column(name="city")
	private String city;
	
	@Column(name="location")
	private String location;
	
    public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	@Column(name="address", length = 2000)
	private String address;
	
	@Column(name="password")
	private String password;
	
	@Column(name="user_type")
	private String userType ; // user Type - cust , pros , admin - read write , readOnly  account manager
	
	private String formatted_address;
	//private String street_number;
	private String locality;
	private String sublocality;
	private String postal_code;
	private String country;
	private String State;
	private String lat ;
	private String lng ;
	
	@Column(name="filename")
	private String filename;

	@Column(name="content")
	@Lob
	private Blob content;
	
	@Column(name="content_type")
	private String contentType;

	
	
	//@Column(name="is_active")
	//private String IsActive = "Y"; //	// active  - Y , N
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Blob getContent() {
		return content;
	}

	public void setContent(Blob content) {
		this.content = content;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
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
	@Column(name="approver_Id")
	private long approverId; //	// system / admin  - Y , N
	
	@Column(name="approver_comments")
	private long approverComments; //	// active  - Y , N
	
	
	@Version
	@Column(name = "version")
	private Date version;
	
	public String getFormatted_address() {
		return formatted_address;
	}

	public void setFormatted_address(String formatted_address) {
		this.formatted_address = formatted_address;
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

	public Date getVersion() {
		return version;
	}

	public void setVersion(Date version) {
		this.version = version;
	}
		
	public long getApproverComments() {
		return approverComments;
	}

	public void setApproverComments(long approverComments) {
		this.approverComments = approverComments;
	}

	
	
	public long getApproverId() {
		return approverId;
	}

	public void setApproverId(long approverId) {
		this.approverId = approverId;
	}

	
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
		
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private ProsProfile prosProfile; // one to one
	
	//@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	//private Location userLocation; // one to one
	
	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Notification notiLocation; // one to one
	
	
	public ProsProfile getProsProfile() {
		return prosProfile;
	}

	public void setProsProfile(ProsProfile prosProfile) {
		this.prosProfile = prosProfile;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	/*public Location getUserLocation() {
		return userLocation;
	}

	public void setUserLocation(Location userLocation) {
		this.userLocation = userLocation;
	}
*/
	public Notification getNotiLocation() {
		return notiLocation;
	}

	public void setNotiLocation(Notification notiLocation) {
		this.notiLocation = notiLocation;
	}

	public int getPhone1() {
		return phone1;
	}

	public void setPhone1(int phone1) {
		this.phone1 = phone1;
	}

	public int getPhone2() {
		return phone2;
	}

	public void setPhone2(int phone2) {
		this.phone2 = phone2;
	}

	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UUID getUUIDNo() {
		return UUIDNo;
	}

	public void setUUIDNo(UUID uUIDNo) {
		UUIDNo = uUIDNo;
	}

	
	
}
