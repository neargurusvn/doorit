package com.doorit.spring.dao;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.doorit.spring.model.Option;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProductGroup;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Question;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminDAOImpl.class);

	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	
/*
	@Override
	public void addPerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Person saved successfully, Person Details="+p);
	}

	@Override
	public void updatePerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
		logger.info("Person updated successfully, Person Details="+p);
	}
*/
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> listProduct() {
		//System.out.println("######################## DAO ##################");
		Session session = this.sessionFactory.getCurrentSession();
		List<Product> productList = session.createQuery("from Product").list();
		for(Product p : productList){
			logger.info("Product List::"+p);
		}
		return productList;
	}
/*
	@Override
	public Person getPersonById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Person p = (Person) session.load(Person.class, new Integer(id));
		logger.info("Person loaded successfully, Person details="+p);
		return p;
	}

	@Override
	public void removePerson(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person p = (Person) session.load(Person.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Person deleted successfully, person details="+p);
	}
*/


@Override
public void addProduct(ProductGroup pg , Product p) {
	Session session = this.sessionFactory.getCurrentSession();
	p.setProductGroup(pg);
	session.persist(p);
	logger.info("Prodcut saved successfully, Person Details=");
	//System.out.println("Product Saved ");
	
}


@Override
public void addUser(User user) {
Session session=this.sessionFactory.getCurrentSession();
session.persist(user);
logger.info("uses added successfully, user Details="+user);
	
}

@Override
public Product getProductById(long id) {
	Session session = this.sessionFactory.getCurrentSession();		
	
	Product p = (Product) session.load(Product.class, new Long(id));
	logger.info("Product loaded successfully, Person details="+p);
	//System.out.println("Product loaded successfully, Person details="+p);
	return p;
}


@Override
public void addQuestion(Product p,Question q) {
	Session session = this.sessionFactory.getCurrentSession();
	q.setProduct(p);
	session.persist(q);
	logger.info("Question saved successfully, Question Details="+q);
	//System.out.println("Question saved successfully, Question Details="+q);
	
}


@Override
public List<Question> listQuestion() {
	//System.out.println("######################## DAO question list ##################");
	Session session = this.sessionFactory.getCurrentSession();
	List<Question> questionList = session.createQuery("from Question").list();
	for(Question q : questionList){
		logger.info("Product List::"+q);
	}
	return questionList;
}


@Override
public void addOption(Option o, Question q) {
	Session session = this.sessionFactory.getCurrentSession();
	o.setProductId(q.getProduct().getProductId());
	o.setQuestion(q);
	session.persist(o);
	logger.info("Option saved successfully, Question Details="+o);
	//System.out.println("Option saved successfully, Question Details="+o);
	
	
}


@Override
public Question getQuestionById(long id) {
	Session session = this.sessionFactory.getCurrentSession();		
	Question q = (Question) session.load(Question.class, new Long(id));
	logger.info("Product loaded successfully, Person details="+q);
	//System.out.println("Product loaded successfully, Person details="+q);
	return q;
}


@Override
public List<Option> listOption() {
	//System.out.println("######################## DAO question list ##################");
	Session session = this.sessionFactory.getCurrentSession();
	List<Option> optionList = session.createQuery("from Option").list();
	for(Option o : optionList){
		logger.info("Product List::"+o);
	}
	return optionList;
}


@Override
public Option getOptionById(long id) {
	Session session = this.sessionFactory.getCurrentSession();		
	Option o = (Option) session.load(Option.class, new Long(id));
	logger.info("Product loaded successfully, Person details="+o);
	//System.out.println("Product loaded successfully, Person details="+o);
	return o;
}


@Override
public List<Question> getQuesByProductId(long id) {
	//System.out.println("######################## DAO question list ##################" + id);
	Session session = this.sessionFactory.getCurrentSession();
	@SuppressWarnings("unchecked")
	List<Question> questionList = session.createQuery("from Question where product_id = "+ id).list();
	for(Question q : questionList){
		logger.info("Product List::"+q);
	}
	return questionList;
}


@Override
public List<Option> getOptionByQueId(long id) {
	//System.out.println("######################## DAO question list ##################");
	Session session = this.sessionFactory.getCurrentSession();
	@SuppressWarnings("unchecked")
	List<Option> optionList = session.createQuery("from Option where que_id = " + id).list();
	for(Option o : optionList){ 
		logger.info("Product List::"+o);
	}
	return optionList;
}


@Override
public void addProductGroup(ProductGroup p) {
	Session session = this.sessionFactory.getCurrentSession();
	session.persist(p);
	logger.info("Prodcut saved successfully, Person Details="+p);
	//System.out.println("saved product group");
	
	
}


@Override
public List<ProductGroup> listProductGroup() {
	//System.out.println("######################## DAO ##################");
	Session session = this.sessionFactory.getCurrentSession();
	List<ProductGroup> producGroupList = session.createQuery("from ProductGroup").list();
	
	return producGroupList;
}


@Override
public ProductGroup getProductGroupById(long id) {
	Session session = this.sessionFactory.getCurrentSession();		
	
	ProductGroup p = (ProductGroup) session.load(ProductGroup.class, new Long(id));
	logger.info("Product loaded successfully, Person details="+p);
	//System.out.println("Product loaded successfully, Person details="+p);
	return p;

}


@Override
public List<Product> listProductByTag(String tagName) {
	Session session = this.sessionFactory.getCurrentSession();
	//List<Product> productList = session.createQuery("from Product where upper(productName) like " + "'%" +tagName.toUpperCase() + "%'").list();
	//for(RequestService o : serviceRequestList){ 
		//logger.info("Product List::"+o.getProdcutId());
	//}
	
	List<Product> productList=new ArrayList<Product>();
	//ProsProfile prosprofile = null;
	//Session session = this.sessionFactory.getCurrentSession();	
	String sql = "SELECT a.product_id , a.product_name , a.product_desc ,a.approved_By , a.approver_comments , a.is_active"+
			",a.productGroup_id,a.version,a.created_By FROM PRODUCT a LEFT JOIN OPTIONS b ON a.product_id = b.product_id WHERE  " +
			"upper(b.opt_desc) like" + "'%" +tagName.toUpperCase() + "%' or upper(a.product_name) like" + "'%" +tagName.toUpperCase() + "%' group by a.product_id  ";
	SQLQuery query = session.createSQLQuery(sql);
	query.addEntity(Product.class);
	//query.setParameter("pros_id", user.getUserId());
	//query.setParameter("status",status);
	productList = query.list();
	
	//return quotedRequests;
	
	
	return productList;
	
}


@Override
public List<Product> listProductByProductGroup(long productGroupId) {
	Session session = this.sessionFactory.getCurrentSession();
	List<Product> productList = session.createQuery("from Product where productGroup_id = "+productGroupId).list();
	//for(RequestService o : serviceRequestList){ 
		//logger.info("Product List::"+o.getProdcutId());
	//}
	return productList;
	
}


@Override
public void removeProductGroup(long id) {
	Session session = this.sessionFactory.getCurrentSession();
	ProductGroup p = (ProductGroup) session.load(ProductGroup.class, new Long(id));
	if(null != p){
		session.delete(p);
	}
	
}


@Override
public void removeProduct(long id) {
	Session session = this.sessionFactory.getCurrentSession();
	Product p = (Product) session.load(Product.class, new Long(id));
	if(null != p){
		session.delete(p);
	}
	
}


@Override
public void saveProductGroup(ProductGroup productGroupObj) {
	
		try{
			Session session = this.sessionFactory.getCurrentSession();		
			session.saveOrUpdate(productGroupObj);
		}
		catch(Exception ex){		
			
			logger.info("Exception--Exception Message"+ex.getMessage()+"  ----"+this.getClass().getSimpleName());
		}
	
}


@Override
public void updateProduct(Product productObj) {
	
	try{
		Session session = this.sessionFactory.getCurrentSession();		
		session.saveOrUpdate(productObj);
	}
	catch(Exception ex){		
		
		logger.info("Exception--Exception Message"+ex.getMessage()+"  ----"+this.getClass().getSimpleName());
	}

	
}


@Override
public void updateOption(Option optionObj) {
	
	
	try{
		Session session = this.sessionFactory.getCurrentSession();		
		session.saveOrUpdate(optionObj);
	}
	catch(Exception ex){		
		
		logger.info("Exception--Exception Message"+ex.getMessage()+"  ----"+this.getClass().getSimpleName());
	}
	
}


@Override
public void deleteOption(long optionId) {
	
	Session session = this.sessionFactory.getCurrentSession();		
    
    String sql = "DELETE FROM OPTIONS WHERE opt_id = :optionId";
   
    SQLQuery query = session.createSQLQuery(sql);
	query.addEntity(Option.class);
	
	query.setParameter("optionId", optionId);
	 int row = query.executeUpdate();
	
	
	
}


@Override
public void deleteQuestion(long questionId) {
	
Session session = this.sessionFactory.getCurrentSession();		
    
    String sql = "DELETE FROM QUESTION WHERE que_id = :que_id";
   
    SQLQuery query = session.createSQLQuery(sql);
	query.addEntity(Question.class);
	
	query.setParameter("que_id", questionId);
	 int row = query.executeUpdate();
	
}


@Override
public void deleteProduct(long productId) {
	
	
Session session = this.sessionFactory.getCurrentSession();		
    
    String sql = "DELETE FROM PRODUCT WHERE product_id = :product_id";
   
    SQLQuery query = session.createSQLQuery(sql);
	query.addEntity(Product.class);
	
	query.setParameter("product_id", productId);
	 int row = query.executeUpdate();
	
}
@Override
public void deleteProductGroup(long productGroupId) {
	
	
Session session = this.sessionFactory.getCurrentSession();		
    
    String sql = "DELETE FROM PRODUCTGROUP WHERE productGroup_id = :productGroup_id";
   
    SQLQuery query = session.createSQLQuery(sql);
	query.addEntity(ProductGroup.class);
	
	query.setParameter("productGroup_id", productGroupId);
	 int row = query.executeUpdate();
	
}


@Override
public void updateQuestion(Question questionObj) {

	try{
		Session session = this.sessionFactory.getCurrentSession();		
		session.saveOrUpdate(questionObj);
	}
	catch(Exception ex){		
		
		logger.info("Exception--Exception Message"+ex.getMessage()+"  ----"+this.getClass().getSimpleName());
	}
	
}







/*@Override
public User getUserById(long userId) {
	Session session = this.sessionFactory.getCurrentSession();	
	User user= (User) session.get(User.class, new Long(userId));
	return user;
}*/

/*@Override
public ProsProfile getprosProfileById(long userId) {
	Session session = this.sessionFactory.getCurrentSession();
	ProsProfile pros_id=(ProsProfile) session.get(ProsProfile.class, new Long(userId));
	return pros_id;
}*/


@Override
public void saveVendorVerify(ProsProfile pros_id) {
	Session session = this.sessionFactory.getCurrentSession();
	session.saveOrUpdate(pros_id);
	
	
}


@Override
public ProsProfile getprosProfileById(long pros_id) {
	Session session=this.sessionFactory.getCurrentSession();
	ProsProfile ProsId=(ProsProfile) session.get(ProsProfile.class, new Long(pros_id));
	return ProsId;
	
	
}


@Override
public void visibleProductGroup(ProductGroup productgroup) {
	
	 String methodName ="visibleProductGroup(ProductGroup productgroup) ";
	logger.info(methodName+"visible or invisible ProductGroup>>"+this.getClass().getName());
	//Session session = this.sessionFactory.getCurrentSession();
	try{
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(productgroup);
		logger.info(methodName+"  visible or invisible ProductGroup completed successfully -"+"method name - isvisible  "+this.getClass().getSimpleName());
	}
	catch(Exception ex){
		StringWriter stack = new StringWriter();
		ex.printStackTrace(new PrintWriter(stack));
		logger.info(methodName+"  -visible or invisible ProductGroup completed successfully -"+"method name - isvisible  "+ex.toString());
		
	}
	
	
}


@Override
public void visibleProduct(Product product) {
	 	String methodName ="visibleProduct(Product product) ";
	logger.info(methodName+"visible or invisible Product>>"+this.getClass().getName());
	//Session session = this.sessionFactory.getCurrentSession();
	try{
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(product);
		logger.info(methodName+"  visible or invisible Product completed successfully -"+"method name - isvisible  "+this.getClass().getSimpleName());
	}
	catch(Exception ex){
		StringWriter stack = new StringWriter();
		ex.printStackTrace(new PrintWriter(stack));
		logger.info(methodName+"  -visible or invisible Product completed successfully -"+"method name - isvisible  "+ex.toString());
		
	}
	
}


@Override
public List<Product> getProductListById(long id) {
	
	Session session = this.sessionFactory.getCurrentSession();
	@SuppressWarnings("unchecked")
	List<Product> productsList = session.createQuery("from Product where productGroup_id = "+ id).list();
	for(Product q : productsList){
		logger.info("Product List::"+q);
	//return productsList;
}
	return productsList;






}


@Override
public int getVisibleProductsCount(long productGroupId) {
	

	logger.info("getUserServiceRequests called>>"+this.getClass().getSimpleName());
	Session session = this.sessionFactory.getCurrentSession();
	
	
	

	String hql = "SELECT * FROM PRODUCT where is_active"  + 
             "=:is_active and productGroup_id=:productGroup_id";
SQLQuery query = session.createSQLQuery(hql);
query.addEntity(Product.class);

query.setParameter("is_active", "Y");
query.setParameter("productGroup_id",productGroupId);

List<Product> activeProductsList = query.list();


//	@SuppressWarnings("unchecked")
//	List<RequestService> serviceRequestList = session.createQuery("from RequestService where UserId = " + user.getUserId()+" and status="+requestType).list();
	
	logger.info("list of service request retrieved successfully >>"+activeProductsList.size()+">>"+this.getClass().getSimpleName());
	return activeProductsList.size();
}


@Override
public User getUserById(long userId) {
	Session session = this.sessionFactory.getCurrentSession();	
	User user= (User) session.get(User.class, new Long(userId));
	return user;
}




}
