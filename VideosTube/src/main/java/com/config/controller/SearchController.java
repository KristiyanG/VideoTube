package com.config.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.config.dao.UserDAO;
import com.config.model.User;

@RestController
@RequestMapping(value="/searchUser")
public class SearchController {

	@RequestMapping(value="{name}", method = RequestMethod.GET)
	public @ResponseBody User getShopInJSON(@PathVariable String name) {

		User u = UserDAO.getInstance().getUserByUsername(name);
		if(u!=null){
		return u;
		}

		return null;

	}

	
	@RequestMapping(value="/userSearch", method=RequestMethod.GET)
	public String getSearchUser(Model model,HttpServletRequest req){
		System.out.println("tyka sum");
//		User u = UserDAO.getInstance().getUserByUsername(req.getParameter("username"));
//		if(u!=null){
//			model.addAttribute("username", u.getUsername());
//		return u.getUsername();
//		}
		return null;
	}
}
