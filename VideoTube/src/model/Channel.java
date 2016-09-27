package model;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;


public class Channel {

	private User user ;
	private String description;
	private HashMap<String,User> subscribes;//username ->user
	private HashMap<String,Video> videos;//title -> video
	
	
	
	public Channel(User user, String description) {
		this.user = user;
		this.description = description;
		this.videos= new HashMap<>();
		this.subscribes= new HashMap<>();
		
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void addVideoInChannel(Video video){
		this.videos.put(video.getName(), video);
	}
	public void removeVideoFromChannel(Video video){
		this.videos.remove(video.getName());
	}
	public List<Video> allVideosInChannel(){
		return Collections.unmodifiableList((List<Video>) videos.values());
	}
	public void addUserInChannel(User user){
		this.subscribes.put(user.getName(), user);
	}
	public void removeUserFromChannel(User user){
		this.subscribes.remove(user.getName());
	}
	public User getUserByNameFromChannel(String name){
		User u = null;
		if(subscribes.containsKey(name)){
			u =subscribes.get(name);
		}
		
		return u;
	}
	public List<User> getAllUsersInChannel(){
		return Collections.unmodifiableList((List<User>)subscribes.values());
	}
	
	public int usersInChannel(){
		return subscribes.size();
	}
	
	
}
