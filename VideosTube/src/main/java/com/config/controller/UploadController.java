package com.config.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.config.dao.UserDAO;
import com.config.exception.CreateUserException;
import com.config.model.User;

@Controller
public class UploadController {

	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String prepareNewAddress(Model model){
		model.addAttribute("user", new User());
		return "upload";
	}

	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String addReadyAddress(@ModelAttribute("user") User user, Model model){
		System.out.println("User password is  "+ user.getPassword());
		try {
			System.out.println("in  dao");
			UserDAO.getInstance().registerUser(user.getUsername(), user.getPassword(), user.getEmail());
			System.out.println("out dao");
		} catch (CreateUserException e) {
			model.addAttribute("msg", e.getMessage());
			return "register";
		}
		
		return "upload";
	}
}
