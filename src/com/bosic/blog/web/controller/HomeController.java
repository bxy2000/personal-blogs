package com.bosic.blog.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bosic.blog.domain.Article;
import com.bosic.blog.service.ArticleService;
import com.bosic.blog.service.PagedList;
import com.bosic.blog.service.TopicService;

@Controller
public class HomeController {
	@Autowired
	private TopicService topicService;
	@Autowired
	private ArticleService articleService;

	@RequestMapping(value={"/", "/home/index", "/home/index/{id}"})
	public String index(@PathVariable(required=false) Long id, Long tid, String search, Model model) {
		// 获取分类信息
		model.addAttribute("topics", topicService.findAll0());
		// 获取热门文章
		model.addAttribute("hots", articleService.findHots(tid));
		// 获取推介文章
		model.addAttribute("promotions", articleService.findPromotions(tid));
		
		// 获取文章列表
		int pageIndex = id == null ? 1 : id.intValue();
		int pageSize = 20;
		search = search == null ? "" : search;
		
		PagedList<Article> articles = articleService.findPage(pageIndex, pageSize, tid, search);
		model.addAttribute("articles", articles);
		
		return "home/index";
	}
	
	@RequestMapping(value={"/home/read/{id}"})
	public String read(@PathVariable Long id, Long tid, Model model) throws Exception {
		// 获取当前文章
		Article article = articleService.find(id);
		if(article == null){
			throw new Exception("没有找到相应的博文！");
		}
		model.addAttribute("article", article);
		
		// 获取分类信息
		model.addAttribute("topics", topicService.findAll0());
		// 获取某作者所有文章
		model.addAttribute("articles", articleService.findArticlesByUserId(tid, article.getUser().getId()));
		return "home/read";
	}
}
