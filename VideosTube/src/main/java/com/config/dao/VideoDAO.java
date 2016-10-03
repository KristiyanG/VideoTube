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

	public synchronized static VideoDAO getInstance() {
		if (instance == null) {

			instance = new VideoDAO();
			instance.loadVideos();
			

		}
		return instance;
	}

	private void loadVideos() {
		try {

			this.connection = DBManager.getInstance().getConnection();
			Statement st = DBManager.getInstance().getConnection().createStatement();
			ResultSet resultSet = st
					.executeQuery("SELECT name,views,category,description,video_address,user_name,date_upload"
							+ "FROM videos join users where videos.user_name=users.username ;");
			while (resultSet.next()) {
				Date input = resultSet.getDate("date_upload");
				LocalDate date = input.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
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

	public boolean uploadVideo(String name, String category, String description, String uploader, String address) {
		LocalDate localDate = LocalDate.now();
		Date date = (Date) Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());

		if (videos.containsKey(name)) {
			return false;
		} else if (addVideoInCollection(name, category, description, uploader, address, date)) {
			return saveVideoInDB(name, category, description, uploader, address, date);

		}
		return false;
	}

	private boolean saveVideoInDB(String name, String category, String description, String uploader, String address,
			Date date) {
		try {
			this.connection = DBManager.getInstance().getConnection();

			String sql = "insert into users(name,category,description,uploader,address,date) values(?,?,?,?,?,?);";
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, name);
			stm.setString(2, category);
			stm.setString(3, description);
			stm.setString(4, uploader);
			stm.setString(5, address);
			stm.setDate(6 , date);

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

	private boolean addVideoInCollection(String name, String category, String description, String uploader,
			String address, Date date) {
		LocalDate localdate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		Video video = new Video(name, uploader, category, 0, localdate, description, address);
		videos.put(name, video);
		return true;
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
		if(videos.containsKey(videoName)){
			video = videos.get(videoName);
		}
		return video;
	}
	

}
