package com.bosic.blog.service;

import org.springframework.stereotype.Service;

import com.bosic.blog.domain.Article;

@Service
public class ArticleService extends GenericService<Article, Long> {
	public PagedList<Article> findPage(int pageIndex, int pageSize, Integer topicId, String search) {
		String where = "";
		
		if(topicId != null && topicId != 0){
			where += "and topic_id = " + topicId + " ";
		}
		
		if(search != null && !"".equals(search)){
			where += "and title like '%" + search + "%'";
		}
		
		if(!"".equals(where)){
			where = "where " + where.substring(4);
		}
		
		return findPage(pageIndex, pageSize, where, "order by id desc");
	}
}
