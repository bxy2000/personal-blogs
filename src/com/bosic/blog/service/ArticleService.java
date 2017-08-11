package com.bosic.blog.service;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.bosic.blog.domain.Article;

@Service
public class ArticleService extends GenericService<Article, Long> {
	/**
	 * 根据分类和搜索内容查找一页数据
	 */
	public PagedList<Article> findPage(int pageIndex, int pageSize, Long topicId, String search) {
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
	
	/**
	 * 获取热门文章
	 */
	public List<Article> findHots(Long topicId){
		if(topicId == null || topicId == 0){
			return findPage(1, 10, "", "order by u.hot desc").getRows();
		} else {
			return findPage(1, 10, "where u.topic.id = ?", "order by u.hot desc", topicId).getRows();
		}
	}
	
	/**
	 * 获取推介文章
	 */
	public List<Article> findPromotions(Long topicId){
		if(topicId == null || topicId == 0){
			return findPage(1, 10, "", "order by u.promotion desc").getRows();
		} else {
			return findPage(1, 10, "where u.topic.id = ?", "order by u.promotion desc", topicId).getRows();
		}
	}
	
	/**
	 * 获取某作者某主题的全部文章
	 */
	public List<Article> findArticlesByUserId(Long topicId, Long userId){
		if(topicId == null || topicId == 0) {
			return findAll("where u.user.id = ?", "order by u.serialNo, u.id desc", userId);
		} else {
			return findAll("where u.topic.id = ? and u.user.id = ?", "order by u.serialNo, u.id desc", topicId, userId);
		}
	}
	
	/**
	 * 设置成同一系列文章.
	 */
	public void updateSerialNo(Long[] ids){
		if(ids == null) return;
		if(ids.length == 1) return;
		
		Article article = genericRepository.find(ids[0]);
		String serialNo = article.getSerialNo();
		if(serialNo == null || serialNo.equals("")){
			serialNo = UUID.randomUUID().toString();
		}
		
		for(Long id: ids){
			Article a = genericRepository.find(id);
			
			a.setSerialNo(serialNo);
			
			genericRepository.update(a);
		}
	}
}
