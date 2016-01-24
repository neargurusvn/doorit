package com.doorit.spring.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.doorit.spring.model.Document;
import com.doorit.spring.model.User;

public interface DocumentDAO {
	public List<Document> list();
	public void save(MultipartFile file ,Document document);
	public void saveUser(MultipartFile file ,User document);
	public void saveQuote(MultipartFile file ,Document document);
	public User get(long id) ;
	public void remove(Integer id) ;
	public Document getQuoteFile(long prosId,long requestId) ;
	
	
}
