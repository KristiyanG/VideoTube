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
import com.config.exception.CreateUserException;
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
		
		
//		String location = "C:/Users/Parapanov/Desktop/VideosFolder/tsveta-Pyrvoto.mp4";
//		File file = new File(location);
//		Files.copy(file.toPath(), resp.getOutputStream());
		return "video";
	}
	
//	@RequestMapping(value="video/like", method=RequestMethod.GET)
//	@ResponseBody
//	public int likeVideo(HttpSession ses,HttpServletRequest req){
//		String videoName =req.getParameter("videoName").trim();
//		int likes = Integer.parseInt(req.getParameter("likes"));
//		if(ses.getAttribute("user")==null){
//			return likes;
//		}
//		User user = (User)ses.getAttribute("user");
//		System.out.println("++++"+videoName+"+++");
//		Video video = VideoDAO.getInstance().likeVideo(videoName, user.getUsername());
//		
//		if(video==null){
//			System.out.println("VIDEO IS NULL");
//			return likes;
//		}
//		System.out.println("Video likes before print "+video.getLikes());
//		return video.getLikes();
//	}
	
	@RequestMapping(value="/video/{video}", method=RequestMethod.GET)
	@ResponseBody
	public void videoAddress(@PathVariable("video") String videoName, HttpServletResponse resp, Model model){
	
		System.out.println("SEARCH VIDEO WITH NAME " + videoName);
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
		
			return VideoDAO.getInstance().searchVideos(name);		
	}

	@RequestMapping(value="/searchChannel", method=RequestMethod.GET)
	public @ResponseBody List<User> searchChannel(
			@RequestParam("search") String name, 
			@RequestParam("type") String type,
			Model model) throws CreateUserException{
				
			List<User> res = UserDAO.getInstance().searchUsers(name);
			for (User user : res) {
				System.out.println(user);
			}
			System.out.println("GAAAAAAAAAAAAAAAAAAAAAAAAAA ");
			List<User> users = new ArrayList<>();
			User user = new User("Ivancho", "1234", "vanko@van.ko");
			for (int i = 0; i < 5; i++) {
				users.add(user);
			}
			return users;		
	}
	
	@RequestMapping(value="/myChannel/{username}", method=RequestMethod.GET)
	@ResponseBody
	public void getProfilePic(@PathVariable("username") String username, HttpServletResponse resp, Model model){
	
//		Video video = VideoDAO.getInstance().getVideoByName(videoName);
		String userPic = UserDAO.getInstance().getUserByUsername(username).getProfilePic();
		if(userPic == null){
			System.out.println("NO PIC");
			return;
		}
		File file = new File(userPic);
		
		try {
			Files.copy(file.toPath(), resp.getOutputStream());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@" + userPic);
	}
}
