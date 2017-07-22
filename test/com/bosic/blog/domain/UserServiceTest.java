package com.bosic.blog.domain;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bosic.blog.service.PagedList;
import com.bosic.blog.service.UserService;

import junit.framework.TestCase;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml"})
public class UserServiceTest {
	@Autowired
	private UserService userService;
	
	@Test
	public void testAdd() {
		User user = new User("bxy", "123");
		
		userService.add(user);
		
		TestCase.assertNotNull(user.getId());
	}

	@Test
	public void testUpdate() {
		User user = new User("bxy", "123");
		user.setId(2L);
		
		userService.update(user);
		
		User user2 = userService.find(2L);
		
		TestCase.assertEquals("bxy", user2.getUsername());
	}

	@Test
	public void testDeletePK() {
		userService.delete(100L);
		
		User user = userService.find(100L);
		
		TestCase.assertNull(user);
	}

	@Test
	public void testFindPK() {
		User user = userService.find(1L);
		
		TestCase.assertNotNull(user);
		
		User user2 = userService.find(100L);
		
		TestCase.assertNull(user2);
	}

	@Test
	public void testFindAll() {
		List<User> users = userService.findAll();
		
		TestCase.assertTrue(users.size() > 0);
	}

	@Test
	public void testFindPageIntInt() {
		PagedList<User> users = userService.findPage(1, 10);
		
		TestCase.assertTrue(users.getRows().size() >= 0 && users.getRows().size() <= 10 );
	}

}
