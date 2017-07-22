package com.bosic.blog.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="article")
public class Article {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(length=80)
	private String title;
	@Column(length=30)
	private String author;
	@Lob
	@Column(columnDefinition="longtext")
	private String content;
	@Column(name="create_date")
	private Date createDate;
	@Column
	private Integer promotion;
	@Column
	private Integer hot;
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="topic_id")
	private Topic topic;
	
	public Article() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Article(String title, String author, String content, Date createDate, Integer promotion, Integer hot,
			Topic topic) {
		super();
		this.title = title;
		this.author = author;
		this.content = content;
		this.createDate = createDate;
		this.promotion = promotion;
		this.hot = hot;
		this.topic = topic;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Integer getPromotion() {
		return promotion;
	}
	public void setPromotion(Integer promotion) {
		this.promotion = promotion;
	}
	public Integer getHot() {
		return hot;
	}
	public void setHot(Integer hot) {
		this.hot = hot;
	}
	public Topic getTopic() {
		return topic;
	}
	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	@Transient
	public String getProfile(){
		if(content == null || "".equals(content)){
			return "";
		} else {
			return content.length() > 300 ? content.substring(0, 300) : content;
		}
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", author=" + author + ", content=" + content
				+ ", createDate=" + createDate + ", promotion=" + promotion + ", hot=" + hot + ", topic=" + topic + "]";
	}
}
