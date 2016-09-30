package model;

import java.time.LocalDate;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

public class Comment {

	private long id;
	private String user;
	private String videoName;
	private String text;
	private LocalDate date;
	private HashSet<String> likes ;//username
	public Comment(long id,String user, String text, LocalDate date,String videoName) {
		this.user = user;
		this.id = id;
		this.text = text;
		this.date = date;
		this.videoName = videoName;
		this.likes = new HashSet<>();
	}
	
	
	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getVideoName() {
		return videoName;
	}


	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public LocalDate getDate() {
		return date;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	
	public boolean isLikeComment(String username){
		if(likes.contains(username)){
			return true;
		}
		return false;
	}
	
	
	public void removeUserFromLikesComment(String username){
		likes.remove(username);
	}
	public void addUserInLikesComment(String username ){
		likes.add(username);
	}
	
	public int likesOnComment(){
		return likes.size();
	}
	
	
	
}
