package com.config.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.config.model.Comment;
import com.config.model.User;
import com.config.model.Video;

@Controller
public class UsersController {
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(
			Model model, 
			HttpSession ses, 
			@RequestParam("username") String username,
			@RequestParam("password") String password){
		

		if(UserDAO.getInstance().login(username, password)){
			System.out.println("User exist");
			
			ses.setAttribute("user", UserDAO.getInstance().getUserByUsername(username));
			return "home";
		}
		System.out.println("User do not exist");
		model.addAttribute("msg", "Invalid username or password !");
		return "home";
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage(HttpSession ses){
		ses.removeAttribute("user");

		return "login";
	}

//	@RequestMapping(value="/video", method=RequestMethod.GET)
//	public String displayVideo(){
//		return "video";
//	}
	
	@RequestMapping(value="/video", method=RequestMethod.GET)
	public String video(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException{
		
		String videoname = req.getParameter("name");
		System.out.println("Search video - - " + videoname);
		Video video = VideoDAO.getInstance().getVideoByName(videoname);
		VideoDAO.getInstance().viewVideo(video);
		model.addAttribute("video", video);
		model.addAttribute("comments", video.showVideoComments());
		return "video";
	}
	
	

	@RequestMapping(value="/video/{video}", method=RequestMethod.GET)
	@ResponseBody
	public void videoAddress(@PathVariable("video") String videoName, HttpServletResponse resp, Model model){
	
		System.out.println("SEARCH VIDEO WITH NAME " +videoName);
		Video video = VideoDAO.getInstance().getVideoByName(videoName);
		if(video == null){
			System.out.println("NO SUCH VIDEO ");
			return;
		}
		
		File file = new File(video.getAddress());
		
		
		try {
			Files.copy(file.toPath(), resp.getOutputStream());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
	}
	
//	@RequestMapping(value="/grids", method=RequestMethod.GET)
//	public String grids(HttpSession ses, Model model){
//		
//		
//		Video video = VideoDAO.getInstance().getVideoByName("Purvoto");
//		
//		List<Video> videos = new ArrayList();
//		
//		System.out.println(video.getAddress());
//		
//		for(int i = 0; i < 4; i++){
//			videos.add(video);
//		}
//		
//		model.addAttribute("videos", videos);
//		return "grids";
//	}
}
