package com.doorit.spring.dao;

import java.util.List;

import com.doorit.spring.model.Notification;
import com.doorit.spring.model.Option;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.Question;
import com.doorit.spring.model.Quotes;
import com.doorit.spring.model.RequestAnswer;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;
import com.doorit.spring.model.WrapRequestService;



public interface CustomerDAO {

	public boolean isVendorVerified(User user);
	public User addUser(User user);
	public WrapRequestService addRequest(WrapRequestService rs);
	public List<User> listUser();
	public Product getProductById(long id);
	public User getUserByEmail(String email);
	public Question getQuestionById(long id);
	public Option getOptionById(long id);
	public List<Question> getQuesByProductId(long id);
	public List<Option> getOptionByQueId(long id);
	
	public void saveAnswer(RequestAnswer answer);
	public List<RequestService> getRequests(long id);
	public List<Quotes> getQuotesRecived(long serviceRequestId);
	public User verifyUser(User user);
	public RequestService getRequestServiceById(long id);
	public User getUserById(long userId);
	public List<RequestService> getUserServiceRequests(User user,String requestType);
	public Integer getQuoteNumber(long requestId);
	public Quotes getQuote(long requestId);
	public void changeAwardStatus(WrapRequestService wrapRequestService);
	public void changeRequestStatus(WrapRequestService wrapRequestService);
	//public void addLocation(Location location);
public void saveRequestStatus(RequestService requestServiceObj);
	public Notification getNotificationByUserId(long userId);
	public User findByUserName(String username);
	public void changeQuoteStatus(Quotes quotes);
	public Quotes getQuotebyQuoteId(long quoteId);
	public User checkvalidUser(User user);
	public int getINProgressNo(String requestType,User user);
	public int getWIPNo(String requestType,User user);
	public void toogleEmailSend(User user);
	
}
