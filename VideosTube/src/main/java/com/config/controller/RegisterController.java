package com.config.controller;

import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.config.dao.UserDAO;
import com.config.dao.VideoDAO;
import com.config.exception.CreateUserException;
import com.config.model.User;
import com.config.model.Video;

@Controller
public class RegisterController {

	@RequestMapping(value="/register", method=RequestMethod.GET)
	public String prepareNewAddress(Model model){
		model.addAttribute("user", new User());
		return "register";
	}

	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String addReadyAddress(@ModelAttribute("user") User user, Model model){
		try {
			UserDAO.getInstance().registerUser(user.getUsername(), user.getPassword(), user.getEmail());
			
		} catch (CreateUserException e) {
			model.addAttribute("msg", e.getMessage());
			return "register";
		}
		Set<Video> videos = VideoDAO.getInstance().getAllVideos();
		model.addAttribute("videos", videos);
		return "home";
	}
}
