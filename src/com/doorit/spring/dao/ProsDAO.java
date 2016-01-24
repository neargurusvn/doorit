package com.doorit.spring.dao;

import java.util.List;

import com.doorit.spring.model.Feedback;
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


public interface ProsDAO {
	public void addProsProfile(ProsProfile profile);
	public void placeBid(Quotes quotes);
	public List<RequestService> fetchProsDashboard(ProsProfile prosProfile);
	public RequestAnswer getAnswerById(long id);

	public User userSettings(User user);

	
	public void saveImage(Image img);
	
	

	public List<RequestService> manageRequestsVendor();
	public ProsProfile getProsProfile(User user);
	
	public void addFeedback(Feedback feedback);
	public List<Quotes> getRequestsQuoted(User user,String status);
	public RequestService getServiceREquest(Quotes quotes);
	public ProsProfile getProsProfileByRequestId(long prosId);
	public Boolean getRequestsQuoted(long l, long userId);
	public Product getProduct(String string);
	public Notification saveNotification(Notification notification);
	public Quotes getQuoteById(long quoteId);
	public List<Feedback> getFeedback(long prosId);
	public int getfeedbackNumber(long prosId);
	public int getFeedbackAvg(long prosId);
	public void saveEditProfile(ProsProfile prosProfile);
	public boolean changePassword(User userSettings, User user);
	public Notification getUserNotification(User user);
	public void saveUpdatedServices(ProsProfile prosProfileObj);
	public boolean saveUserSettings(User userSettings);
	public List<Quotes> getQuotesbyRequestId(long requestId);
	public void updateQuote(Quotes quoteObj);
	public List<User> getProsEmailIds(long productId);
	
	
	public int getQuotesNoforPros(String requestType, User user);
	public boolean isRequestQuoted(String requestID, User user);

	
	
}
