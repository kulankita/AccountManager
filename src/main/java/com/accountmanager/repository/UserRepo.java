package com.accountmanager.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.accountmanager.entities.User;
@Repository
public interface UserRepo extends JpaRepository<User, Integer> {
	
	//User findByUsername(String username);
	
	@Query("select u from com.accountmanager.entities.User u where u.username=?1 and u.password=?2")
	public User findUsernameAndPassword(String unm, String pass);
	

}
