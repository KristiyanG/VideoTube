package com.config.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.config.dao.UserDAO;
import com.config.dao.VideoDAO;
import com.config.model.Channel;
import com.config.model.User;
import com.config.model.Video;

@Controller
public class PageController {

	@RequestMapping("/index.jsp")
	public String hello() {
	    return "home";
	}
	
	@RequestMapping(value="/myChannel", method=RequestMethod.GET)
	public String getMyChannelPage(Model model, HttpSession ses){
		
		User user = (User) ses.getAttribute("user");
		if(user != null){
			List<Video> userVideos = VideoDAO.getInstance().getUserVideos(user.getUsername());
			model.addAttribute("userVideos", userVideos);
		}
		return "myChannel";
	}
	
	@RequestMapping(value="/userProfile", method=RequestMethod.GET)
	public String getUserChannel(@RequestParam("name") String searchedUser, Model model, HttpSession ses){
		User user = UserDAO.getInstance().getUserByUsername(searchedUser);
		model.addAttribute("userChannel", user);
		model.addAttribute("videos", VideoDAO.getInstance().getUserVideos(searchedUser) );
		
		User userOnSession =  (User) ses.getAttribute("user");
		if(user == userOnSession){
			List<Video> userVideos = VideoDAO.getInstance().getUserVideos(user.getUsername());
			model.addAttribute("userVideos", userVideos);
			return "myChannel";
		}
		return "user";
	}
	
	@RequestMapping(value="home", method=RequestMethod.GET)
	public String getHome(Model model){
		List<Video> videos = VideoDAO.getInstance().getAllVideos();
		model.addAttribute("videos", videos);
		return "home";
	}
	

	@RequestMapping(value="/*", method = RequestMethod.GET)
	public String getIndexPage(Model model){
		List<Video> videos = VideoDAO.getInstance().getAllVideos();
		model.addAttribute("videos", videos);
		return "home";
	}

	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String getSearchPage(){
		return "search";
	}
	

	@RequestMapping(value="simple", method = RequestMethod.GET)
	public String searchBar(Model model, HttpSession ses){
		
		User user = (User) ses.getAttribute("user");
		
		model.addAttribute("subscribers", user.getChannels());
		model.addAttribute("userVideos", VideoDAO.getInstance().getUserVideos(user.getUsername()));
		return "simplePage";	
	}
	
	@RequestMapping(value="likeds", method = RequestMethod.GET)
	public String likedVideos(Model model, HttpSession ses){
		User user = (User) ses.getAttribute("user");
		model.addAttribute("likedVideos", user.getLikedVideos());
		return "likedVideos";	
	}
	
	@RequestMapping(value="abonatedChannals", method = RequestMethod.GET)
	public String abonatedChannals(Model model, HttpSession ses){
		
		User user = (User) ses.getAttribute("user");
		List<User> users = new ArrayList<>();
		for (Channel chan : user.getChannels()) {
			users.add(UserDAO.getInstance().getUserByUsername(chan.getName()));
		}
		model.addAttribute("channels", users);
		return "channels";	
	}
	
	@RequestMapping(value="myPlaylists", method = RequestMethod.GET)
	public String myPlaylists(Model model, HttpSession ses){

		User user = (User) ses.getAttribute("user");
		model.addAttribute("playlists", user.getPlayLists());
		return "playlists";	
	}
	
	@RequestMapping(value="myVideos", method = RequestMethod.GET)
	public String myVideos(Model model, HttpSession ses){
		User user = (User) ses.getAttribute("user");
		model.addAttribute("videos", VideoDAO.getInstance().getUserVideos(user.getUsername()));
		return "videos";	
	}
	
	@RequestMapping(value="myVideos/{user}", method = RequestMethod.GET)
	public String myVideos(@PathVariable("user") String username, Model model, HttpSession ses){

		User user = UserDAO.getInstance().getUserByUsername(username.trim());
		model.addAttribute("likedVideos", user.getLikedVideos());
		
		return "likedVideos";	
	}
	
	
	@RequestMapping(value="userPlaylists", method = RequestMethod.GET)
	public String userPlaylists(
			@RequestParam("username") String username, 
			Model model, 
			HttpSession ses){

		User user = UserDAO.getInstance().getUserByUsername(username);
		model.addAttribute("playlists", user.getPlayLists());
		return "playlists";	
	}
	
	@RequestMapping(value="userVideos", method = RequestMethod.GET)
	public String userVideos(
			@RequestParam("username") String username, 
			Model model){
		User user = UserDAO.getInstance().getUserByUsername(username);
		model.addAttribute("videos", VideoDAO.getInstance().getUserVideos(user.getUsername()));
		return "videos";	
	}
}
