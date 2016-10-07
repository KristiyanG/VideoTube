package com.config.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.config.dao.VideoDAO;
import com.config.model.Video;

@Controller
public class PageController {

	@RequestMapping(value="/myChannel", method=RequestMethod.GET)
	public String getMyChannelPage(){
		
		return "myChannel";
	}
	
	@RequestMapping(value="home", method=RequestMethod.GET)
	public String getHome(Model model){
		List<Video> videos = VideoDAO.getInstance().getRandomVideos();
		model.addAttribute("videos", videos);
		return "home";
	}
	
//	@RequestMapping(value="", method=RequestMethod.GET)
//	public String home(Model model){
//		List<Video> videos = VideoDAO.getInstance().getRandomVideos();
//		model.addAttribute("videos", videos);
//		return "home";
//	}

	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String getSearchPage(){
		return "search";
	}
}
