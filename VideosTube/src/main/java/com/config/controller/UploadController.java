package com.config.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.jcodec.api.JCodecException;
import org.jcodec.api.awt.FrameGrab;
import org.jcodec.api.awt.SequenceEncoder;
import org.jcodec.common.FileChannelWrapper;
import org.jcodec.common.NIOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import com.config.dao.VideoDAO;
import com.config.model.User;

@Controller
@SessionAttributes("user")
public class UploadController {
	private static final String FILE_LOCATION = "C:/Users/Parapanov/Desktop/VideosFolder";

	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String prepareForUpload() {
		return "upload";
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String receiveUpload(
			@RequestParam("video") MultipartFile multiPartFile, 
			@RequestParam("videoName") String videoName, 
			@RequestParam("category") String category,
			@RequestParam("description") String description,
			Model model, HttpSession ses) throws IOException{
					
		if(videoName == null || videoName.isEmpty() || videoName.length() > 100){
			model.addAttribute("status", "Invalid video name.");
			return "upload";
		}
		if(category == null || category.isEmpty() || category.length() > 50){
			model.addAttribute("status", "Invalid category.");
			return "upload";
		}
		if(description == null || description.isEmpty() || description.length() > 220){
			model.addAttribute("status", "Invalid description.");
			return "upload";
		}

		User user = (User) ses.getAttribute("user");
		
		if(!validateVideoFormat(multiPartFile.getContentType())){
			System.out.println("invalid format");
			model.addAttribute("status", "Invalid video format.");
			return "upload";
		}
		
		String type = ".";
		String[] format = multiPartFile.getContentType().split("/");
		if(format[0].equals("video")){
			type.concat(format[1]);
		}

		String fileFullName = videoName.concat(type);

	    File dir = new File(FILE_LOCATION);
	    if(!dir.exists()){
	    	dir.mkdir();
	    }
	    File videoFile = new File(dir, fileFullName);
		Files.copy(multiPartFile.getInputStream(), videoFile.toPath(), StandardCopyOption.REPLACE_EXISTING);		
		
		model.addAttribute("status", "Video: " + videoName + " uploaded.");
		String address = FILE_LOCATION.concat("/").concat(fileFullName);
		VideoDAO.getInstance().uploadVideo(videoName, category, description, user.getUsername(), address);
		return "upload";
	}

	private boolean validateVideoFormat(String contentType) {
		String[] contentParams = contentType.split("/");
		if(contentParams.length < 2 || 
				contentParams.length > 2 || (!contentParams[1].equals("mp4") || !contentParams[1].equals("ogg"))){
			return false;
		}
		return true;
	}
}
