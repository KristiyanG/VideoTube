package com.config.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.config.dao.PlayListDAO;
import com.config.dao.UserDAO;
import com.config.dao.VideoDAO;
import com.config.exception.CreateUserException;
import com.config.model.Playlist;
import com.config.model.User;
import com.config.model.Video;

@Controller
public class UsersController {

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpSession ses, @RequestParam("username") String username,
			@RequestParam("password") String password) {

		if (UserDAO.getInstance().login(username, password)) {
			System.out.println("User exist");
			model.addAttribute("videos", VideoDAO.getInstance().getAllVideos());
			ses.setAttribute("user", UserDAO.getInstance().getUserByUsername(username));
			return "home";
		}

		System.out.println("User do not exist");
		model.addAttribute("msg", "Invalid username or password !");
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(HttpSession ses) {
		ses.removeAttribute("user");

		return "login";
	}

	@RequestMapping(value = "/video", method = RequestMethod.GET)
	public String video(HttpServletRequest req, HttpServletResponse resp, Model model) throws IOException {

		String videoname = req.getParameter("name");
		Video video = VideoDAO.getInstance().getVideoByName(videoname);
		VideoDAO.getInstance().viewVideo(video);
		model.addAttribute("video", video);
		model.addAttribute("comments", video.showVideoComments());
		return "video";
	}

	@RequestMapping(value = "/video/{video}", method = RequestMethod.GET)
	@ResponseBody
	public void videoAddress(@PathVariable("video") String videoName, HttpServletResponse resp, Model model) {

		Video video = VideoDAO.getInstance().getVideoByName(videoName);
		if (video == null) {
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

	@RequestMapping(value = "/doSearch", method = RequestMethod.GET)
	public String searchBar(@RequestParam("search") String name, @RequestParam("type") String type, Model model) {

		if (type.equals("Video")) {
			model.addAttribute("videos", VideoDAO.getInstance().searchVideos(name));
			return "videos";
		} else if (type.equals("Channel")) {
			model.addAttribute("channels", UserDAO.getInstance().searchUsers(name));
			return "channels";
		} else {
			model.addAttribute("playlists", PlayListDAO.getInstance().getAllPlaylists());
			return "playlists";
		}
	}

	@RequestMapping(value = "/searchChannel", method = RequestMethod.GET)
	public @ResponseBody List<User> searchChannel(@RequestParam("search") String name,
			@RequestParam("type") String type, Model model) throws CreateUserException {

		List<User> res = UserDAO.getInstance().searchUsers(name);
		List<User> users = new ArrayList<>();
		for (User user : res) {
			User u = new User(user.getUsername(), user.getPassword(), user.getProfilePic(), user.getEmail());
			users.add(u);
		}

		return users;
	}

	@RequestMapping(value = "/myChannel/{username}", method = RequestMethod.GET)
	@ResponseBody
	public void getProfilePic(@PathVariable("username") String username, HttpSession ses, HttpServletResponse resp,
			Model model) {

		String userPic = UserDAO.getInstance().getUserByUsername(username).getProfilePic();
		if(userPic == null){
			System.out.println("NO PIC");
			return;
		}
		File file = new File("profilePic/" + userPic);
		
		try {
			Files.copy(file.toPath(), resp.getOutputStream());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
	}

	@RequestMapping(value = "/myChannel", method = RequestMethod.POST)
	public String receiveUpload(@RequestParam("userPic") MultipartFile multiPartFile, Model model, HttpSession ses)
			throws IOException {

		User user = (User) ses.getAttribute("user");
		if(user == null){
			System.out.println("CANT GET USER FROM SESSION");
		}
		String fileName = multiPartFile.getOriginalFilename();
		UserDAO.getInstance().changeProfilePicture(fileName, user.getUsername());
		
		File dir = new File("profilePic");
		File file = new File (dir, fileName);
		
		Files.copy(multiPartFile.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
		
		// String fileName = multiPartFile.getOriginalFilename();
		// UserDAO.getInstance().changeProfilePicture(fileName,
		// user.getUsername());

		// File file = new File ( fileName);
		// Files.copy(multiPartFile.getInputStream(), file.toPath(),
		// StandardCopyOption.REPLACE_EXISTING);

		List<Video> userVideos = VideoDAO.getInstance().getUserVideos(user.getUsername());
		model.addAttribute("videos", userVideos);
		return "myChannel";
	}

	@RequestMapping(value = "/createPlaylist", method = RequestMethod.POST)
	@ResponseBody
	public Playlist createPlaylist(@RequestParam("name") String name, HttpSession ses) {
		User user = (User) ses.getAttribute("user");
		if (user == null) {
			System.out.println("No user in session to create playlist");
			return null;
		}

		Playlist pl = PlayListDAO.getInstance().createPlaylist(name, user.getUsername());

		System.out.println(pl == null);

		return pl;
	}
}
