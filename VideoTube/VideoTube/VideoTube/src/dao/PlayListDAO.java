package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import model.Playlist;

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
			ResultSet rs = stm.executeQuery("Select id, name,user_name from playlists");
			while(rs.next()){
				long id = rs.getLong("id");
				String name = rs.getString("name");
				String username = rs.getString("user_name");
				Playlist pl = new Playlist(username, name, id);
				
				loadPlaylistVideos(pl);
				if(!playlist.containsKey(username)){
					playlist.put(username,new HashSet<>());
				}
				playlist.get(username).add(pl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void loadPlaylistVideos(Playlist pl) {
		
		this.connection = DBManager.getInstance().getConnection();
		String sql = "Select video_name FROM playlist_video where playlist_id = ?";
		try {
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setLong(1, pl.getId());
			ResultSet rs = stm.executeQuery();
			while(rs.next()){
				String video = rs.getString("video_name");
				pl.addVideoInPlaylist(video);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public Set<Playlist> getUserPlayList(String username){
		if(playlist.containsKey(username)){
			return Collections.unmodifiableSet(playlist.get(username));
			
		}
		return new HashSet<Playlist>();
	}
}
