package com.config.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PageController {

	@RequestMapping(value="/myChannel", method=RequestMethod.GET)
	public String getMyChannelPage(){
		return "myChannel";
	}
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String getHome(){
		return "home";
	}
	@RequestMapping(value="", method = RequestMethod.GET)
	public String getIndexPage(){
		return "home";
	}
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String getSearchPage(){
		return "search";
	}
}
