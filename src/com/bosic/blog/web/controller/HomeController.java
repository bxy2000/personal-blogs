package com.bosic.blog.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bosic.blog.domain.Article;
import com.bosic.blog.domain.Topic;
import com.bosic.blog.service.ArticleService;
import com.bosic.blog.service.PagedList;
import com.bosic.blog.service.TopicService;

@Controller
public class HomeController {
	@Autowired
	private TopicService topicService;
	@Autowired
	private ArticleService articleService;

	@RequestMapping(value={"/", "/{id}"})
	public String index(@PathVariable(required=false) Integer id, Integer tid, String search, Model model) {
		// 获取分类信息
		List<Topic> topics = topicService.findAll();
		topics.add(0, new Topic(0L, "全部"));
		model.addAttribute("topics", topics);

		// 获取文章列表
		int pageIndex = id == null ? 1 : id;
		int pageSize = 20;
		search = search == null ? "" : search;
		
		PagedList<Article> articles = articleService.findPage(pageIndex, pageSize, tid, search);
		model.addAttribute("articles", articles);
		return "home/index";
	}
	
	@RequestMapping(value={"/article/{id}"})
	public String read(@PathVariable Long id, Model model) throws Exception {
		// 获取当前文章
		Article article = articleService.find(id);
		if(article == null){
			throw new Exception("没有找到相应的博文！");
		}
		model.addAttribute("article", article);

		// 获取分类信息
		List<Topic> topics = topicService.findAll();
		topics.add(0, new Topic(0L, "全部"));
		model.addAttribute("topics", topics);
		
		return "home/read";
	}
}
