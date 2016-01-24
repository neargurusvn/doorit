package com.doorit.spring.service;

import java.util.List;

import com.doorit.spring.model.Feedback;
import com.doorit.spring.model.FeedbackWrapper;
import com.doorit.spring.model.Image;
import com.doorit.spring.model.Notification;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProductGroup;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Quotes;
import com.doorit.spring.model.RequestAnswer;
import com.doorit.spring.model.User;
import com.doorit.spring.model.WrapRequestService;


public interface ProsService {
	
	//public void addProsProfile(UserProsProfile profile);
	public void placeBid(Quotes quotes);
	public List<WrapRequestService> fetchProsDashboard(User user);

	public User  userSettings(User user);
	public boolean saveUserSettings(User userSettings);
	public ProsProfile getVendorProfile(int proId);
	public List<WrapRequestService> manageRequests(User user,String requestType);
	public int getFeedbackNumber(long prosId);
	public int getFeedbackAvg(long prosId);
	public RequestAnswer getAnswerById(long id);
	public void addFeedback(Feedback feedback);
	public ProsProfile editProfile(User user);
	public List<Product> getProductsListedfor(int proId);
	public Notification saveNotification(Notification notification,User user);
	public Quotes getQuoteById(long quoteId);
	public List<FeedbackWrapper> getFeedback(long prosId);
	public boolean saveEditProfile(ProsProfile prosProfile);
	public boolean changePassword(User userSettings,User user);
	public Notification getUserNotification(User user);
	public void saveUpdatedServices(ProsProfile prosProfileObj);
	public void saveImage(Image img);
	
	public WrapRequestService feedback(int prosid,int requestId);
	List<User> getProsEmailIds(long productId);
	

	public int getQuotesNoforPros(String requestType, User user);
	public boolean isRequestQuoted(String requestID, User user);

}
