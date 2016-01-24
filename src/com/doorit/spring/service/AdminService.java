package com.doorit.spring.service;

import java.util.List;

import com.doorit.spring.model.Option;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProductGroup;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Question;
import com.doorit.spring.model.Reports;
import com.doorit.spring.model.User;

public interface AdminService {

	public List<Product> listProduct();
	public List<Product> listProductByProductGroup(long productGroupId);
	public List<Product> listProductByTag(String tagName);
	public List<ProductGroup> listProductGroup();
	public List<Question> listQuestion();
	public List<Option> listOption();
	public void addProduct(ProductGroup pg,Product p);
	public void addProductGroup(ProductGroup p);
	public void addUser(User user);
	public void addQuestion(Product p ,Question q);
	public void addOption(Option o ,Question q);
	public Product getProductById(long id);
	public ProductGroup getProductGroupById(long id);
	public Question getQuestionById(long id);
	public Option getOptionById(long id);
	public List<Question> getQuesByProductId(long id);
	public List<Option> getOptionByQueId(long id);
	public void removeProductGroup(long id);
	public void removeProduct(long id);
	/*
	
	public void updatePerson(Person p);
	public List<Person> listPersons();
	public Person getPersonById(int id);
	
	*/
	public void saveProductGroup(ProductGroup productGroup);
	public void updateProduct(Product product);
	public void updateOption(Option option);
	public void deleteOption(long optionId);
	public void deleteQuestion(long questionId);
	public void deleteProduct(long productId);
	public void deleteProductGroup(long productGroupId);
	public void updateQuestion(Question question);
	public void saveVendorVerify(long pros_id, String verification);
	public void visibleProductGroup(long productGroupId, String isActive);
	public void visibleProduct(long productId, String isActive);
	//public void visibleProductGroup(long productGroupId, String isActive, long id);
	//void visibleProduct(long productId, String isActive, long productGroupId);
	public User getUserById(long userId);
	
}
