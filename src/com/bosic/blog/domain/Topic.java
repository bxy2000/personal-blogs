package com.bosic.blog.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="topic")
public class Topic {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(name="topic_name", length=80)
	private String topicName;
	
	public Topic() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Topic(Long id, String topicName) {
		super();
		this.id = id;
		this.topicName = topicName;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTopicName() {
		return topicName;
	}
	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}
	@Override
	public String toString() {
		return "Topic [id=" + id + ", topicName=" + topicName + "]";
	}
}
