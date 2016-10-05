package com.config.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.config.dao.UserDAO;

@Controller
public class UsersController {
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(Model model,HttpSession ses,@RequestParam("username") String username,@RequestParam("password") String password){
		System.out.println("User login controller 6666666666666666666666666666666666666");
		if(UserDAO.getInstance().login(username, password)){
			System.out.println("User exist");
			
			ses.setAttribute("user", UserDAO.getInstance().getUserByUsername(username));
			return "home";
		}
		System.out.println("User do not exist");
		model.addAttribute("msg", "Invalid username or password !");
		return "login";
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage(HttpSession ses){
		ses.removeAttribute("user");
		return "login";
	}

}
