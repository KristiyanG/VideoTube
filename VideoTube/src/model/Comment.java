package model;

import java.time.LocalDate;
import java.util.Collections;

import java.util.Set;
import java.util.TreeSet;

public class Comment {

	private User user;
	private String text;
	private LocalDate date;
	private TreeSet<Comment> replies ;
	public Comment(User user, String text, LocalDate date) {
		this.user = user;
		this.text = text;
		this.date = date;
		this.replies = new TreeSet<Comment>((v1,v2)->v1.getDate().compareTo(v2.getDate()));
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
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
	
	public void addComment(Comment com){
		this.replies.add(com);
	}
	
	public void removeComment(Comment com ){
		this.replies.remove(com);
	}
	public Set<Comment> showReplies(){
		return (Set<Comment>) Collections.unmodifiableSet(replies);
	}
	
	
	
}
