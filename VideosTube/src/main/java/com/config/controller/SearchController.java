package com.config.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.config.dao.CommentDAO;
import com.config.dao.UserDAO;
import com.config.dao.VideoDAO;
import com.config.model.Comment;
import com.config.model.User;
import com.config.model.Video;

@RestController
public class SearchController {


	
	@RequestMapping(value="/userSearch", method=RequestMethod.GET)
	public String getSearchUser(Model model,HttpServletRequest req){
		System.out.println("tyka sum");
//		User u = UserDAO.getInstance().getUserByUsername(req.getParameter("username"));
//		if(u!=null){
//			model.addAttribute("username", u.getUsername());
//		return u.getUsername();
//		}
		return null;
	}
	
	@RequestMapping(value="video/like", method=RequestMethod.GET)
	
	public @ResponseBody Video likeVideo(HttpSession ses,HttpServletRequest req){
		System.out.println("TYKA SUMMM");
		String videoName =req.getParameter("videoName").trim();
		if(ses.getAttribute("user")==null){
			Video video = VideoDAO.getInstance().getVideoByName(videoName);
			return null;
		}
		User user = (User)ses.getAttribute("user");
		System.out.println("++++"+videoName+"+++");
		Video video = VideoDAO.getInstance().likeVideo(videoName, user.getUsername());
		
		if(video==null){
			System.out.println("VIDEO IS NULL");
			return null;
		}
		System.out.println("Video likes before print "+video.getLikes());
		return video;
	}
	
@RequestMapping(value="video/dislike", method=RequestMethod.GET)
	
	public @ResponseBody Video dislikeVideo(HttpSession ses,HttpServletRequest req){
		System.out.println("TYKA SUMMM");
		String videoName =req.getParameter("videoName").trim();
		if(ses.getAttribute("user")==null){
			Video video = VideoDAO.getInstance().getVideoByName(videoName);
			return video;
		}
		
		User user = (User)ses.getAttribute("user");
		System.out.println("++++"+videoName+"+++");
		Video video = VideoDAO.getInstance().dislikeVideo(videoName, user.getUsername());
		
		if(video==null){
			System.out.println("VIDEO IS NULL");
			return null;
		}
		System.out.println("Video dislikes before print "+video.getLikes());
		return video;
	}


@RequestMapping(value="writeComment", method=RequestMethod.GET)

public @ResponseBody Comment commentVideo(HttpSession ses,HttpServletRequest req){
	System.out.println("TYKA SUMMM");
	String comment =req.getParameter("commentText").trim();
	String videoName =req.getParameter("videoName").trim();
	User user = (User)ses.getAttribute("user");
	Video video = VideoDAO.getInstance().getVideoByName(videoName);
	Comment com =CommentDAO.getInstance().saveComment(user, comment, video);
	
	if(com==null){
		System.out.println("VIDEO IS NULL");
		return null;
	}
	System.out.println("Comment date"+com.getDate());
	return com;
}

	
}
