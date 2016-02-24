package com.doorit.spring.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

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

@Repository
public class ProsDAOImpl implements ProsDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ProsDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	@Override
	public void addProsProfile(ProsProfile profile) {
		//System.out.println("Yes You are ready to make profile ##############");
		
		logger.info("add Professional Profile  called     -"+"method name - addProsProfile  "+this.getClass().getSimpleName());
		
		profile.setVerification("Y");
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(profile);
		
		logger.info(" Professional Profile  added successfully,Professional Details     -"+profile+"  method name - addProsProfile  "+this.getClass().getSimpleName());
		//logger.info("Question saved successfully, Question Details="+q);
		//System.out.println("Pros Profile saved successfully, pros Details=");
		
		
	}






	@Override
	public void placeBid(Quotes quotes) {
	
	
		logger.info("place bid on quote  called     -"+"method name - placeBid  "+this.getClass().getSimpleName());	
	
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(quotes);
	
		logger.info(" Quote submitted  successfully,Quote Details     -"+quotes+"  method name - addProsProfile  "+this.getClass().getSimpleName());
	}







	@Override
	public List<RequestService> fetchProsDashboard(ProsProfile prosProfile) {
		
		logger.info("fetch professional service leads  called     -"+"method name - fetchProsDashboard  "+this.getClass().getSimpleName());
		
		
		Session session = this.sessionFactory.getCurrentSession();
		ArrayList<Long> ids = new ArrayList<Long>();
		String str = prosProfile.getListedIn();
	   	for (String retval: str.split(",")){
			ids.add(Long.parseLong(retval));
	         //System.out.println(retval);
	      }
		
	   	String sql = "SELECT * FROM REQUESTSERVIC where product_id in (:product_id) and user_id!=(:user_id) and request_status like '%IP%' ORDER BY version desc";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(RequestService.class);
		query.setParameterList("product_id", ids);
		query.setParameter("user_id", prosProfile.getUser().getUserId());
		List<RequestService> serviceRequestList = query.list();
		
		logger.info("fetched professional service leads  successfully     -"+"method name - fetchProsDashboard  "+this.getClass().getSimpleName());
		
		return serviceRequestList;
	}

	

	@Override
	public RequestAnswer getAnswerById(long id) {
		
		
		logger.info("fetch answer by id   called     -"+"method name - fetchProsDashboard  "+this.getClass().getSimpleName());

		Session session = this.sessionFactory.getCurrentSession();		
		RequestAnswer ra = (RequestAnswer) session.get(RequestAnswer.class, new Long(id));
		//logger.info("Product loaded successfully, Person details="+p);
		//System.out.println("Request Answer loaded successfully, Person details=");
		
		//System.out.println(ra.getAnswer1());
		//System.out.println(ra.getProduct_name());
		
		logger.info("fetched answer by id   successfully,answer details     -"+ra+"   --method name - fetchProsDashboard  "+this.getClass().getSimpleName());
		return ra;
	}

	@Override
	public User userSettings(User loggeduser) {
		
		
		logger.info("fetch user details   called     -"+"method name - userSettings  "+this.getClass().getSimpleName());

		Session session = this.sessionFactory.getCurrentSession();		

		User user = (User) session.get(User.class, loggeduser.getUserId());
		
		logger.info("user details fetched   successfully,user details     -"+loggeduser+"   --method name - userSettings  "+this.getClass().getSimpleName());
		
		return user;
	}

	@Override
	public void saveImage(Image img) {
		
		
		logger.info("save image  called     -"+"method name - saveImage  "+this.getClass().getSimpleName());
		
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(img);
		
		logger.info("image saved successfully     -"+"  --method name - userSettings  "+this.getClass().getSimpleName());
		//logger.info("Question saved successfully, Question Details="+q);
		//System.out.println("Pros Profile saved successfully, pros Details=");
		
	}

	
	



	

	@Override
	public List<RequestService> manageRequestsVendor() {
		
		logger.info("request managed by the vendor called     -"+"method name - manageRequestsVendor  "+this.getClass().getSimpleName());
		
		
		Session session = this.sessionFactory.getCurrentSession();
		List<RequestService> serviceRequestList = session.createQuery("from RequestService where prosId = " + 5).list();
		for(RequestService o : serviceRequestList){ 
			logger.info("Product List::"+o.getProdcutId());
		}
		
		logger.info("list of requests managed by the vendor  retrieved successfully     -"+"method name - manageRequestsVendor  "+this.getClass().getSimpleName());
		
		return serviceRequestList;
	}

	@SuppressWarnings("unused")
	@Override
	public ProsProfile getProsProfile(User user) {
		
		logger.info("retrieve pros profile called     -"+"method name - getProsProfile  "+this.getClass().getSimpleName());
		
		
		ProsProfile prosprofile = null;
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from PROSPROFILE  where pros_id=:pros_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(ProsProfile.class);
		query.setParameter("pros_id", user.getUserId());
		List results = query.list();

		logger.info("retrieved pros profile successfully     -"+"method name - getProsProfile  "+this.getClass().getSimpleName());
		
		return (ProsProfile) results.get(0);
	}

	@Override
	public void addFeedback(Feedback feedback) {
		
		
		try{
			
			logger.info("add feedback for vendor  called     -"+"method name - addFeedback  "+this.getClass().getSimpleName());
			
			Session session = this.sessionFactory.getCurrentSession();
			session.persist(feedback);
			//System.out.println("Feedback>>>>>>>>>");
			logger.info(" feedback added for vendor  successfully     -"+"method name - addFeedback  "+this.getClass().getSimpleName());
		}
		catch(Exception ex){
			
			logger.info(" Exception occured while adding feedback  for vendor -Error Message      -"+ex.getMessage()+"    ---method name - addFeedback  "+this.getClass().getSimpleName());
			//System.out.println(ex.toString());
		}
		
		
		
	}

	@Override
	public List<Quotes> getRequestsQuoted(User user,String status) {
	
		logger.info("get Quotes given by vendor for users service requests     -"+"method name - getRequestsQuoted  "+this.getClass().getSimpleName());
		
		List<Quotes> quotedRequests=new ArrayList<Quotes>();
		ProsProfile prosprofile = null;
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from QUOTES  where pros_id=:pros_id and status=:status order by version desc";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Quotes.class);
		query.setParameter("pros_id", user.getUserId());
		query.setParameter("status",status);
		quotedRequests = query.list();
		
		logger.info(" Quotes list  given by vendor retrieved successfully      -"+quotedRequests.size()+"   ----method name - getRequestsQuoted  "+this.getClass().getSimpleName());
		
		return quotedRequests;
	}
	@Override
	public List<Quotes> getQuotesbyRequestId(long  requestId) {
		
		
		logger.info("get Quotes given by vendor for users service requests     -"+"method name - getRequestsQuoted  "+this.getClass().getSimpleName());

		List<Quotes> quotedRequests=new ArrayList<Quotes>();
		ProsProfile prosprofile = null;
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from QUOTES  where request_id=:request_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Quotes.class);
		query.setParameter("request_id", requestId);
		//query.setParameter("status",status);
		quotedRequests = query.list();
		
		logger.info(" Quotes list  for a request  retrieved successfully     -"+"method name - getQuotesbyRequestId  "+this.getClass().getSimpleName());
		
		return quotedRequests;
	}
	
	@Override
	public RequestService getServiceREquest(Quotes quotes) {
		
		
		logger.info(" retrieve service request       -"+"method name - getServiceREquest  "+this.getClass().getSimpleName());
		
		
		Session session = this.sessionFactory.getCurrentSession();		

		RequestService requestService = (RequestService) session.get(RequestService.class, new Long(quotes.getRequestId()));
		
		logger.info(" retrieved service request successfully      -"+"method name - getServiceREquest  "+this.getClass().getSimpleName());
		
		return requestService;
	
	}

	@Override
	public ProsProfile getProsProfileByRequestId(long prosId) {
	
		
		logger.info(" retrieve pros profile        -"+"method name - getProsProfileByRequestId  "+this.getClass().getSimpleName());
		
		
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from PROSPROFILE  where pros_id=:pros_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(ProsProfile.class);
		query.setParameter("pros_id", prosId);
		List results = query.list();
		
		logger.info(" retrieved pros profile successfully        -"+"method name - getProsProfileByRequestId  "+this.getClass().getSimpleName());
		
		return (ProsProfile) results.get(0);
	}

	@Override
	public Boolean getRequestsQuoted(long requestId, long userId) {
		
		
		logger.info(" is request quoted by a professional    -"+"method name - getRequestsQuoted  "+this.getClass().getSimpleName());
		
		
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from QUOTES  where request_id=:request_id and pros_id=:pros_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Quotes.class);
		query.setParameter("request_id", requestId);
		query.setParameter("pros_id", userId);
		List results = query.list();
		
		if(results.size()==0){
		
			logger.info("  request is not quoted by a professional    -"+"method name - getRequestsQuoted  "+this.getClass().getSimpleName());
			return false;
		}		
		else{
			logger.info("  request is  quoted by a professional    -"+"method name - getRequestsQuoted  "+this.getClass().getSimpleName());
			return true;
		}
	}

	@Override
	public Product getProduct(String productId) {
		
		
		logger.info("  retrieve productGroup by id    -"+"method name - getProduct  "+this.getClass().getSimpleName());
		
		Session session = this.sessionFactory.getCurrentSession();		

		Product product = (Product) session.get(Product.class, new Long(productId));
		
		logger.info("  retrieved productGroup by id ,ProductGroup details   -"+product+"   ---method name - getProduct  "+this.getClass().getSimpleName());
		
		
		return product;
		
	}

	@Override
	public Notification saveNotification(Notification notification) {
		
		
		logger.info("  save user notification preferences   -"+"method name - saveNotification  "+this.getClass().getSimpleName());
		
		Session session = this.sessionFactory.getCurrentSession();
		//System.out.println("notification :::" + notification.isEmail());
		session.saveOrUpdate(notification);
		Notification notify=new Notification();
		
		logger.info("  saved user notification preferences successfully  -"+"method name - saveNotification  "+this.getClass().getSimpleName());
		
		return notify;
	}

	@Override
	public Quotes getQuoteById(long quoteId) {
		
		logger.info("  retreieve quote by id   -"+"method name - getQuoteById  "+this.getClass().getSimpleName());
		
		Session session = this.sessionFactory.getCurrentSession();		
		
		Quotes quotes = (Quotes) session.load(Quotes.class, new Long(quoteId));
		logger.info("Product loaded successfully, Person details="+quotes);
		//System.out.println("Product loaded successfully, Person details="+quotes);
		
		logger.info("  retreieved quote by id successfully,Quote details   ---"+quotes+"   ---method name - getQuoteById  "+this.getClass().getSimpleName());
		
		return quotes;
	}

	@Override
	public List<Feedback> getFeedback(long prosId) {
		
		logger.info("  retreieve list of feedback for a professional    ---method name - getFeedback  "+this.getClass().getSimpleName());
		
		
		Session session = this.sessionFactory.getCurrentSession();
		List<Feedback> feedbackList = session.createQuery("from Feedback where pros_id = " + prosId +"order by version desc").list();
		//System.out.println(">>>>>>>>>> feedback");
		
		logger.info("  retreieved list of feedback for a professional successfully   ---method name - getFeedback  "+this.getClass().getSimpleName());
		
		
		return feedbackList;
	}
//Method to get feedback count
	@Override
	public int getfeedbackNumber(long prosId) {
		
		logger.info("  retreieve feedack number  for professional    -"+"method name - getfeedbackNumber  "+this.getClass().getSimpleName());
		
		
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from FEEDBACK  where pros_id=:pros_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Feedback.class);
		query.setParameter("pros_id", prosId);
		List results = query.list();
		
		logger.info("  retreieved feedack number  for professional successfully    -"+"method name - getfeedbackNumber  "+this.getClass().getSimpleName());
		
		return  results.size();
	}

	@Override
	public int getFeedbackAvg(long prosId) {
		
		
		logger.info("  retreieve feedack average  for professional    -"+"method name - getfeedbackNumber  "+this.getClass().getSimpleName());
		
		
		int feedbBackTotal = 0;
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from FEEDBACK  where pros_id=:pros_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Feedback.class);
		query.setParameter("pros_id", prosId);
		List<Feedback> results = query.list();
		
		int total=results.size();
		int feedbackAvg=0;
		if(total!=0){
		for(Feedback fb:results){
			
			feedbBackTotal=(int) (feedbBackTotal+ fb.getRating());
		}
		feedbackAvg=feedbBackTotal/total;
		}
		
		logger.info("  retreieved feedack average  for professional sucessfully   -"+"method name - getFeedbackAvg  "+this.getClass().getSimpleName());
		
		
		return feedbackAvg;
	}
	
	@Override
	public void saveEditProfile(ProsProfile prosProfile) {
		
		logger.info("  save edited profile  by  professional    -"+"method name - saveEditProfile  "+this.getClass().getSimpleName());
		
		Session session = this.sessionFactory.getCurrentSession();
		//System.out.println(">>>>>>>>>>>>>>>>>>"+prosProfile.getCompanyName());
		
		logger.info("  saved edited profile  by  professional successfully,Profile Details   -"+prosProfile+"   ---method name - saveEditProfile  "+this.getClass().getSimpleName());
		
		session.saveOrUpdate(prosProfile);
		
	}

	@Override
	public boolean changePassword(User userSettings, User user) {
	
		logger.info("  change password      -"+"method name - changePassword  "+this.getClass().getSimpleName());
		
		Session session = this.sessionFactory.getCurrentSession();	
		String hql = "UPDATE USER set password = :password "  + 
			             "where user_id=:user_id";
		SQLQuery query = session.createSQLQuery(hql);
		query.addEntity(User.class);			
		query.setParameter("user_id",user.getUserId());
		query.setParameter("password",userSettings.getPassword());
		int result = query.executeUpdate();
		
		//System.out.println("Rows affected: " + result);
		logger.info("  changed password  successfully    -"+"method name - changePassword  "+this.getClass().getSimpleName());
		
			return true;
	}

	@Override
	public Notification getUserNotification(User user) {
		
		
		logger.info("  retrieve user notifications preferences  -"+"method name - getUserNotification  "+this.getClass().getSimpleName());
		
		
		Session session = this.sessionFactory.getCurrentSession();
		
		
		String sql = "SELECT * FROM NOTIFICATION where user_id =:user_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Notification.class);
		query.setParameter("user_id", user.getUserId());
		List<Notification> notification = query.list();
		
		logger.info("  retrieved user notifications preferences successfully,Notification details  -"+notification.get(0)+"   ----method name - getUserNotification  "+this.getClass().getSimpleName());
		
		return notification.get(0);
	}

	@Override
	public void saveUpdatedServices(ProsProfile prosProfileObj) {
	
		logger.info("  save  updated services provided by professional  -"+"method name - saveUpdatedServices  "+this.getClass().getSimpleName());
		
		
		Session session = this.sessionFactory.getCurrentSession();
		//System.out.println(">>>>>>>>>>>>>>>>>>"+prosProfileObj.getCompanyName());		
		session.saveOrUpdate(prosProfileObj);
		
		logger.info("  saved  updated services provided by professional successfully  -"+"method name - saveUpdatedServices  "+this.getClass().getSimpleName());
	}
	
@Override
	public boolean saveUserSettings(User userSettings) {
		
		try{
			
			logger.info("  update  user details  -"+"method name - saveUserSettings  "+this.getClass().getSimpleName());
			
			Session session = this.sessionFactory.getCurrentSession();
			//System.out.println(">>>>>>>>>>>>>>>>>>"+userSettings.getUserId());
		
			session.saveOrUpdate(userSettings);
			
			logger.info("  updated  user details  successfully -"+"method name - saveUserSettings  "+this.getClass().getSimpleName());
			
			return true;
		}
		catch(Exception ex){
			
			logger.info(" exception occured while updating   user details  ,EXCEPTION -"+ex.getMessage()+"  ---method name - saveUserSettings  "+this.getClass().getSimpleName());
			//System.out.println(ex.toString());
			
		}
		
		return false;
	}

@Override
public void updateQuote(Quotes quoteObj) {
	
	try{
		
		logger.info("  update  Quote   -"+"method name - updateQuote  "+this.getClass().getSimpleName());
		
		
		Session session = this.sessionFactory.getCurrentSession();
		
		
		session.saveOrUpdate(quoteObj);
		
		logger.info("  updated  Quote successfully ,Quote details  -"+quoteObj+"    --method name - updateQuote  "+this.getClass().getSimpleName());
		
		}
		catch(Exception ex){
			
			//System.out.println(ex.toString());
			
			logger.info("Exception occured while   update  Quote ,EXCEPTION  -"+ex.getMessage()+"    ---method name - updateQuote  "+this.getClass().getSimpleName());
		}
	
}

@Override
public List<User> getProsEmailIds(long productId) {
	
	
	logger.info("get professionals email ids     -"+"  method name - getProsEmailIds  "+this.getClass().getSimpleName());
	
	Session session = this.sessionFactory.getCurrentSession();	
	String sql = "select * from USER where user_id in (select pros_id from PROSPROFILE where ListedIn like '%" +productId + "%')";
	SQLQuery query = session.createSQLQuery(sql);
	query.addEntity(User.class);
	//query.setParameter("user_id", user.getUserId());
	List<User> user = query.list();
	
	logger.info(" professionals email ids retreieved successfully    -"+user.size()+"  method name - getProsEmailIds  "+this.getClass().getSimpleName());
	
	//System.out.println(" pros email" + user.size());	
	return user;
}

@Override
public int getQuotesNoforPros(String requestType, User user) {
	
	
	logger.info("get  Quote number  - number of requests quoted by professional - ---method name - updateQuote  "+this.getClass().getSimpleName());
	
	
	Session session = this.sessionFactory.getCurrentSession();	
	List<Quotes> quotesList=new ArrayList<Quotes>();
	String sql = "select * from QUOTES  where status=:status and pros_id=:pros_id";
	SQLQuery query = session.createSQLQuery(sql);
	query.addEntity(Quotes.class);
	query.setParameter("status", requestType);
	query.setParameter("pros_id", user.getUserId());
	quotesList = query.list();
	
	logger.info("Quotes number -"+quotesList.size()+"    ---method name - updateQuote  "+this.getClass().getSimpleName());
	
	return quotesList.size();
}


@Override
public boolean isRequestQuoted(String requestID, User user) {
	
	logger.info("is request quoted  -  by professional - ---method name - isRequestQuoted  "+this.getClass().getSimpleName());
	
	
	Session session = this.sessionFactory.getCurrentSession();	
	List<Quotes> quotesList=new ArrayList<Quotes>();
	String sql = "select * from QUOTES  where request_id=:request_id and pros_id=:pros_id";
	SQLQuery query = session.createSQLQuery(sql);
	query.addEntity(Quotes.class);
	query.setParameter("request_id", requestID);
	query.setParameter("pros_id", user.getUserId());
	quotesList = query.list();
	
	logger.info("Quotes number -"+quotesList.size()+"    ---method name - updateQuote  "+this.getClass().getSimpleName());
	
	int QuouteSize=quotesList.size();
	
	if(QuouteSize>0){
		
		return true;
	}
	
	return false;
}

}
