package model;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;


public class Channel {

	private String user ;
	private String description;
	private HashSet<String> subscribes;//username ->user
	private HashSet<String> videos;//title -> video
	
	public Channel(String user,String description) {
		this.description = description;
		this.user = user;
		this.videos= new HashSet<>();
		this.subscribes= new HashSet<>();
		
	}
	
	
	
	public Channel(String user) {
		this.user = user;
		this.videos= new HashSet<>();
		this.subscribes= new HashSet<>();
		
	}
	public String getName() {
		return user;
	}
	public void setName(String user) {
		this.user = user;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void addVideoInChannel(String videoName){
		this.videos.add( videoName);
	}
	public void removeVideoFromChannel(String videoName){
		this.videos.remove(videoName);
	}
	public List<String> allVideosInChannel(){
		return Collections.unmodifiableList( (List<String>) videos);
	}
	public void addUserInChannel(String username){
		this.subscribes.add( username);
	}
	public void removeUserFromChannel(String username){
		this.subscribes.remove(username);
	}
//	public User getUserByNameFromChannel(String name){
//		User u = null;
//		if(subscribes.contains(name)){
//			u =subscribes.get(name);
//		}
//		
//		return u;
//	}
	public List<String> getAllUsersInChannel(){
		return Collections.unmodifiableList((List<String>)subscribes);
	}
	
	public int usersInChannel(){
		return subscribes.size();
	}
	
	
}