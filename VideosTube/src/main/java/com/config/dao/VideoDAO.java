package com.config.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.config.model.Comment;
import com.config.model.User;
import com.config.model.Video;

public class VideoDAO {

	private static HashMap<String, Video> videos = new HashMap<String, Video>();
	private static VideoDAO instance;

	private Connection connection;

	private VideoDAO() {
	}

	public boolean uploadVideo(
			String name, 
			String category, 
			String description, 
			String uploader, 
			String address) {
		
		LocalDate localDate = LocalDate.now();
		Date date = Date.valueOf(localDate);
		
		if (videos.containsKey(name)) {
			return false;
		} else if (addVideoInCollection(name, category, description, uploader, address, localDate)) {
			return saveVideoInDB(name, category, description, uploader, address, date);
		}
		return false;
	}

	public synchronized static VideoDAO getInstance(){
		if (instance == null) {

			instance = new VideoDAO();
			instance.loadVideos();
			

		}
		return instance;
	}

	public List<Video> getUserVideos(String userName){
		List<Video> userVideos = new ArrayList<Video>();
		for(Video v : videos.values()){
			if(v.getUploader().equals(userName)){
				userVideos.add(v);
			}
		}
		return userVideos;
	}
	
	public Video getVideoByName(String videoName){
		Video video = null;
		System.out.println("Videos size "+ videos.size());
		for(String s : videos.keySet()){
			System.out.println(s);
		}
		if(videos.containsKey(videoName)){
			video = videos.get(videoName);
		}
		return video;
	}
	
	private void loadVideos() {
		try {

			this.connection = DBManager.getInstance().getConnection();
			Statement st = DBManager.getInstance().getConnection().createStatement();
			ResultSet resultSet = st
					.executeQuery(
							"SELECT name, views, category, description, video_address, user_name, date_upload FROM videos;");
			while (resultSet.next()) {
				Date input = resultSet.getDate("date_upload");
				
				LocalDate date = input.toLocalDate();
				Video video = new Video(resultSet.getString("name"), resultSet.getString("user_name"),
						resultSet.getString("category"), resultSet.getInt("views"), date,
						resultSet.getString("description"), resultSet.getString("video_address"));
				loadVideoLikes(video);
				loadVideoDislikes(video);
				loadVideoComments(video);
				videos.put(resultSet.getString("name"), video);

			}
		} catch (SQLException e) {
			System.out.println("Oops, cannot make statement.");
			System.out.println(e.getMessage());
		}

	}

	private void loadVideoComments(Video video) {
		
		List<Comment> videoComment = CommentDAO.getInstance().getCommentsForVideo(video.getName());
		for(Comment com : videoComment){
			video.addComment(com);
		}
		
	}

	private void loadVideoDislikes(Video video) {
		this.connection = DBManager.getInstance().getConnection();
		PreparedStatement st;
		try {
			String sql = "SELECT user_name FROM user_dislike_videos where video_name = ?;";
			st = connection.prepareStatement(sql);
			st.setString(1, video.getName());
			ResultSet rs = st
					.executeQuery();
			while(rs.next()){
				String userName = rs.getString("user_name");
				video.dislikeVideo(userName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	private void loadVideoLikes(Video video) {

		this.connection = DBManager.getInstance().getConnection();
		PreparedStatement st;
		try {
			String sql = "SELECT user_name FROM user_liked_videos where video_name = ?;";
			st = connection.prepareStatement(sql);
			st.setString(1, video.getName());
			ResultSet rs = st
					.executeQuery();
			while(rs.next()){
				String userName = rs.getString("user_name");
				video.likeVideo(userName);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		
	}

	private boolean saveVideoInDB(
			String name, 
			String category, 
			String description, 
			String uploader, 
			String address,
			Date date) {
		
		try {
			this.connection = DBManager.getInstance().getConnection();
//			insert into youtube.videos(name, views, likes, dislikes, date_upload, description, video_address, category, channel_name, user_name) 
//			insert into youtube.videos(name, category, description, user_name, video_address, date_upload, channel_name) 
			String sql = "insert into videos(name, views, likes, dislikes, "
					+ "date_upload, description, video_address, category, "
					+ "channel_name, user_name) "
					+ "values(?,?,?,?,?,?,?,?,?,?);";
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, name);
			stm.setInt(2, 0);
			stm.setInt(3, 0);
			stm.setInt(4, 0);
			stm.setDate(5, date);
			stm.setString(6, description);
			stm.setString(7, address);
			stm.setString(8, category);
			stm.setString(9, uploader);
			stm.setString(10, uploader);

			stm.executeUpdate();

			connection.close();
			return true;

		} catch (SQLException e) {
			System.out.println(e.getStackTrace());
			return false;
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	private boolean addVideoInCollection(
			String name, 
			String category, 
			String description, 
			String uploader,
			String address, 
			LocalDate date) {
		
		Video video = new Video(name, uploader, category, 0, date, description, address);
		videos.put(name, video);
		return true;
	}
	
}
