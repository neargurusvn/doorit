package com.doorit.spring.dao;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.doorit.spring.model.Notification;
import com.doorit.spring.model.Option;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.Question;
import com.doorit.spring.model.Quotes;
import com.doorit.spring.model.RequestAnswer;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;
import com.doorit.spring.model.UserRole;
import com.doorit.spring.model.WrapRequestService;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	
	private static final Logger logger = LoggerFactory.getLogger(CustomerDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Override
	public User addUser(User user) {
		
		logger.info("addUser called>>"+this.getClass().getSimpleName());
	//user.setUsername(user.getEmailId());
	//user.setEnabled(true);
	//user.setPassword("1234");
	Session session=this.sessionFactory.getCurrentSession();
	session.persist(user);
	//user.setUserRole(user);
	
	
	UserRole role = new UserRole();
	 if(user.getEmailId().equals("info@nearguru.com")){
	//if(user.getEmailId().contains("info")){
	//	user.setUserType("admin");
	role.setRole("ROLE_ADMIN");
	 }
	else if(user.getUserType().equals("admin")){
		role.setRole("ROLE_ADMIN");
	}
	 else {
	role.setRole("ROLE_USER");	
	}
	role.setUser(user);
	
	session.persist(role);
	////System.out.println(" >>>>>>>>>>>>>>> Saved User"+user.getUserId()+ "-------"+ user.getEmailId());
	////System.out.println(" >>>>>>>>>>>>>>> Saved User"+user.getUserId()+ "-------"+ user.getUserRole());
	logger.info("user added successfully, user Details="+user);
	
	return user;
	}
	
	@Override
	public Product getProductById(long id) {
		
		logger.info("getProductById called>>"+this.getClass().getSimpleName());
		Session session = this.sessionFactory.getCurrentSession();		
		Product p = (Product) session.load(Product.class, new Long(id));
		logger.info("Product loaded successfully, Person details="+p);
		//System.out.println("Product loaded successfully, Person details="+p);
		return p;
	}

	
	@Override
	public Question getQuestionById(long id) {
		
		logger.info("getQuestionById called>>"+this.getClass().getSimpleName());
		Session session = this.sessionFactory.getCurrentSession();		
		Question q = (Question) session.load(Question.class, new Long(id));
		logger.info("Question loaded successfully, Person details="+q);
		//System.out.println("Product loaded successfully, Person details="+q);
		return q;
	}

	@Override
	public Option getOptionById(long id) {
		
		logger.info("getOptionById called>>"+this.getClass().getSimpleName());
		Session session = this.sessionFactory.getCurrentSession();		
		Option o = (Option) session.load(Option.class, new Long(id));
		logger.info("Option loaded successfully, Person details="+o);
		//System.out.println("Product loaded successfully, Person details="+o);
		return o;
	}

	@Override
	public List<Question> getQuesByProductId(long id) {
		
		logger.info("getQuesByProductId called>>"+this.getClass().getSimpleName());
		//System.out.println("######################## DAO question list ##################" + id);
		Session session = this.sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<Question> questionList = session.createQuery("from Question where product_id = "+ id +" Order by que_id" ).list();
		for(Question q : questionList){
			logger.info("Question List::"+q);
		}
		
		logger.info("List of questions retrieved successfully>>"+questionList.size()+"(List Size)>>>"+this.getClass().getSimpleName());
		return questionList;
	}

	@Override
	public List<Option> getOptionByQueId(long id) {
		
		logger.info("getOptionByQueId called>>"+this.getClass().getSimpleName());
		//System.out.println("######################## DAO question list ##################");
		Session session = this.sessionFactory.getCurrentSession();
		List<Option> optionList = session.createQuery("from Option where que_id = " + id).list();
		for(Option o : optionList){ 
			logger.info("Option List::"+o);
		}
		logger.info("List of Options retrieved successfully>>"+optionList.size()+"(List Size)>>>"+this.getClass().getSimpleName());
		return optionList;
	}

	@Override
	public void saveAnswer(RequestAnswer answer) {
		
		
		logger.info("saveAnswer called>>"+this.getClass().getSimpleName());
		Session session=this.sessionFactory.getCurrentSession();
		session.save(answer);
		
		logger.info("answer saved successfully>>>"+answer+">>>"+this.getClass().getSimpleName());
		/*
		logger.info("answer saved="+answer);
		//System.out.println("answer saved");
		List<RequestAnswer> optionList = session.createQuery("from RequestAnswer ").list();
		for (RequestAnswer requestAnswer : optionList) {
			
			//System.out.println(requestAnswer.getQuestion());
			
		}
	
		//System.out.println("list size>>>>>>>>>>>>>>>>"+optionList.size());
		*/
	}

	@Override
	public List<User> listUser() {
		
		logger.info("retrieve list of users>>"+this.getClass().getSimpleName());
		Session session = this.sessionFactory.getCurrentSession();
		List<User> userList = session.createQuery("from User").list();
		
		logger.info(" list of users retrieved successfully>>"+userList.size()+">>"+this.getClass().getSimpleName());
		return userList;
	}

	@Override
	public User getUserByEmail(String email) {
		
		logger.info("getUserByEmail called>>"+this.getClass().getSimpleName());
		Session session = this.sessionFactory.getCurrentSession();
		//String password=user.getPassword();
		User user = new User();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.like("emailId", email));
		//cr.add(Restrictions.like("password", user.getPassword()));
		if(cr.uniqueResult()!=null){
		user=(User) cr.uniqueResult();
		}
		
		logger.info("user returned successfully >>"+user+this.getClass().getSimpleName());
		return user;
	}

	@Override
	public WrapRequestService addRequest(WrapRequestService rs) {
		
		logger.info("addRequestd called >>"+this.getClass().getSimpleName());
		Session session=this.sessionFactory.getCurrentSession();
		
		RequestService requestService = rs.getRequestService();
		RequestAnswer requestAnswer = rs.getRequestAnswer();
		requestService.setRequestAnswer(requestAnswer);
		requestAnswer.setRequestService(requestService);
		
		session.save(requestService);
		logger.info("service request added successfully>>"+rs+">>"+this.getClass().getSimpleName());
		//logger.info("uses added successfully, user Details="+user);
		//System.out.println(" >>>>>>>>>>>>>>> Saved Request Service");
		return rs;
		
	}

	@Override
	public List<RequestService> getUserServiceRequests(User user,String requestType) {
	
		logger.info("getUserServiceRequests called>>"+this.getClass().getSimpleName());
		Session session = this.sessionFactory.getCurrentSession();
		
		
		

		String hql = "SELECT * FROM REQUESTSERVIC where user_id"  + 
	             "=:user_id and request_status=:request_status ORDER BY version desc";
	SQLQuery query = session.createSQLQuery(hql);
	query.addEntity(RequestService.class);
	
	query.setParameter("user_id", user.getUserId());
	query.setParameter("request_status", requestType);
	
	List<RequestService> serviceRequestList = query.list();
	
	
	//	@SuppressWarnings("unchecked")
	//	List<RequestService> serviceRequestList = session.createQuery("from RequestService where UserId = " + user.getUserId()+" and status="+requestType).list();
		for(RequestService o : serviceRequestList){ 
			logger.info("Request Service List::"+o.getProdcutId());
		}
		
		logger.info("list of service request retrieved successfully >>"+serviceRequestList.size()+">>"+this.getClass().getSimpleName());
		return serviceRequestList;
	}

	@Override
	public List<Quotes> getQuotesRecived(long ServiceRequestId) {
		
		
		logger.info("getQuotesRecived called>>"+this.getClass().getSimpleName());
		List<Quotes> quoteList=new ArrayList<Quotes>();
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from QUOTES  where request_id=:request_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Quotes.class);
		query.setParameter("request_id", ServiceRequestId);
		quoteList = query.list();
		
		logger.info("Quotes recived for service request retrieved successfully>>"+quoteList.size()+">>"+this.getClass().getSimpleName());
		return quoteList;
		
		
		
		
		
	}

	@Override
	public User verifyUser(User user) {
		
		logger.info("verifyUser called>>"+this.getClass().getSimpleName());
		Session session = this.sessionFactory.getCurrentSession();
		String password=user.getPassword();
		Criteria cr = session.createCriteria(User.class);
		cr.add(Restrictions.eq("emailId", user.getEmailId()));
		cr.add( Restrictions.and(
		        Restrictions.eq( "password", user.getPassword()) ));
		       // Restrictions.isNull("age")
		    
		
		//cr.add(Restrictions.like("password", user.getPassword()));
		User user1 = new User();
		if(cr.uniqueResult()!=null){
			user1=(User) cr.uniqueResult();
		}
		
     
		logger.info("user verified successfully>>"+user+">>"+this.getClass().getSimpleName());
		return user1;
	}

	@Override
	public RequestService getRequestServiceById(long id) {
		
		logger.info("getRequestServiceById called>>"+this.getClass().getSimpleName());
		Session session = this.sessionFactory.getCurrentSession();		
		RequestService requestService = (RequestService) session.load(RequestService.class, new Long(id));
		logger.info("Request service loaded  successfully, Request Service details="+requestService);
		
		return requestService;
	}

	@Override
	public User getUserById(long userId) {
		
		logger.info(" getUserById called"+this.getClass().getSimpleName());
		Session session = this.sessionFactory.getCurrentSession();		
		User user= (User) session.get(User.class, new Long(userId));
		logger.info("user loaded successfully, user details="+user);
		//System.out.println("user loaded successfully, Person details="+user.getUserId());
		return user;
	}

	@Override
	public List<RequestService> getRequests(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getQuoteNumber(long requestId) {
		
		
		logger.info("getQuoteNumber  called"+this.getClass().getSimpleName());
		
		List<Quotes> quoteList=new ArrayList<Quotes>();
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from QUOTES  where request_id=:request_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Quotes.class);
		query.setParameter("request_id", requestId);
		quoteList = query.list();
		logger.info("Quotes no  for request retireved successfully,Quote No>>"+quoteList.size()+">>"+this.getClass().getName());
		return quoteList.size();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Quotes getQuote(long requestId) {
	
		
		logger.info("getQuote called>>"+this.getClass().getName());
		
		List<Quotes> quoteList=new ArrayList<Quotes>();
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from QUOTES  where request_id=:request_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Quotes.class);
		query.setParameter("request_id", requestId);
		quoteList = query.list();
		if (quoteList.size() !=0)
		{
			logger.info("Quote for service request loaded successfully>>"+this.getClass().getName());
		return quoteList.get(0);
		}else
		{
			return null;	
		}
	}

	@Override
	public void changeAwardStatus(WrapRequestService wrapRequestService) {
		
		
		logger.info("changeAwardStatus called>>"+this.getClass().getName());
		
		Session session = this.sessionFactory.getCurrentSession();	
		String hql = "UPDATE QUOTES set status = :status "  + 
	             "where request_id=:request_id and quote_id=:quote_id";
	SQLQuery query = session.createSQLQuery(hql);
	query.addEntity(Quotes.class);
	wrapRequestService.getQuote().setStatus("WIP");;
	query.setParameter("status", wrapRequestService.getQuote().getStatus());
	query.setParameter("request_id",wrapRequestService.getRequestService().getRequestId() );
	query.setParameter("quote_id", wrapRequestService.getQuote().getQuoteId());
	
	int result = query.executeUpdate();
	//System.out.println("Rows affected: " + result);
		
	
		
		
	logger.info("status of  Quote for service request changed successfully>>"+this.getClass().getName());	
		
		
		
	}

	@Override
	public void changeRequestStatus(WrapRequestService wrapRequestService) {
		
		
		logger.info("changeRequestStatus called>>"+this.getClass().getName());
		Session session = this.sessionFactory.getCurrentSession();	
		String hql = "UPDATE REQUESTSERVIC set pros_id = :pros_id,request_status=:request_status,statusReason=:statusReason "  + 
	             "where request_id=:request_id";
	SQLQuery query = session.createSQLQuery(hql);
	query.addEntity(RequestService.class);
	
	query.setParameter("request_status", "WIP");
	query.setParameter("request_id",wrapRequestService.getRequestService().getRequestId() );
	query.setParameter("pros_id", wrapRequestService.getQuote().getProsId());
	query.setParameter("statusReason",wrapRequestService.getRequestService().getStatusReason());
	int result = query.executeUpdate();
	
	logger.info("status of request changed successfully>>"+this.getClass().getName());
	
	
		
		
		
	
		
	}

	/*@Override
	public void addLocation(Location location) {
		Session session=this.sessionFactory.getCurrentSession();
		
		session.persist(location);
		//System.out.println(" >>>>>>>>>>>>>>> Saved User location");
		logger.info("uses added successfully, user Details=");
		
		
	}*/

	
	@Override
	public Notification getNotificationByUserId(long userId) {
		// TODO Auto-generated method stub
		
		logger.info("getNotificationByUserId called>>"+this.getClass().getName());
		Session session = this.sessionFactory.getCurrentSession();	
		String sql = "select * from NOTIFICATION  where user_id=:user_id";
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity(Notification.class);
		query.setParameter("user_id", userId);
		List<Notification> notificationList = query.list();
		if (notificationList.size() !=0)
		{
			
			logger.info("Notification for user loaded succesfully,Notification details>>"+notificationList.get(0)+">>"+this.getClass().getName());
		return notificationList.get(0);
		}else
		{
			return null;	
		}
	}

	@SuppressWarnings("unchecked")
	public User findByUserName(String username) {

		
		logger.info("findByUserName called>>"+this.getClass().getName());
		List<User> users = new ArrayList<User>();
		//username ="Anil";
		//System.out.println("user>>>>>>>>>"+username);
		users = sessionFactory.getCurrentSession().createQuery("from User where email=?").setParameter(0, username)
				.list();

		if (users.size() > 0) {
			
			logger.info("user by name loaded succesfully,User details>>"+users.get(0)+">>"+this.getClass().getName());
			return users.get(0);
		} else {
			return null;
		}

	}
@Override
	public void saveRequestStatus(RequestService requestServiceObj) {
	
		logger.info("saveRequestStatus called>>"+this.getClass().getName());
		
		Session session=this.sessionFactory.getCurrentSession();		
		session.persist(requestServiceObj);
		//System.out.println(" >>>>>>>>>>>>>>>Request Status Updated Successfully");
		logger.info("request status saved successfully,requestService details>>"+requestServiceObj+">>"+this.getClass().getName());
		
	}

@Override
public void changeQuoteStatus(Quotes quotes) {
	
	
	logger.info("changeQuoteStatus called>>"+this.getClass().getName());
	//Session session=this.sessionFactory.getCurrentSession();
	
	//session.saveOrUpdate(quotes);
	
	
	Session session = this.sessionFactory.getCurrentSession();	
	String hql = "UPDATE QUOTES set status = :status "  + 
             "where request_id=:request_id and pros_id not in (:pros_id)";
SQLQuery query = session.createSQLQuery(hql);
query.addEntity(Quotes.class);
//quotes.setStatus("OLD");;
query.setParameter("status", "OLD");
query.setParameter("request_id",quotes.getRequestId() );
query.setParameter("pros_id", quotes.getProsId());

int result = query.executeUpdate();
//System.out.println("Rows affected: " + result);
logger.info("Quote status saved successfully,Quote details>>"+quotes+">>"+this.getClass().getName());
}

@Override
public Quotes getQuotebyQuoteId(long quoteId) {

	logger.info("getQuotebyQuoteId called>>"+this.getClass().getName());
	Session session = this.sessionFactory.getCurrentSession();		
	Quotes quote = (Quotes) session.load(Quotes.class, new Long(quoteId));
//	logger.info("Product loaded successfully, Person details="+p);
	logger.info("Quote retieved successfully by Quote id ,Quote details>>"+quote+">>"+this.getClass().getName());
	return quote;
}

@Override
public User checkvalidUser(User user) {
	
	logger.info("checkvalidUser called>>"+this.getClass().getName());
	Session session = this.sessionFactory.getCurrentSession();
	
	Criteria cr = session.createCriteria(User.class);
	cr.add(Restrictions.like("emailId", user.getEmailId()));
	
	if(cr.uniqueResult()!=null){
	user=(User) cr.uniqueResult();
	}
	
 
	logger.info("user validated successfully,user details>>"+user+">>"+this.getClass().getName());
	return user;
}

@Override
public int getINProgressNo(String requestType,User user) {
	
	logger.info("getINProgressNo called>>"+this.getClass().getName());
	List<RequestService> requestServiceList=new ArrayList<RequestService>();
	Session session = this.sessionFactory.getCurrentSession();	
	String sql = "select * from REQUESTSERVIC  where request_status=:status and user_id=:user_id";
	SQLQuery query = session.createSQLQuery(sql);
	query.addEntity(RequestService.class);
	query.setParameter("status", requestType);
	query.setParameter("user_id", user.getUserId());
	requestServiceList = query.list();
	logger.info("in progress request no for user  retrieved successfully>>"+requestServiceList.size()+">>"+this.getClass().getName());
	return requestServiceList.size();
}

@Override
public int getWIPNo(String requestType,User user) {
	
	logger.info("getWIPNo called>>"+this.getClass().getName());
	List<RequestService> requestServiceList=new ArrayList<RequestService>();
	Session session = this.sessionFactory.getCurrentSession();	
	String sql = "select * from REQUESTSERVIC  where request_status=:status and user_id=:user_id";
	SQLQuery query = session.createSQLQuery(sql);
	query.addEntity(RequestService.class);
	query.setParameter("status", requestType);
	query.setParameter("user_id", user.getUserId());
	requestServiceList = query.list();
	logger.info("work in progress request no for user  retrieved successfully>>"+requestServiceList.size()+">>"+this.getClass().getName());
	return requestServiceList.size();
}

@Override
public boolean isVendorVerified(User user) {
	
	logger.info("isVendorVerified called>>"+this.getClass().getName());
	Session session = this.sessionFactory.getCurrentSession();
	try{
		
		
		//System.out.println("notification :::" + notification.isEmail());
		session.saveOrUpdate(user);
		
		
		logger.info("  vendor verification completed successfully -"+"method name - isVendorVerified  "+this.getClass().getSimpleName());
		
		
		return true;
	}
	catch(Exception ex){
		
		StringWriter stack = new StringWriter();
		ex.printStackTrace(new PrintWriter(stack));
		logger.info("vendor verification completed successfully -"+"method name - isVendorVerified  "+ex.toString());
		return false;
	}

	
}
/*****************************************************************
 * 
 *create by :divyanayan
 *created date :09-05-2014
 *functionality :toggle the email send option to the customer from the admin section
 * 
 **********************************************************************/
@Override
public void toogleEmailSend(User user) {
	
	String methodName ="toogleEmailSend(long userId, boolean enabledVal) ";
	logger.info(methodName+"toggle on and off email id>>"+this.getClass().getName());
	Session session = this.sessionFactory.getCurrentSession();
	try{
		session.saveOrUpdate(user);
		logger.info(methodName+"  vendor verification completed successfully -"+"method name - isVendorVerified  "+this.getClass().getSimpleName());
	}
	catch(Exception ex){
		StringWriter stack = new StringWriter();
		ex.printStackTrace(new PrintWriter(stack));
		logger.info(methodName+"  -vendor verification completed successfully -"+"method name - isVendorVerified  "+ex.toString());
		
	}

	
}



}


