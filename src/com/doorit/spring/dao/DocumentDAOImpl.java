package com.doorit.spring.dao;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;

import javax.print.Doc;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.doorit.spring.model.Document;
import com.doorit.spring.model.User;

@Repository
public class DocumentDAOImpl implements DocumentDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(DocumentDAOImpl.class);
	
	//@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Autowired
	CustomerDAO customerDAO;
	
	
	public void save(MultipartFile file ,Document document) {
		
		logger.info(" save file   -"+"method name - save  "+this.getClass().getSimpleName());
		Session session = sessionFactory.getCurrentSession();
		Blob blob;
		
		
		document.setFilename(file.getOriginalFilename());
		document.setContentType(file.getContentType());
		try {
			blob = Hibernate.getLobCreator(session).createBlob(file.getInputStream(), -1);
			document.setContent(blob);
		} catch (IOException e) {
			
			//e.printStackTrace();
		}
		
		session.save(document);
		logger.info("  file saved successfully   -"+"method name - save  "+this.getClass().getSimpleName());
	}
	
	
	public void saveUser(MultipartFile file ,User document) {
		
		logger.info("  file updated started   -"+"method name - saveUser  "+this.getClass().getSimpleName());
		Session session = sessionFactory.getCurrentSession();
		Blob blob;
		document = customerDAO.getUserById(document.getUserId());
		
		document.setFilename(file.getOriginalFilename());
		document.setContentType(file.getContentType());
		try {
			blob = Hibernate.getLobCreator(session).createBlob(file.getInputStream(), -1);
			document.setContent(blob);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.info("  file updated successfully   -"+"method name - saveUser  "+this.getClass().getSimpleName());
		session.update(document);
	}
	
	
	
	public void saveQuote(MultipartFile file ,Document document) {
		
		logger.info("  save  quote from vendor for request  started   -"+"method name - saveQuote  "+this.getClass().getSimpleName());
		Session session = sessionFactory.getCurrentSession();
		Blob blob;
		
		
		document.setFilename(file.getOriginalFilename());
		document.setContentType(file.getContentType());
		try {
			blob = Hibernate.getLobCreator(session).createBlob(file.getInputStream(), -1);
			document.setContent(blob);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		session.save(document);
		logger.info("    quote from vendor saved   successfully   -"+"method name - saveQuote  "+this.getClass().getSimpleName());
	}
	
	
	public List<com.doorit.spring.model.Document> list() {
		
		logger.info(" retrieve list of documents -"+"method name - list  "+this.getClass().getSimpleName());
		Session session = sessionFactory.getCurrentSession();
		List<com.doorit.spring.model.Document> documents = null;
		try {
			documents = (List<Document>)session.createQuery("from Document ").list();

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		logger.info(" retrieve list of documents  successfully-"+"method name - list  "+this.getClass().getSimpleName());
		return documents;
	}
	
	
	public User get(long id) {
		
		logger.info(" get the document-"+"method name - get  "+this.getClass().getSimpleName());
		Session session = sessionFactory.getCurrentSession();
		return (User)session.get(User.class, id);
	}
	
	public Document getQuoteFile(long prosId,long requestId) {
Session session = this.sessionFactory.getCurrentSession();
		
		


		String hql = "SELECT * FROM documents where requestId"  + 
	             "=:requestId and  prosId=:prosId";
	SQLQuery query = session.createSQLQuery(hql);
	query.addEntity(Document.class);
	
	query.setParameter("requestId", requestId);
	query.setParameter("prosId", prosId);
	
	List<Document> document = query.list();
	
	if (document.size() !=0)
	{
		
		logger.info("  document fetched successfully-"+"method name - get  "+this.getClass().getSimpleName());
	return (Document) document.get(0);
	}else
	{
		return null;	
	}
		
		
	}

	
	public void remove(Integer id) {
		
		logger.info("  remove document -"+"method name - remove  "+this.getClass().getSimpleName());
		Session session = sessionFactory.getCurrentSession();
		
		Document document = (Document)session.get(Document.class, id);
		
		session.delete(document);
		logger.info("  removed document successfully -"+"method name - remove  "+this.getClass().getSimpleName());
	}
}
