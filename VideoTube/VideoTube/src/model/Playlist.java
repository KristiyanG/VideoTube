package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Playlist {

	private User user;
	private String name;
	private List<Video> videos;
	
	public Playlist(User user, String name) {
		
		this.user = user;
		this.name = name;
		this.videos= new ArrayList<>();
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public void addVideoInPlaylist(Video video){
		this.videos.add(video);
	}
	
	public List<Video> getVideosFromPlaylist(){
		return Collections.unmodifiableList(videos);
	}
	public void removeVideoFromList(Video video){
		this.videos.remove(video);
	}
	
	
}
