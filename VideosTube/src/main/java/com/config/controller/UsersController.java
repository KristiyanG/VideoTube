package com.config.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.config.dao.UserDAO;
import com.config.model.User;

@Controller
public class UsersController {
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Model model,@RequestParam("username") String username,@RequestParam("password") String password){
		
		if(UserDAO.getInstance().login(username, password)){
			System.out.println("User exist");
			model.addAttribute("user", UserDAO.getInstance().getUserByUsername(username));
			return "home";
		}
		model.addAttribute("msg", "Invalid username or password !");
		return "login";
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage(Model model){
		System.out.println("GET");
		return "login";
	}

}
