package com.bosic.blog.web.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bosic.blog.domain.User;
import com.bosic.blog.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private UserService userService;
	
	/**
	 * 进入后台管理首页
	 */
	@RequestMapping("/index")
	public String index() throws Exception {
		return "admin/index";
	}
	
	/**
	 * 进入登录页
	 */
	@RequestMapping("/login")
	public String login() throws Exception {
		return "admin/login";
	}
	
	/**
	 * 验证用户名密码是否正确
	 */
	@RequestMapping("/validate")
	public String validate(String username, String password, Model model, HttpSession session) throws Exception {
		System.out.println(username + " " + password);
		if(userService.login(username, password)){
			// 登录成功，保存用户到session中
			User user = userService.findByUsername(username);
			
			session.setAttribute("user", user);
			
			return "redirect:/admin/index";
		} else {
			// 否则，输出错误信息并返回到login视图
			model.addAttribute("error", "用户名密码错误！");
			return "admin/login";
		}
	}

	/**
	 * 退出后台管理
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		// 清除session中的user变量，重定向到登录页
		session.removeAttribute("user");
		return "redirect:/admin/login";
	}
}
