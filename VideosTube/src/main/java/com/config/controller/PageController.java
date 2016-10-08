package com.config.controller;

<<<<<<< HEAD
=======
import java.util.ArrayList;
>>>>>>> 9fb8b0b274c586f86e1d412fe7491e0c4a0a158f
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
<<<<<<< HEAD
		List<Video> videos = VideoDAO.getInstance().getAllVideos();
		model.addAttribute("videos", videos);
		return "home";
	}
	
	@RequestMapping(value="", method = RequestMethod.GET)
	public String getIndexPage(){
		return "home";
	}
	
=======
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

>>>>>>> 9fb8b0b274c586f86e1d412fe7491e0c4a0a158f
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String getSearchPage(){
		return "search";
	}
}
