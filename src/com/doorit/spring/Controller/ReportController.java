package com.doorit.spring.Controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.doorit.spring.model.Reports;
import com.doorit.spring.model.User;
import com.doorit.spring.model.WrapSuccessError;
import com.doorit.spring.service.ReportService;


@Controller
public class ReportController {
	
	private Logger LOGGER = Logger.getLogger(ReportController.class);
	
	@Autowired
	ReportService reportService;
	
	
	/***********************************copyright@Nearguru************************************************************
	 * method -fetch service request
	 * created date - 2nd  May 2015
	 * ******************************************************************************************/
	@RequestMapping(value="/admin/fetchRequests",method={RequestMethod.POST,RequestMethod.GET})
	public String fetchRequests(Model model,@ModelAttribute("report") Reports report){
	
		final String methodname="fetchRequests(Model model,@ModelAttribute("+"report"+") Reports report)";
		LOGGER.debug("fetch Requests initiated"+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		List<Reports> reportList=this.reportService.fetchRequests();
		model.addAttribute("reportList",reportList);
		LOGGER.debug("Requests fetched successfully,request size"+reportList.size()+" - "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		return "reports";
	}
	/***********************************copyright@Nearguru************************************************************
	 * method -fetch users 
	 * created date - 2nd  May 2015
	 * ******************************************************************************************/
	@RequestMapping(value="/admin/fetchUsers",method={RequestMethod.POST,RequestMethod.GET})
	public String fetchUsers(Model model,@ModelAttribute("report") Reports report){
	
		final String methodname="fetchUsers(Model model,@ModelAttribute("+"report"+") Reports report)";
		LOGGER.debug("fetch users initiated"+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		List<Reports> reportList=this.reportService.fetchUsers();			
		model.addAttribute("reportList",reportList);
		LOGGER.debug("users fetched  successfully,user size"+reportList.size()+" - "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		return "userreports";
	}
	/***********************************copyright@Nearguru************************************************************
	 * method -fetch professionals 
	 * created date - 2nd  May 2015
	 * ******************************************************************************************/
	@RequestMapping(value="/admin/fetchVendors",method={RequestMethod.POST,RequestMethod.GET})
	public String fetchVendors(Model model,@ModelAttribute("report") Reports report){
	
		final String methodname="fetchVendors(Model model,@ModelAttribute("+"report"+") Reports report)";
		LOGGER.debug("fetch professionals initiated"+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		List<Reports> reportList=this.reportService.fetchVendors();			
		model.addAttribute("reportList",reportList);
		LOGGER.debug("fetch professionals initiated"+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());	
		return "vendorreports";
	}
}
