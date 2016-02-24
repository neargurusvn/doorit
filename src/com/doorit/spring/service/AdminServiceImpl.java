package com.doorit.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doorit.spring.dao.AdminDAO;
import com.doorit.spring.dao.CustomerDAO;
import com.doorit.spring.model.Option;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProductGroup;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Question;
import com.doorit.spring.model.Reports;
import com.doorit.spring.model.User;
import com.doorit.spring.model.WrapRequestService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private EmailNotificationService EmailNotificationService;
	private CustomerDAO customerDAO;
	private AdminDAO adminDAO;
	
		
	public void setAdminDAO(AdminDAO adminDAO) {
		this.adminDAO = adminDAO;
	}

	@Override
	@Transactional
	public void addProduct(ProductGroup pg , Product p) {
		p.setIsActive("Y");
		this.adminDAO.addProduct( pg , p);
		
	}

	@Override
	@Transactional
	public void addUser(User user) {
		
		this.adminDAO.addUser(user);
		
	}

	@Override
	@Transactional
	public List<Product> listProduct() {
		return this.adminDAO.listProduct();
	}

	@Override
	@Transactional
	public Product getProductById(long id) {
			return this.adminDAO.getProductById(id);
	}

	@Override
	@Transactional
	public void addQuestion(Product p ,Question q) {
		this.adminDAO.addQuestion(p, q);
		
	}

	@Override
	@Transactional
	public List<Question> listQuestion() {
		return this.adminDAO.listQuestion();
	}

	@Override
	@Transactional
	public void addOption(Option o, Question q) {
		this.adminDAO.addOption(o, q);
		
	}

	@Override
	@Transactional
	public Question getQuestionById(long id) {
		return this.adminDAO.getQuestionById(id);
	}

	@Override
	@Transactional
	public List<Option> listOption() {
		return this.adminDAO.listOption();
		
	}

	@Override
	@Transactional
	public Option getOptionById(long id) {
		return this.adminDAO.getOptionById(id);
		
	}

	@Override
	@Transactional
	public List<Question> getQuesByProductId(long id) {
		return this.adminDAO.getQuesByProductId( id);
	}

	@Override
	@Transactional
	public List<Option> getOptionByQueId(long id) {
		return this.adminDAO.getOptionByQueId( id);
	}

	@Override
	@Transactional
	public void addProductGroup(ProductGroup p) {
		this.adminDAO.addProductGroup(p);
		
	}

	@Override
	@Transactional
	public List<ProductGroup> listProductGroup() {
		return this.adminDAO.listProductGroup();
		
	}

	@Override
	@Transactional
	public ProductGroup getProductGroupById(long id) {
		return this.adminDAO.getProductGroupById( id);
	}

	@Override
	@Transactional
	public User getUserById(long userId) {
		return this.adminDAO.getUserById(userId);
	}
	
	@Override
	@Transactional
	public List<Product> listProductByTag( String tagName) {
			
		return this.adminDAO.listProductByTag(tagName);
	}

	@Override
	@Transactional
	public List<Product> listProductByProductGroup(long productGroupId) {
		
		return this.adminDAO.listProductByProductGroup(productGroupId);
	}

	@Override
	@Transactional
	public void removeProductGroup(long id) {
		 this.adminDAO.removeProductGroup(id);
		
	}

	@Override
	@Transactional
	public void removeProduct(long id) {
		this.adminDAO.removeProduct(id);
		
	}
	
	@Transactional
	@Override
	public void saveProductGroup(ProductGroup productGroup) {
		
		ProductGroup productGroupObj=this.adminDAO.getProductGroupById(productGroup.getProductGroupId());
		productGroupObj.setProductGroupName(productGroup.getProductGroupName());
		productGroupObj.setProductGroupDesc(productGroup.getProductGroupDesc());
		this.adminDAO.saveProductGroup(productGroupObj);
		
	}
	@Transactional
	@Override
	public void updateProduct(Product product) {
		
		Product productObj=this.adminDAO.getProductById(product.getProductId());
		productObj.setProductName(product.getProductName());
		productObj.setProductDesc(product.getProductDesc());
		this.adminDAO.updateProduct(productObj);
		
	}
	@Transactional
	@Override
	public void updateOption(Option option) {
		
		Option OptionObj=this.adminDAO.getOptionById(option.getOptId());
		OptionObj.setOptDesc(option.getOptDesc());
		
		this.adminDAO.updateOption(OptionObj);
		
	}
	@Transactional
	@Override
	public void deleteOption(long optionId) {
		
		this.adminDAO.deleteOption(optionId);
		
	}
	@Transactional
	@Override
	public void deleteQuestion(long questionId) {
		
		this.adminDAO.deleteQuestion(questionId);
	}

	@Transactional
	@Override
	public void deleteProduct(long productId) {
		
		this.adminDAO.deleteProduct(productId);
		
	}
	@Transactional
	@Override
	public void deleteProductGroup(long productGroupId) {
		
		this.adminDAO.deleteProductGroup(productGroupId);
		
	}

	@Transactional
	@Override
	public void updateQuestion(Question question) {
		
		Question QuestionObj=this.adminDAO.getQuestionById(question.getQueId());
		
		QuestionObj.setQueDesc(question.getQueDesc());
		QuestionObj.setQueType(question.getQueType());
		QuestionObj.setQueReq(question.getQueReq());
		QuestionObj.setMaxLen(question.getMaxLen());
		QuestionObj.setName_class(question.getName_class());
		
		this.adminDAO.updateQuestion(QuestionObj);
		
	}

	@Transactional
	@Override
	public void saveVendorVerify(long pros_id, String verification) {
		
		ProsProfile proUser=this.adminDAO.getprosProfileById(pros_id);
		proUser.setVerification(verification);
		this.adminDAO.saveVendorVerify(proUser);
		
		if(proUser.getVerification().equals("Y"))
		{
		
			User user=this.adminDAO.getUserById(proUser.getUser().getUserId());
	     	//User user=this.customerDAO.getUserById(proUser.getUser().getUserId());
		   WrapRequestService wrapRequestService =new WrapRequestService();
		   wrapRequestService.setProUser(user);
		
	
	    	this.EmailNotificationService.mailToProsForVerify(wrapRequestService);
	    	//EmailNotificationService.mailToProsForVerify(wrapRequestService);
		
		}
		
		
	}
 
	@Transactional
	@Override
	public void visibleProductGroup(long productGroupId, String isActive) {

		String methodName ="visibleProductGroup(long productGroupId, String isActive) ";
		
		//logger.info(methodName+ " visible or invisible ProductGroup>>"+this.getClass().getSimpleName());
		
		
		ProductGroup productgroup=this.adminDAO.getProductGroupById(productGroupId);
		//Product product=this.adminDAO.getProductById(productId);
		if(isActive.equals("Y")){
			
		List<Product> productsList=this.adminDAO.listProductByProductGroup(productGroupId);
			// on this call another method in service layer in which take list of products for the product group and set them as inactive
			productgroup.setIsActive("N");;
			for(Product productObj:productsList){
				
				Product product = this.adminDAO.getProductById(productObj.getProductId());
				product.setIsActive("N");
				this.adminDAO.visibleProduct(product);
				this.adminDAO.visibleProductGroup(productgroup);
			}
			if(isActive.equals("N")){
				
				this.adminDAO.visibleProductGroup(productgroup);
					}
			
			
			
			
			
		}
		
		
		
		
		
	}

	@Transactional
	@Override
	public void visibleProduct(long productId, String isActive) {

		String methodName ="visibleProduct(long productId, String isActive) ";
		
		
		Product product=this.adminDAO.getProductById(productId);
		ProductGroup productGroup=this.adminDAO.getProductGroupById(product.getProductGroup().getProductGroupId());
		
		
		
		
			
			if(isActive.equals("Y")){
				
				product.setIsActive("N");;
				this.adminDAO.visibleProduct(product); 
				int visibleProducts=this.adminDAO.getVisibleProductsCount(productGroup.getProductGroupId());
				if(visibleProducts==0){
					visibleProductGroup(productGroup.getProductGroupId(),"Y");
				}
			}
			else 
				if(isActive.equals("N")){
					
					
				//List<ProductGroup> productsGroupList=this.adminDAO.listProductGroup();
				product.setIsActive("Y");;
				this.adminDAO.visibleProduct(product); 
				 
				productGroup.setIsActive("Y");
				visibleProductGroup(productGroup.getProductGroupId(),"N");
	        
			}
			
			
			
			
		
		
		
		
		
	}

	private void getvisibleProducts() {
		// TODO Auto-generated method stub
		
	}

	
		
	

	

	
	/*@Transactional
	@Override
	public void saveVendorVerify(long pros_id, String verification) {
		
		//String methodName="saveVendorVerify(long userId, String verification)";
		ProsProfile pros_id=this.adminDAO.getprosProfileById(pros_id);
		pros_id.setVerification(verification);
	   	this.adminDAO.saveVendorVerify(pros_id);
		
	}
    */
	
	
	
		
	}
