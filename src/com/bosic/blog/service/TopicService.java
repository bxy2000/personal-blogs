package com.bosic.blog.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bosic.blog.domain.Topic;

@Service
public class TopicService extends GenericService<Topic, Long> {
	public List<Topic> findAll0(){
		List<Topic> result = super.findAll();
		
		result.add(0, new Topic(0L, "全部"));
		
		return result;
	}
}
