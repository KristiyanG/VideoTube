package com.config.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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
		return "login";
	}

	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage(HttpSession ses){
		ses.removeAttribute("user");
		return "login";
	}

	@RequestMapping(value="/video", method=RequestMethod.GET)
	public String displayVideo(){
		return "video";
	}
	
	@RequestMapping(value="/video/{videoname}", method=RequestMethod.GET)
	public String video(@PathVariable("videoname") String videoname, HttpServletResponse resp, Model model) throws IOException{
		
		System.out.println("Search video - - " + videoname);
		Video video = VideoDAO.getInstance().getVideoByName(videoname);
		model.addAttribute("video", video);
		
		System.out.println("--------------" + video.getAddress() + " " + video.getName());
		
//		String location = "C:/Users/Parapanov/Desktop/VideosFolder/tsveta-Pyrvoto.mp4";
//		File file = new File(location);
//		Files.copy(file.toPath(), resp.getOutputStream());
		return "video";
	}
	
	@RequestMapping(value="/video/address/{video}", method=RequestMethod.GET)
	@ResponseBody
	public void videoAddress(@PathVariable("video") String videoName, HttpServletResponse resp, Model model){
	
		System.out.println("@@@@@@@@@@@@@@@@@@@@v Video Addres " + videoName);
		Video video = VideoDAO.getInstance().getVideoByName(videoName);
		if(video == null){
			return;
		}
		File file = new File(video.getAddress());
		
		try {
			Files.copy(file.toPath(), resp.getOutputStream());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
	}
	
	@RequestMapping(value="/grids", method=RequestMethod.GET)
	public String grids(HttpSession ses, Model model){
		
		String address = "C:/Users/Parapanov/Desktop/VideosFolder/tsveta-Pyrvoto.mp4";
		
//		Video video = VideoDAO.getInstance().getVideoByName("Pyrvoto");
		
		List<Video> videos = VideoDAO.getInstance().getAllVideos();
		
		model.addAttribute("videos", videos);
		return "grids";
	}

	@RequestMapping(value="/doSearch", method=RequestMethod.GET)
	public @ResponseBody List<Video> searchBar(
			@RequestParam("search") String name, 
			@RequestParam("type") String type,
			Model model){
		
		if(type.equals(type)){
			return VideoDAO.getInstance().searchVideos(name);
		}
		List<Video> searchVideos = VideoDAO.getInstance().getAllVideos();
		model.addAllAttributes(searchVideos);
		return searchVideos;
	}
}
