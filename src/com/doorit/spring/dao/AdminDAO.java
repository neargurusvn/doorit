package com.doorit.spring.dao;

import java.util.List;

import com.doorit.spring.model.Option;
import com.doorit.spring.model.Product;
import com.doorit.spring.model.ProductGroup;
import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Question;
import com.doorit.spring.model.Reports;
import com.doorit.spring.model.User;

public interface AdminDAO {

	public List<Product> listProduct();
	public List<Product> listProductByProductGroup(long productGroupId);
	public List<Product> listProductByTag(String tagName);
	public List<ProductGroup> listProductGroup();
	public List<Question> listQuestion();
	public List<Option> listOption();
	public void addProduct(ProductGroup pg , Product p);
	public void addProductGroup(ProductGroup p);
	public void addUser(User user);
	public Product getProductById(long id);
	public void addQuestion( Product p ,Question q);
	public void addOption(Option o ,Question q);
	public Question getQuestionById(long id);
	public Option getOptionById(long id);
	public List<Question> getQuesByProductId(long id);
	public List<Option> getOptionByQueId(long id);
	public ProductGroup getProductGroupById(long id);
	public void removeProductGroup(long id);
	public void removeProduct(long id);
	public void saveProductGroup(ProductGroup productGroupObj);
	public void updateProduct(Product productObj);
	public void updateOption(Option optionObj);
	public void deleteOption(long optionId);
	public void deleteQuestion(long questionId);
	public void deleteProduct(long productId);
	void deleteProductGroup(long productGroupId);
	public void updateQuestion(Question questionObj);
	
	public void saveVendorVerify(ProsProfile pros_id);
	//public User getUserById(long userId);
	//public ProsProfile getprosProfileById(long userId);
	ProsProfile getprosProfileById(long pros_id);
	public void visibleProductGroup(ProductGroup productgroup);
	public void visibleProduct(Product product);
	public List<Product> getProductListById(long id);
	//public List<Product> listProductByProductId(long productId);
	//public List<Product> getProductList();
	public int  getVisibleProductsCount(long productGroupId);
	User getUserById(long userId);
	
}
