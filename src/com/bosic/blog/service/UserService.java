package com.bosic.blog.service;

import org.springframework.stereotype.Service;

import com.bosic.blog.domain.User;

@Service
public class UserService extends GenericService<User, Long> {
	public boolean login(String username, String password){
		User user = findByUsername(username);
		
		return user != null && user.getPassword().equals(password);
	}
	
	public User findByUsername(String username){
		return find("where u.username = ?", username);
	}
}
