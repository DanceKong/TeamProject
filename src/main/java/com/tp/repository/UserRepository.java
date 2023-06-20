package com.tp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tp.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String> {
	
	
	UserEntity findByUsername(String username);
	boolean existsByUsername(String username);
	UserEntity findByUsernameAndPassword(String username, String password);
	void deleteUserByUsername(String username);
	
	

	
}
