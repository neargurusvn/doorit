package com.doorit.spring.dao;

import java.util.List;

import com.doorit.spring.model.ProsProfile;
import com.doorit.spring.model.Reports;
import com.doorit.spring.model.RequestService;
import com.doorit.spring.model.User;

public interface ReportDao {

	public List<RequestService> fetchRequests();

	public List<User> fetchUsers();

	public List<ProsProfile> fetchVendors();

}
