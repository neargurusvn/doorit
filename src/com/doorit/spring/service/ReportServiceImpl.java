package com.doorit.spring.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.TimeZone;

import org.apache.velocity.runtime.directive.Parse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doorit.spring.dao.AdminDAO;
import com.doorit.spring.dao.CustomerDAO;
import com.doorit.spring.dao.ProsDAO;
import com.doorit.spring.dao.ReportDao;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Reports;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;
//import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private CustomerDAO customerDAO;
	
	@Autowired
	private AdminDAO adminDAO;
	
	
	@Autowired
	private ReportDao reportDAO;  
	
	
	public void setReportDAO(ReportDao reportDAO) {
		this.reportDAO = reportDAO;
	}

	private static final Logger LOGGER= LoggerFactory.getLogger(ReportServiceImpl.class);
	
	
	/***********************************copyright@Nearguru************************************************************
	 * method -fetch list of service requests
	 * created date - 2nd  May 2015
	 * ******************************************************************************************/
	@Transactional
	@Override
	public List<Reports> fetchRequests() {
		
		final String methodname="fetchRequests()";
		LOGGER.debug("fetch Requests - report Service Layer  "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		DateFormat formatter=new SimpleDateFormat("MMM dd,yyyy HH:mm");
		formatter.setTimeZone(TimeZone.getTimeZone("IST"));			
		List<Reports> reportList=new ArrayList<Reports>();			
		List<RequestService> requestList=this.reportDAO.fetchRequests();		
		for(RequestService requestService:requestList){	
			
			try{
				
				Reports report=new Reports();			
				report.setRequestService(requestService);			
				String date=formatter.format(report.getRequestService().getVersion());
				report.setDate(date);			
				User user=this.customerDAO.getUserById(requestService.getUserId());
				report.setUser(user);
				Product product=null;
				
				product=this.adminDAO.getProductById(requestService.getProdcutId());
				report.setProduct(product);	
				reportList.add(report);
			}
			catch(Exception ex){
				
				LOGGER.debug("fetch Requests - Exception while fetching request -  "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName()+" -- Exception is"+ex.getMessage());	
			}
			
		}
		LOGGER.debug("fetch Requests - report Service Layer - request size -"+reportList.size()+" - "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		return reportList;
	}
	
	/***********************************copyright@Nearguru************************************************************
	 * method -fetch list of users
	 * created date - 2nd  May 2015
	 * ******************************************************************************************/
	@Transactional 
	@Override
	public List<Reports> fetchUsers() {		
		
		final String methodname="fetchUsers()";
		LOGGER.debug("fetch users - report Service Layer  "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		DateFormat formatter=new SimpleDateFormat("MMM dd,yyyy HH:mm");
		formatter.setTimeZone(TimeZone.getTimeZone("IST"));
		List<Reports> reportList=new ArrayList<Reports>();
		List<User> userList=this.reportDAO.fetchUsers();
		for(User user:userList){
			Reports report=new Reports();
			report.setUser(user);
			String date=formatter.format(user.getVersion());
			report.setDate(date);
			reportList.add(report);
		}
		LOGGER.debug("fetch users - report Service Layer - users size -"+reportList.size()+" - "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		return reportList;
	}
	
	/***********************************copyright@Nearguru************************************************************
	 * method -fetch list of professionals
	 * created date - 2nd  May 2015
	 * ******************************************************************************************/
	@Transactional
	@Override
	public List<Reports> fetchVendors() {
		
		String productListedFor="";
		final String methodname="fetchVendors()";
		LOGGER.debug("fetch professionals - report Service Layer  "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		DateFormat formatter=new SimpleDateFormat("MMM dd,yyyy HH:mm");
		formatter.setTimeZone(TimeZone.getTimeZone("IST"));		
		List<Reports> reportList=new ArrayList<Reports>();
		List<ProsProfile> prosList=this.reportDAO.fetchVendors();		
		for(ProsProfile prosProfile:prosList){			
			Reports report=new Reports();
			User user=new User();
			
			//Seprate the array string g based  on delimeter ,
			//List<String> productList = Arrays.asList(prosProfile.getListedIn().split(","));
		//(String productId:productList){/*
			
				
			
				//Product product=this.adminDAO.getProductById(new Long(productId));
				
				//productListedFor+=product.getProductName()+",";
				
				
			//}*/
			//report.setListedin(productListedFor);  
			report.setProsProfile(prosProfile);  
			report.setListedin(prosProfile.getListedIn());
			user=this.customerDAO.getUserById(prosProfile.getUser().getUserId());
			String date=formatter.format(user.getVersion());
			report.setDate(date);
			report.setUser(user);
			reportList.add(report);
		}
		LOGGER.debug("fetch vendors - report Service Layer - users size -"+reportList.size()+" - "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		return reportList;
	}

}
