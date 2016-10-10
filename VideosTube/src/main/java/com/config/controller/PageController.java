package com.config.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.config.dao.UserDAO;
import com.config.dao.VideoDAO;
import com.config.model.User;
import com.config.model.Video;

@Controller
public class PageController {

	@RequestMapping(value="/myChannel", method=RequestMethod.GET)
	public String getMyChannelPage(){
		
		return "myChannel";
	}
	
	@RequestMapping(value="/userProfile", method=RequestMethod.GET)
	public String getUserChannel(@RequestParam("name") String searchedUser,Model model){
		User user =UserDAO.getInstance().getUserByUsername(searchedUser);
		model.addAttribute("userChannel",user );
		model.addAttribute("videos",VideoDAO.getInstance().getUserVideos(searchedUser) );
		return "user";
	}
	
	@RequestMapping(value="home", method=RequestMethod.GET)
	public String getHome(Model model){
		List<Video> videos = VideoDAO.getInstance().getAllVideos();
		model.addAttribute("videos", videos);
		return "home";
	}
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String getIndexPage(){
		return "home";
	}
	

	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String getSearchPage(){
		return "search";
	}
}
