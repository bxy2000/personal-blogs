package com.bosic.blog.web.controller.admin;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bosic.blog.domain.User;
import com.bosic.blog.service.PagedList;
import com.bosic.blog.service.UserService;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value={"/index", "/index/{id}"})
	public String index(@PathVariable(required=false)Integer id, Model model) throws Exception {
		int pageIndex = id == null ? 1 : id;
		int pageSize = 20;
		
		PagedList<User> users = userService.findPage(pageIndex, pageSize, "", "");
		
		model.addAttribute("users", users);
		
		return "admin/user/index";
	}
	
	@RequestMapping("/create")
	public String create(Model model) throws Exception {
		return "admin/user/create";
	}
	
	@RequestMapping("/edit/{id}")
	public String edit(@PathVariable(required=false) Long id, Model model) throws Exception {
		User user = userService.find(id);
		model.addAttribute("user", user);
		return "admin/user/edit";
	}
	
	@RequestMapping("/save")
	public String save(User user) throws Exception {
		if(user.getId() == null) {
			user.setCreateDate(new Date());
			userService.add(user);
		} else {
			userService.update(user);
		}
		
		return "redirect:/admin/user/index";
	}
	
	@RequestMapping(value={"/delete", "/delete/{id}"})
	public String delete(@PathVariable(required=false) Long id, @RequestParam(required=false)Long[] ids) throws Exception {
		if(id == null) {
			userService.delete(ids);
		} else {
			userService.delete(id);
		}
		
		return "redirect:/admin/user/index";
	}
}
