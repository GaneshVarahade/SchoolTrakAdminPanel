package com.fidelit.service;

import com.fidelit.model.Account;

public interface AuthenticationService {

	
public Account authenticateUser(String username,String password,String accountId);


}
