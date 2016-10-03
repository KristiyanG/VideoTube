package com.config.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.config.model.User;



@Controller
public class RegisterController {

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String prepareNewAddress(Model model){
		model.addAttribute("user", new User());
		return "register";
	}

	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String addReadyAddress(@ModelAttribute User user, Model model){
		System.out.println(user.getUsername());
		model.addAttribute("greeting", "Address created successfully");
		return "hello";
	}
	
	
}
