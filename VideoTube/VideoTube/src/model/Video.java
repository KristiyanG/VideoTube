package model;

import java.util.Collections;
import java.util.HashMap;
import java.util.Set;
import java.util.TreeSet;

public class Video {

	private String name; 
	private User uploader;
	private String category;
	private TreeSet<Comment> comments;
	private	HashMap<String, User> likes; //username ->User
	private HashMap<String,User> dislikes ; 
	private int view;
	public Video(String name, User uploader, String category, int view) {
		super();
		this.name = name;
		this.uploader = uploader;
		this.category = category;
		this.view = view;
		this.likes = new HashMap<>();
		this.dislikes = new HashMap<>();
		this.comments = new TreeSet<>();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public User getUploader() {
		return uploader;
	}
	public void setUploader(User uploader) {
		this.uploader = uploader;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	
	public int getLikes(){
		return likes.size();
	}
	
	public int getDislikes(){
		return dislikes.size();
	}
	
	public int commentsCount(){
		return comments.size();
	}
	public void likeVideo(User user){
		if(!likes.containsKey(user.getName())){
			likes.put(user.getName(), user);
			if(dislikes.containsKey(user.getName())){
				dislikes.remove(user.getName());
			}
		}
	}
	public void dislikeVideo(User user){
		if(!this.dislikes.containsKey(user.getName())){
			this.dislikes.put(user.getName(), user);
			if(likes.containsKey(user.getName())){
				likes.remove(user.getName());
			}
		}
	}
	
	public void addComment(Comment com){
		this.comments.add(com);
	}
	public void removeComment(Comment com ){
		this.comments.remove(com);
	}
	
	public Set<Comment> showVideoComments(){
		return (Set<Comment>) Collections.unmodifiableSet(comments);
	}
	
	
	
	

}
