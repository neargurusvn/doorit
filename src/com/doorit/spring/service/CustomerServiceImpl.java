package com.doorit.spring.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TimeZone;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import com.doorit.spring.Controller.CustomerController;
import com.doorit.spring.dao.CustomerDAO;
import com.doorit.spring.dao.DocumentDAO;
import com.doorit.spring.dao.ProsDAO;
import com.doorit.spring.model.Document;
import com.doorit.spring.model.Notification;
import com.doorit.spring.model.Option;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Question;
import com.doorit.spring.model.Quotes;
import com.doorit.spring.model.RequestAnswer;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;
import com.doorit.spring.model.UserProsProfile;
import com.doorit.spring.model.WrapRequestService;

public class CustomerServiceImpl implements CustomerService , UserDetailsService {

	private Logger logger = Logger.getLogger(CustomerServiceImpl.class);
	
	@Autowired
	private ProsDAO prosDAO;
	private CustomerDAO customerDAO;
	
	
	@Autowired
	private DocumentDAO documentDAO;
	
	public void setCustomerDAO(CustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	
	@Transactional
	public void addUser(UserProsProfile userProsProfile) {
		
		
		logger.info("addUser(UserProsProfile userProsProfile)>>add user  called"+this.getClass().getSimpleName());

		Notification notification = new Notification();
		//System.out.println(">>>>>>>>>>>>>>>>>>>> add cust user");
		User user = this.customerDAO.addUser(userProsProfile.getUser());
		if(user.getUserId()!=0){
		userProsProfile.getProfile().setUser(user);
		//userProsProfile.getUserLocation().setUser(user);
		notification.setUser(user);
		this.prosDAO.addProsProfile(userProsProfile.getProfile());
		//this.customerDAO.addLocation(userProsProfile.getUserLocation());
		
		this.prosDAO.saveNotification(notification);
		
		}
		
	}


	@Transactional
	@Override
	public Product getProductById(long id) {
		
		logger.info(" getProductById(long id)>>get product based on id  called>>>"+this.getClass().getSimpleName());
		return this.customerDAO.getProductById(id);
	}


	@Transactional
	@Override
	public Question getQuestionById(long id) {
		
		logger.info("  getQuestionById(long id)>>get question based on id  called>>>"+this.getClass().getSimpleName());
		return this.customerDAO.getQuestionById(id);
	}


	@Transactional
	@Override
	public Option getOptionById(long id) {
		
		logger.info("getOptionById(long id)>>get option based on id  called>>>"+this.getClass().getSimpleName());
		return this.customerDAO.getOptionById(id);
	}


	@Transactional
	@Override
	public List<Question> getQuesByProductId(long id) {
		
		logger.info(" getQuesByProductId(long id)  called>>>"+this.getClass().getSimpleName());
		return this.customerDAO.getQuesByProductId( id);
	}


	@Transactional
	@Override
	public List<Option> getOptionByQueId(long id) {
		
		logger.info("getOptionByQueId(long id)  called>>>"+this.getClass().getSimpleName());
		return this.customerDAO.getOptionByQueId( id);
	}


@Transactional
	@Override
	public void saveAnswer(RequestAnswer answer) {
	
	logger.info("saveAnswer(RequestAnswer answer) called>>>"+this.getClass().getSimpleName());
				this.customerDAO.saveAnswer(answer);
		
	}


@Override
@Transactional
public List<User> listUser() {
	
	logger.info("listUser() called"+this.getClass().getSimpleName());
	return this.customerDAO.listUser();
}


@Override
@Transactional
public User getUserByEmail(String email) {
	
	logger.info(" getUserByEmail(String email) called>>>"+this.getClass().getSimpleName());
	 return this.customerDAO.getUserByEmail(email);
}



@Override
@Transactional
public void addRequest(WrapRequestService rs) {
	
	logger.info("addRequest(RequestService rs) called>>>"+this.getClass().getSimpleName());
	this.customerDAO.addRequest(rs);
	 
	
}


@Transactional
public List<WrapRequestService> getUserManageRequests(User user,String requestType) {
	
	logger.info("getUserManageRequests(User user,String requestType) called>>>"+this.getClass().getSimpleName());
//	return null;
	List<RequestService> serviceRequests=new ArrayList<RequestService>();
	List<WrapRequestService> wrapRequestServiceList=new ArrayList<WrapRequestService>();
	WrapRequestService wrapRequestService=null;
	RequestAnswer requestAnswer=null;
	
	Integer quoteNumber;
	serviceRequests= this.customerDAO.getUserServiceRequests(user,requestType);
	
	for(RequestService requestService :serviceRequests){
		wrapRequestService=new WrapRequestService();
		requestAnswer=new RequestAnswer();
		requestAnswer=this.prosDAO.getAnswerById(requestService.getRequestId());
		wrapRequestService.setRequestService(requestService);
		wrapRequestService.setRequestAnswer(requestAnswer);
		
		DateFormat formatter=new SimpleDateFormat("MMM dd,yyyy HH:mm");
		formatter.setTimeZone(TimeZone.getTimeZone("IST"));
		String date=formatter.format(requestService.getVersion());
		if(requestService.getProsId()!=0){
			
			wrapRequestService.setProsProfile(this.prosDAO.getProsProfileByRequestId(requestService.getProsId()));
		}
		wrapRequestService.setServiceRequestedDate(date.toString());
		//I quote=new Quotes();
		quoteNumber=this.customerDAO.getQuoteNumber(requestService.getRequestId());
		
	wrapRequestService.setQuoteNumber(quoteNumber);
		//wrapRequestService.setQuotedRequests(quotesList);
		wrapRequestServiceList.add(wrapRequestService);
	}
	return wrapRequestServiceList;
}

@Transactional
@Override
public List<WrapRequestService> getQuotesRecived(long serviceRequestId) {
	
	logger.info("getQuotesRecived(long serviceRequestId) called>>"+this.getClass().getSimpleName());
	ProsProfile prosProfile=null;
	User UserObj=null;
	List<WrapRequestService> wrapRequestServiceList=new LinkedList<WrapRequestService>();
	WrapRequestService wrapRequestService=null;	
	List<Quotes> quotesLst=this.customerDAO.getQuotesRecived(serviceRequestId);	
	RequestService requestService=new RequestService();
	requestService=this.customerDAO.getRequestServiceById(serviceRequestId);
	if(quotesLst.size() != 0){
	for(Quotes quote:quotesLst){
		wrapRequestService=new WrapRequestService();		
		UserObj=new User();
		
		prosProfile=new ProsProfile();	
		if(quote != null){
			
			
				
				Document document=new Document();
				DateFormat formatter=new SimpleDateFormat("MMM dd,yyyy HH:mm");
				formatter.setTimeZone(TimeZone.getTimeZone("IST"));
				String date=formatter.format(quote.getVersion());
				
				document=this.documentDAO.getQuoteFile(quote.getProsId(), serviceRequestId);
			wrapRequestService.setServiceRequestedDate(date);
			prosProfile=this.prosDAO.getProsProfileByRequestId(quote.getProsId());
			int feedbackNumber=this.prosDAO.getfeedbackNumber(quote.getProsId());
			int feedbackAvg=this.prosDAO.getFeedbackAvg(quote.getProsId());
			UserObj=this.customerDAO.getUserById(quote.getProsId());
			wrapRequestService.setQuote(quote);
			wrapRequestService.setFeedbackAvg(feedbackAvg);
			wrapRequestService.setFeedbackCount(feedbackNumber);
			wrapRequestService.setProsProfile(prosProfile);
			wrapRequestService.setUser(UserObj);
			wrapRequestService.setRequestService(requestService);
			if(document!=null){
			wrapRequestService.setDocument(document);
			}
			
			wrapRequestServiceList.add(wrapRequestService);
				
			
			
			
		}
	}
	}
	return wrapRequestServiceList;
}


@Transactional
@Override
public User verifyUser(User user) {

	logger.info("verifyUser(User user) called>>"+this.getClass().getSimpleName());
if(user.getEmailId()!=null && user.getPassword()!=null){
 user =this.customerDAO.verifyUser(user);
}
if(user.getEmailId()!=null && user.getPassword()==null){
	 user =this.customerDAO.checkvalidUser(user);
	}
	return user;
}



@Override
@Transactional
public RequestService getRequestServiceById(long id) {
	
	logger.info("getRequestServiceById(long id) called>>"+this.getClass().getSimpleName());

	return this.customerDAO.getRequestServiceById(id);
}


@Transactional
@Override
public void changeAwardStatus(WrapRequestService wrapRequestService) {
	
	
	logger.info("changeAwardStatus(WrapRequestService wrapRequestService) called>>"+this.getClass().getSimpleName());
	List<Quotes> quotesRecived=this.customerDAO.getQuotesRecived(wrapRequestService.getRequestService().getRequestId());
	
	for(Quotes quotes:quotesRecived){
		//System.out.println(">>>>>>>>>>>>>>Quotes "+quotes.getProsId());
		
		
		if(wrapRequestService.getQuote().getProsId()==quotes.getProsId()){
			
			//Quotes quoteObj=this.customerDAO.getQuotebyQuoteId(quotes.getQuoteId());
		 // quotes.setStatus("OLD");
			
			//quoteObj.set
			
			
			String statusReason="Project has been awarded to Other Professional";
			//RequestService requestService=this.customerDAO.getRequestServiceById(wrapRequestService.getRequestService().getRequestId());
			wrapRequestService.getRequestService().setStatusReason(statusReason);
			
			this.customerDAO.changeRequestStatus(wrapRequestService);
			this.customerDAO.changeQuoteStatus(quotes);
			this.customerDAO.changeAwardStatus(wrapRequestService);
			//System.out.println("i am out of this");
		}
		
		else{
			
			
		}
	}
	
}



@Override
@Transactional
public User addCustUser(User user) {
	
	logger.info("addCustUser(User user) called"+this.getClass().getSimpleName());
	Notification notification = new Notification();
	//System.out.println(">>>>>>>>>>>>>88>>>>>>> add cust user");
	User user1 =this.customerDAO.addUser(user);
	if(user.getMobile()==null || user.getMobile().equals("")){
		
		notification.setSms(false);
	}
	if(user1.getUserId()!=0){
	notification.setUser(user);
	this.prosDAO.saveNotification(notification);
	
	
	
	}
	return user1;
}



@Transactional(readOnly=true)
@Override
public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {

	logger.info("loadUserByUsername(final String username) called>>"+this.getClass().getSimpleName());
	//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<");
	User user = customerDAO.findByUserName(username);
	if(user == null){
		throw new UsernameNotFoundException(username + " not found");
	}
	//user = new User();
	//user.setUsername("anil");
	user.setEnabled(true);
	//user.setPassword("1234");
	//UserRole role = new UserRole();
	//role.setRole("ROLE_USER");
	//role.setUser(user);
		
	//System.out.println("TTTTTTTTTTTTTTTTT"+user.getUserId());
	List<GrantedAuthority> authorities = buildUserAuthority(user.getUserRole());
	
	return buildUserForAuthentication(user, authorities);
	
}

// Converts com.mkyong.users.model.User user to
// org.springframework.security.core.userdetails.User
private org.springframework.security.core.userdetails.User buildUserForAuthentication(User user, List<GrantedAuthority> authorities) {
	return new org.springframework.security.core.userdetails.User(user.getEmailId(), user.getPassword(), user.isEnabled(), true, true, true, authorities);
}

private List<GrantedAuthority> buildUserAuthority(Set<com.doorit.spring.model.UserRole> userRoles) {

	Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

	// Build user's authorities
	for (com.doorit.spring.model.UserRole userRole : userRoles) {
		setAuths.add(new org.springframework.security.core.authority.SimpleGrantedAuthority(userRole.getRole()));
	}

	List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);

	return Result;
}
@Transactional
@Override
public User getServiceUser(long requestId) {
	
	logger.info("getServiceUser(long requestId) called>>"+this.getClass().getSimpleName());
	
	RequestService requestService=this.customerDAO.getRequestServiceById(requestId);
	User user=this.customerDAO.getUserById(requestService.getUserId());
	return user;
}

@Transactional
@Override
public void saveRequestStatus(RequestService serviceReuqest) {
	
	logger.info("saveRequestStatus(RequestService serviceReuqest) called>>"+this.getClass().getSimpleName());
	RequestService requestServiceObj=this.customerDAO.getRequestServiceById(serviceReuqest.getRequestId());
	//System.out.println(requestServiceObj.getRequestId());
	List<Quotes> quotes=this.prosDAO.getQuotesbyRequestId(requestServiceObj.getRequestId());
	for(Quotes quote:quotes){
		
		
			
			Quotes QuoteObj=this.prosDAO.getQuoteById(quote.getQuoteId());
			
			QuoteObj.setStatus("OLD");
			this.prosDAO.updateQuote(QuoteObj);
		
			
	
			
	}
	requestServiceObj.setStatus(serviceReuqest.getStatus());
	requestServiceObj.setStatusReason(serviceReuqest.getStatusReason());
	this.customerDAO.saveRequestStatus(requestServiceObj);
	
}



@Override
@Transactional
public User findByUserName(String username) {
	
	logger.info("findByUserName(String username) called>>"+this.getClass().getSimpleName());
	return customerDAO.findByUserName(username);
}



@Override
@Transactional
public User getUserById(long userId) {
	
	logger.info("getUserById(long userId) called>>"+this.getClass().getSimpleName());
	return customerDAO.getUserById(userId);
}


@Transactional
@Override
public int getInProgressNo(String requestType,User user) {
	
	logger.info("getInProgressNo called>>"+this.getClass().getSimpleName());
	return this.customerDAO.getINProgressNo(requestType,user);
}


@Transactional
@Override
public int getWIPNo(String requestType,User user) {
	
	logger.info(" getWIPNo called>>"+this.getClass().getSimpleName());
	return this.customerDAO.getWIPNo(requestType,user);
}

@Transactional
@Override
public boolean isVendorVerified(User user) {
	
		logger.info(" isVendorVerified called>>"+this.getClass().getSimpleName());
	
	
		User UserObj=this.customerDAO.getUserById(user.getUserId());
	
		boolean isVerified=false;
		
		
			UserObj.setEnabled(true);
			isVerified=this.customerDAO.isVendorVerified(UserObj);
			
	
		return isVerified;
}

/*****************************************************************
 * 
 *create by :divyanayan
 *created date :09-05-2014
 *functionality :toggle the email send option to the customer from the admin section
 * 
 **********************************************************************/
@Transactional
@Override
public void toogleEmailSend(long userId, boolean enabledVal) {
	
	String methodName ="toogleEmailSend(long userId, boolean enabledVal) ";
	logger.info(methodName+ " toggle on and off email id>>"+this.getClass().getSimpleName());
	
	User user=this.customerDAO.getUserById(userId);
	user.setEnabled(enabledVal);
	
	this.customerDAO.toogleEmailSend(user);
	
	
}



}
