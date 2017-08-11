package com.bosic.blog.web.controller.admin;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bosic.blog.domain.Article;
import com.bosic.blog.service.ArticleService;
import com.bosic.blog.service.PagedList;
import com.bosic.blog.service.TopicService;

@Controller
@RequestMapping("/admin/article")
public class AdminArticleController {
	@Autowired
	private TopicService topicService;
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(value={"/index", "/index/{id}"})
	public String index(@PathVariable(required=false) Integer id, Model model) throws Exception {
		int pageIndex = id == null ? 1 : id;
		int pageSize = 20;
		
		PagedList<Article> articles = articleService.findPage(pageIndex, pageSize, "", "order by u.id desc");
		
		model.addAttribute("articles", articles);
		
		return "admin/article/index";
	}
	
	@RequestMapping("/create")
	public String create(Model model) throws Exception {
		model.addAttribute("topics", topicService.findAll());
		
		return "admin/article/create";
	}
	
	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable(required=false) Long id, Model model) throws Exception {
		model.addAttribute("topics", topicService.findAll());

		Article article = articleService.find(id);
		model.addAttribute("article", article);
		return "admin/article/edit";
	}
	
	@RequestMapping("/save")
	public String save(Article article) throws Exception {
		if(article.getId() == null){
			article.setCreateDate(new Date());
			articleService.add(article);
		} else {
			articleService.update(article);
		}
		
		return "redirect:/admin/article/index";
	}
	
	@RequestMapping(value={"/delete", "/delete/{id}"})
	public String delete(@PathVariable(required=false) Long id, @RequestParam(required=false)Long[] ids) throws Exception {
		if(id == null) {
			articleService.delete(ids);
		} else {
			articleService.delete(id);
		}
		
		return "redirect:/admin/article/index";
	}
	
	@RequestMapping(value={"/serial"})
	public String delete(@RequestParam(required=false)Long[] ids) throws Exception {
		articleService.updateSerialNo(ids);
		return "redirect:/admin/article/index";
	}
}
