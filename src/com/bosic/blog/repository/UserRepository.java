package com.bosic.blog.repository;

import org.springframework.stereotype.Repository;

import com.bosic.blog.domain.User;

@Repository
public class UserRepository extends GenericRepository<User, Long> {
}
