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

	@RequestMapping(value="video/like", method=RequestMethod.GET)
	public @ResponseBody Video likeVideo(HttpSession ses,HttpServletRequest req){
		String videoName = req.getParameter("videoName").trim();
		if(ses.getAttribute("user")==null){
			Video video = VideoDAO.getInstance().getVideoByName(videoName);
			return video;
		}
		
		User user = (User)ses.getAttribute("user");
		Video video = VideoDAO.getInstance().likeVideo(videoName, user.getUsername());
		
		if(video==null){
			System.out.println("VIDEO IS NULL");
			return null;
		}
		
		return video;
	}
	
	@RequestMapping(value="video/dislike", method=RequestMethod.GET)
	public @ResponseBody Video dislikeVideo(HttpSession ses,HttpServletRequest req){
		String videoName = req.getParameter("videoName").trim();
		if(ses.getAttribute("user")==null){
			Video video = VideoDAO.getInstance().getVideoByName(videoName);
			return video;
		}
		
		User user = (User)ses.getAttribute("user");
		Video video = VideoDAO.getInstance().dislikeVideo(videoName, user.getUsername());
		
		if(video==null){
			System.out.println("VIDEO IS NULL");
			return null;
		}
		return video;
	}


	@RequestMapping(value="writeComment", method=RequestMethod.GET)
	public @ResponseBody Comment commentVideo(HttpSession ses,HttpServletRequest req){
		String comment =req.getParameter("commentText").trim();
		String videoName =req.getParameter("videoName").trim();
		User user = (User)ses.getAttribute("user");
		Video video = VideoDAO.getInstance().getVideoByName(videoName);
		Comment com = CommentDAO.getInstance().saveComment(user, comment, video);
		
		if(com==null){
			System.out.println("VIDEO IS NULL");
			return null;
		}
		return com;
	}

	
}
