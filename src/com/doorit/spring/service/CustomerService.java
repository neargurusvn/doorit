package com.doorit.spring.service;

import java.util.List;

import com.doorit.spring.model.Option;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.Question;
import com.doorit.spring.model.RequestAnswer;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;
import com.doorit.spring.model.UserProsProfile;
import com.doorit.spring.model.WrapRequestService;

public interface CustomerService {
	
	
	public void addUser(UserProsProfile user);
	public void addRequest(WrapRequestService rs);
	public List<User> listUser();
	public Product getProductById(long id);
	public Question getQuestionById(long id);
	public Option getOptionById(long id);
	public List<Question> getQuesByProductId(long id);
	public List<Option> getOptionByQueId(long id);
	public void saveAnswer(RequestAnswer answer);
	public User getUserByEmail(String email);
	public List<WrapRequestService> getUserManageRequests(User user,String requestType);
	public List<WrapRequestService> getQuotesRecived(long serviceRequestId);
	
	public User verifyUser(User user);
	public RequestService getRequestServiceById(long id);
	public void changeAwardStatus(WrapRequestService wrapRequestService);
	public User addCustUser(User user);
	public void saveRequestStatus(RequestService serviceReuqest);
	public User getServiceUser(long requestId);
	public User findByUserName(String username);
	public User getUserById(long userId);
	public int getInProgressNo(String string,User user);
	public int getWIPNo(String string,User user);
	public boolean isVendorVerified(User user);
	public void toogleEmailSend(long userId, boolean enabledVal);
}
