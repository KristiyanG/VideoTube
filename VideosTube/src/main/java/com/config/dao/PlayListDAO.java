package com.config.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import com.config.model.Playlist;
import com.config.model.User;

public class PlayListDAO {
	
	private static HashMap<String, Set<Playlist>>playlist = new HashMap<String, Set<Playlist>>();// username - > set playlist

	private static PlayListDAO instance;

	private Connection connection;

	private PlayListDAO() {
	}

	public synchronized static PlayListDAO getInstance() {
		if (instance == null) {

			instance = new PlayListDAO();
			instance.loadPlayList();
		}
		return instance;
	}

	private void loadPlayList() {
		
		this.connection = DBManager.getInstance().getConnection();
		try {
			Statement stm = connection.createStatement();
			ResultSet rs = stm.executeQuery("Select name, user_name from playlists");
			while(rs.next()){
				String name = rs.getString("name");
				String username = rs.getString("user_name");
				Playlist pl = new Playlist(username, name);
				
				loadPlaylistVideos(pl);
				if(!playlist.containsKey(username)){
					playlist.put(username,new HashSet<>());
				}
				playlist.get(username).add(pl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	private void loadPlaylistVideos(Playlist pl) {
		
		this.connection = DBManager.getInstance().getConnection();
		String sql = "Select video_name FROM playlist_video where playlist_name = ?";
		try {
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, pl.getName());
			ResultSet rs = stm.executeQuery();
			while(rs.next()){
				String video = rs.getString("video_name");
				pl.addVideoInPlaylist(video);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Set<Playlist> getUserPlayList(String username){
		if(playlist.containsKey(username)){
			return Collections.unmodifiableSet(playlist.get(username));
		}
		return new HashSet<Playlist>();
	}

	public Playlist createPlaylist(String name, String username) {
		User user = UserDAO.getInstance().getUserByUsername(username);
		
		try {
			this.connection = DBManager.getInstance().getConnection();
			String query = "INSERT INTO playlists (name, user_name) VALUES (?, ?);";
			PreparedStatement stm = connection.prepareStatement(query);
			stm.setString(1, name);
			stm.setString(2, username);
			stm.executeUpdate();
			
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
				return null;
			}

		return user.createPlaylist(name);
	}
}
