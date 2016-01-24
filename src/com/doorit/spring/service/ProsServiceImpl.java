package com.doorit.spring.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doorit.spring.dao.CustomerDAO;
import com.doorit.spring.dao.ProsDAO;
import com.doorit.spring.model.Feedback;
import com.doorit.spring.model.FeedbackWrapper;
import com.doorit.spring.model.Image;
import com.doorit.spring.model.Notification;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProductGroup;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Quotes;
import com.doorit.spring.model.RequestAnswer;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;
import com.doorit.spring.model.WrapRequestService;

@Service
public class ProsServiceImpl implements ProsService {
	
	
	private static final Logger logger = LoggerFactory.getLogger(ProsServiceImpl.class);
	
	
	@Autowired
	private CustomerDAO customerDAO;
	private ProsDAO prosDAO;
	
	public void setProsDAO(ProsDAO prosDAO) {
		this.prosDAO = prosDAO;
	}

@Transactional
@Override
public User userSettings(User user) {

	logger.info("usersetttings called     -"+"method name - userSettings  "+this.getClass().getSimpleName());
	
	
	return this.prosDAO.userSettings(user);
}


@Transactional
@Override
public boolean saveUserSettings(User userSettings) {
	
	
	logger.info("saveUserSettings called     -"+"method name - saveUserSettings  "+this.getClass().getSimpleName());
	
	User user = this.customerDAO.getUserById(userSettings.getUserId());
	user.setName(userSettings.getName());
	user.setEmailId(userSettings.getEmailId());
	user.setMobile(userSettings.getMobile());
	user.setAddress(userSettings.getAddress());
	user.setLocality(userSettings.getLocality());
user.setFormatted_address(userSettings.getFormatted_address());
  boolean success=this.prosDAO.saveUserSettings(user);
  
  if(success=true)
	  return true;
  else  return false;
}
@Transactional
@Override
public List<Product> getProductsListedfor(int proId){
	
	logger.info("get products listed  by vendor called     -"+"method name - getProductsListedfor  "+this.getClass().getSimpleName());
	
	
	ProsProfile prosProfile=null;
	List<Product> products=new ArrayList<Product>();
	prosProfile= this.prosDAO.getProsProfileByRequestId(proId);
	
	String[] productsId=(prosProfile.getListedIn()).split(",");
	
	for(int counter=0;counter<productsId.length;counter++){
		
		Product product=new Product();
		product=this.prosDAO.getProduct(productsId[counter]);
		
		products.add(product);
		
	}
	
	return products;
}
@Transactional
@Override
public ProsProfile getVendorProfile(int proId) {
	
	logger.info("get vendor profile  called     -"+"method name - getVendorProfile  "+this.getClass().getSimpleName());
	
	
	return this.prosDAO.getProsProfileByRequestId(proId);
}
@Transactional
@Override
public List<WrapRequestService> manageRequests(User user,String requestType) {
	
	
	logger.info("get vendor service leads  called     -"+"method name - manageRequests  "+this.getClass().getSimpleName());
	
	List<Quotes> requestsQuoted=null;
	List<WrapRequestService> requestServiceWrapperList=new ArrayList<WrapRequestService>();
	WrapRequestService wrapRequestService=null;
	List<RequestService> serviceRequests=new ArrayList<RequestService>();
	RequestService requestService=null;
	RequestAnswer requestAnswer=null;
	
	requestsQuoted=this.prosDAO.getRequestsQuoted(user,requestType);
	//System.out.println("requested quotes>>>>>"+requestsQuoted.size());
	
	for(Quotes quotes:requestsQuoted){
		requestService=new RequestService();
		User userObj=new User();
		wrapRequestService=new WrapRequestService();
		requestAnswer=new RequestAnswer();
	requestService=	this.prosDAO.getServiceREquest(quotes);
	requestAnswer=this.prosDAO.getAnswerById(requestService.getRequestId());
	userObj=this.customerDAO.getUserById(requestService.getUserId());
	
	
	//Change the date time format
	DateFormat formatter=new SimpleDateFormat("MMM dd,yyyy HH:mm");
	formatter.setTimeZone(TimeZone.getTimeZone("IST"));
	String date=formatter.format(quotes.getVersion());
	
	
	
	
	
	
	wrapRequestService.setServiceRequestedDate(date);
	
		wrapRequestService.setRequestService(requestService);	
	
	
	wrapRequestService.setUser(userObj);
	wrapRequestService.setRequestAnswer(requestAnswer);
	wrapRequestService.setQuote(quotes);
	
	requestServiceWrapperList.add(wrapRequestService);
	
	//System.out.println("this is what i am looking for"+requestServiceWrapperList.size());
	}
	
	
	return requestServiceWrapperList;
}
/*
	@Override
	@Transactional
	public void addProsProfile(ProsProfile profile) {
		this.prosDAO.addProsProfile(profile);
		
	}
	*/
@SuppressWarnings("null")
@Transactional
	@Override
	public List<WrapRequestService> fetchProsDashboard(User user) {
		
	logger.info("get vendor dashboard  called     -"+"method name - fetchProsDashboard  "+this.getClass().getSimpleName());
	
	List<WrapRequestService> wrapRequestServiceList=new ArrayList<WrapRequestService>();
	WrapRequestService wrapRequestService=null;
	List<RequestService> requestService=null;
	User userObj=null;
	RequestAnswer requestanswer=null;
	//return  this.prosDAO.fetchProsDashboard(user);
	ProsProfile prosProfile=(ProsProfile)this.prosDAO.getProsProfile(user);
	Boolean requestQuoted=false;
	//System.out.println(prosProfile.getListedIn());
	int QuoteNumber=0;
	
	/***************************
	**
	*
	*
	*
	************************
	*/
	/*if( prosProfile.getVerification().equals("N"))
	{
		System.out.println("Not Verified");
	}*/
	
	if(prosProfile.getListedIn()!=null ){	
	requestService=  this.prosDAO.fetchProsDashboard(prosProfile);
	}
	if(requestService!=null) {
	
	for(RequestService rs:requestService){
		
		if(rs.getStatus().equals("IP")){
			
			DateFormat formatter=new SimpleDateFormat("MMM dd,yyyy HH:mm");
			formatter.setTimeZone(TimeZone.getTimeZone("IST"));
			String date=formatter.format(rs.getVersion());
		
			
		QuoteNumber=this.customerDAO.getQuoteNumber(rs.getRequestId());
		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>"+rs.getRequestId());
		//System.out.println(">>>>>>>>>>>>>>>>>>>>>>>"+QuoteNumber);
    	userObj=	this.customerDAO.getUserById(rs.getUserId());
	    requestanswer=this.prosDAO.getAnswerById(rs.getRequestId());
	
	
	requestQuoted=this.prosDAO.getRequestsQuoted(rs.getRequestId(),user.getUserId());
	if(requestQuoted==false && prosProfile.getVerification().equals("Y"))
	{
		
		
		wrapRequestService=new WrapRequestService();
		wrapRequestService.setServiceRequestedDate(date);
		wrapRequestService.setUser(userObj);
		wrapRequestService.setQuoteNumber(QuoteNumber);
	wrapRequestService.setRequestService(rs);
wrapRequestService.setRequestAnswer(requestanswer);
	
	wrapRequestServiceList.add(wrapRequestService);
	}
	
	}
	}
	}
	return wrapRequestServiceList;
	}

@Override
@Transactional
public void placeBid(Quotes quotes) {
	
	logger.info("place bid  called     -"+"method name - placeBid  "+this.getClass().getSimpleName());
	
	this.prosDAO.placeBid(quotes);
	
}

@Override
@Transactional
public RequestAnswer getAnswerById(long id) {
	
	logger.info("get answer by id  called     -"+"method name - getAnswerById  "+this.getClass().getSimpleName());
	
	return this.prosDAO.getAnswerById(id);
	
}

@Override
@Transactional
public void addFeedback(Feedback feedback) {
	
	logger.info("add feedback called     -"+"method name - addFeedback  "+this.getClass().getSimpleName());
	
	
	 this.prosDAO.addFeedback(feedback);
	
}
@Transactional
@Override
public ProsProfile editProfile(User user) {
	
	
	logger.info("edit Profile called     -"+"method name - editProfile  "+this.getClass().getSimpleName());
	
	
	User userObj=this.customerDAO.getUserById(user.getUserId());
	ProsProfile prosProfile=this.prosDAO.getProsProfile(user);
	prosProfile.setUser(userObj);
	return prosProfile;
}
@Transactional
@Override
public Notification saveNotification(Notification notification,User user) {
	
	logger.info("save Notification called     -"+"method name - saveNotification  "+this.getClass().getSimpleName());
	
	Notification notificationObj = this.customerDAO.getNotificationByUserId(user.getUserId());
	notificationObj.setEmail(notification.isEmail());
	notificationObj.setDailySummary(notification.isDailySummary());
	notificationObj.setJobMails(notification.isJobMails());
	notificationObj.setNewsLetter(notification.isNewsLetter());
	notificationObj.setSms(notification.isSms());
	return this.prosDAO.saveNotification(notificationObj);
}

@Override
@Transactional
public Quotes getQuoteById(long quoteId) {
	
	logger.info("get  Quote by id  called     -"+"method name - getQuoteById  "+this.getClass().getSimpleName());
	
	return this.prosDAO.getQuoteById(quoteId);
}

@Override
@Transactional
public List<FeedbackWrapper> getFeedback(long prosId) {
	
	
	logger.info("get feedback list  called     -"+"method name - getFeedback  "+this.getClass().getSimpleName());
	
	List<Feedback> feedbackList= this.prosDAO.getFeedback(prosId);
	List<FeedbackWrapper> feedbackwrapperList=new ArrayList<FeedbackWrapper>();
	User user=null;
	FeedbackWrapper feedbackWrapper=null;
	
	
	for(Feedback fb:feedbackList){
		
		user=new User();
		feedbackWrapper=new FeedbackWrapper();		
		user=this.customerDAO.getUserById(fb.getUserId());
		feedbackWrapper.setFeedback(fb);
		feedbackWrapper.setUser(user);
		DateFormat formatter=new SimpleDateFormat("MMM dd,yyyy HH:mm");
		formatter.setTimeZone(TimeZone.getTimeZone("IST"));
		String feedbackDate=formatter.format(fb.getVersion());
		feedbackWrapper.setFeedbackRating(fb.getRating());
		feedbackWrapper.setFedbackWrittenDate(feedbackDate);
	
		feedbackwrapperList.add(feedbackWrapper);
	}
	
	return feedbackwrapperList;
}
@Transactional
@Override
public boolean saveEditProfile(ProsProfile prosProfile) {
	
	
	logger.info("save Edit Profile  called     -"+"method name - saveEditProfile  "+this.getClass().getSimpleName());
	
	User user=this.customerDAO.getUserById(prosProfile.getUser().getUserId());
	user.setAddress(prosProfile.getUser().getAddress());
	user.setLocality(prosProfile.getUser().getLocality());
	user.setFormatted_address(prosProfile.getUser().getFormatted_address());
	user.setLat(prosProfile.getUser().getLat());
	user.setLng(prosProfile.getUser().getLng());
	user.setPostal_code(prosProfile.getUser().getPostal_code());
	user.setLocality(prosProfile.getUser().getLocality());
	user.setSublocality(prosProfile.getUser().getSublocality());
	user.setCountry(prosProfile.getUser().getCountry());
	user.setState(prosProfile.getUser().getState());
	ProsProfile prosProfileObj=this.prosDAO.getProsProfile(prosProfile.getUser());
	prosProfileObj.setCompanyName(prosProfile.getCompanyName());
	prosProfileObj.setWebsite(prosProfile.getWebsite());
	prosProfileObj.setCompanyProfile(prosProfile.getCompanyProfile());
	prosProfileObj.setYearOfEstablishment(prosProfile.getYearOfEstablishment());
	prosProfileObj.setBussinessType(prosProfile.getBussinessType());
	
	/*if(prosProfile.getBussinessType().equals("CTOM") || prosProfile.getBussinessType().equals("NEITHER")){
		
		prosProfileObj.setBussinessDistance(null);
	}
	else{
		
		prosProfileObj.setBussinessDistance(prosProfile.getBussinessDistance());
	}*/
	prosProfileObj.setUser(user);
	this.prosDAO.saveEditProfile(prosProfileObj);
	return true;
}
@Transactional
@Override
public int getFeedbackNumber(long prosId) {
	
	logger.info("get Feedback Number   called     -"+"method name - getFeedbackNumber  "+this.getClass().getSimpleName());
	
	
	return this.prosDAO.getfeedbackNumber(prosId);
}
@Transactional
@Override
public int getFeedbackAvg(long prosId) {
	
	logger.info("get Feedbac kAvg   called     -"+"method name - getFeedbackAvg  "+this.getClass().getSimpleName());
	
	
	return this.prosDAO.getFeedbackAvg(prosId);
}

@Transactional
@Override
public boolean changePassword(User userSettings,User user) {
	
	
	logger.info("change Password   called     -"+"method name - changePassword  "+this.getClass().getSimpleName());
	
	
	boolean IsSucess=this.prosDAO.changePassword(userSettings,user);
	if(IsSucess){
		return IsSucess;
	}
	else{
		return false;
	}
}
@Transactional
@Override
public Notification getUserNotification(User user) {
	
	
	logger.info("get notification   called     -"+"method name - getUserNotification  "+this.getClass().getSimpleName());
	
	
	return this.prosDAO.getUserNotification(user);
}
@Transactional
@Override
public void saveUpdatedServices(ProsProfile prosProfileObj) {
	
	logger.info("save  services offered by vendors   called     -"+"method name - saveUpdatedServices  "+this.getClass().getSimpleName());
	
	this.prosDAO.saveUpdatedServices(prosProfileObj);
	
}
@Transactional
@Override
public void saveImage(Image img) {
	
	logger.info("save Image   called     -"+"method name - saveImage  "+this.getClass().getSimpleName());
	
	this.prosDAO.saveImage(img);
	
}

@Transactional
@Override
public WrapRequestService feedback(int prosid,int servicerequestid) {
	
	logger.info("feedback   called     -"+"method name - feedback  "+this.getClass().getSimpleName());
	
	
	WrapRequestService wrapRequestService=new WrapRequestService();
	RequestService requestservice=this.customerDAO.getRequestServiceById(new Long(servicerequestid));
	wrapRequestService.setRequestService(requestservice);
	wrapRequestService.setProduct(this.customerDAO.getProductById(new Long(requestservice.getProsId())));
	// TODO Auto-generated method stub
	return wrapRequestService;
}

@Transactional
@Override
public List<User> getProsEmailIds(long productId){
	
	logger.info("get list of users   called     -"+"method name - getProsEmailIds  "+this.getClass().getSimpleName());
	
	return this.prosDAO.getProsEmailIds(productId);
}


@Transactional
@Override
public int getQuotesNoforPros(String requestType, User user) {
	
	logger.info("get Quotes No for Pros  called   -"+"method name - getQuotesNoforPros  "+this.getClass().getSimpleName());
	
	return this.prosDAO.getQuotesNoforPros(requestType,user);
}

@Transactional
@Override
public boolean isRequestQuoted(String requestID, User user) {
	
	logger.info("is request quoted  by vendor  called   -"+"method name - isRequestQuoted  "+this.getClass().getSimpleName());
	
	boolean requestQuoted=this.prosDAO.isRequestQuoted(requestID,user);
	
	return requestQuoted;
}




		
}
