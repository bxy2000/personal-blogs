package com.bosic.blog.domain;

import java.util.UUID;

import org.junit.Test;

public class UuidTest {
	@Test
	public void testUUID() {
		String uuid = UUID.randomUUID().toString();
		
		System.out.println(uuid.length());
		System.out.println(uuid);
	}
}
