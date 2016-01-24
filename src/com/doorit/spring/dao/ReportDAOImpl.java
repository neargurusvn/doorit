package com.doorit.spring.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;

@Repository
public class ReportDAOImpl implements ReportDao {

	
	private static final Logger LOGGER = LoggerFactory.getLogger(ReportDao.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	/***********************************copyright@Nearguru************************************************************
	 * method -fetch service requests
	 * created date - 2nd  May 2015
	 * ******************************************************************************************/
	@Override
	public List<RequestService> fetchRequests() {
		
		final String methodname="fetchRequests() ";
		List<RequestService> requestList=null;
		try{
			LOGGER.debug("fetch request initiated in DAO Layer"+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
			Session session = this.sessionFactory.getCurrentSession();
		    requestList = session.createQuery("from RequestService ORDER BY version desc").list();	
			LOGGER.debug("fetch request completed successfully in DAO Layer,request size"+requestList.size()+" - "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		}
		catch(Exception ex){		
			LOGGER.error(" method name - "+methodname+" - "+ this.getClass().getSimpleName()+"Exception:" + ex);
		}
		
		return requestList;
	}
	
	/***********************************copyright@Nearguru************************************************************
	 * method -fetch users list
	 * created date - 2nd  May 2015
	 * ******************************************************************************************/
	@Override
	public List<User> fetchUsers() {
		
		final String methodname="fetchUsers()";
		List<User> userList=null;
		try{
			LOGGER.debug("fetch users initiated in DAO Layer"+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
			Session session = this.sessionFactory.getCurrentSession();
			userList = session.createQuery("from User ORDER BY version desc").list();
			LOGGER.debug("fetch users completed successfully  in DAO Layer,users size"+userList.size()+" - "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		}
		catch(Exception ex){
			LOGGER.error(" method name - "+methodname+" - "+ this.getClass().getSimpleName()+"Exception:" + ex);
		}
		return userList;
		
	}
	/***********************************copyright@Nearguru************************************************************
	 * method -fetch professionals list
	 * created date - 2nd  May 2015 
	 * ******************************************************************************************/
	@Override
	public List<ProsProfile> fetchVendors() {
		
		final String methodname="fetchVendors()";
		List<ProsProfile> prosList=null;
		try{
			LOGGER.debug("fetch vendors initiated in DAO Layer"+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
			Session session = this.sessionFactory.getCurrentSession();
		    prosList = session.createQuery("from ProsProfile ORDER BY version desc").list();
			LOGGER.debug("fetch vendors completed successfully  in DAO Layer,users size"+prosList.size()+" - "+" - method name - "+methodname+" - "+ this.getClass().getSimpleName());
		}
		catch(Exception ex){
			LOGGER.error(" method name - "+methodname+" - "+ this.getClass().getSimpleName()+"Exception:" + ex);
		}
		return prosList;
	}

}
