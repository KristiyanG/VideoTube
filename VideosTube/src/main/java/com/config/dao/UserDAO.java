package com.config.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import com.config.exception.CreateUserException;
import com.config.model.Channel;
import com.config.model.User;

public class UserDAO {

	private static HashMap<String, User> users = new HashMap<String, User>();// username -> user
																																			
	private static UserDAO instance;

	private Connection connection;

	private UserDAO() {
	}

	public synchronized static UserDAO getInstance() {
		if (instance == null) {

			instance = new UserDAO();
			instance.loadUsers();

		}
		return instance;
	}

	private void loadUsers() {
		try {

			this.connection = DBManager.getInstance().getConnection();
			Statement st = DBManager.getInstance().getConnection().createStatement();
			ResultSet resultSet = st.executeQuery("SELECT username, password, profilePic, email FROM users;");
			while (resultSet.next()) {
				User user = new User(resultSet.getString("username"),
						resultSet.getString("password"), resultSet.getString("email"));
				loadChannel(user);
				loadAbonatedChannels(user);
				loadLikedVideos(user);
				
				users.put(resultSet.getString("username"), user);

			}
		} catch (SQLException e) {
			System.out.println("Oops, cannot make statement.");
			System.out.println(e.getMessage());

		} catch (CreateUserException e) {
			System.out.println(e.getMessage() + " error in loading users from DB ");
		}

	}

	private void loadLikedVideos(User user) {
		this.connection = DBManager.getInstance().getConnection();
		String sql = "Select video_name from user_liked_videos where user_name = ?";
		try {
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, user.getUsername());
			ResultSet rs = stm.executeQuery();
			while(rs.next()){
				user.addVideoInLikedVideos(VideoDAO.getInstance().getVideoByName(rs.getString("video_name")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void loadChannel(User user) {
		Channel channel = ChannelDAO.getInstance().getUserChannel(user.getUsername());
		user.setChannel(channel);
	}

	private void loadAbonatedChannels(User user) {

		this.connection = DBManager.getInstance().getConnection();
		
		try {
			
			PreparedStatement st = connection.prepareStatement("SELECT channel_name FROM subscribes where user_name = ?;");
			st.setString(1, user.getUsername());
			ResultSet resultSet = st.executeQuery();
			while(resultSet.next()){
			
				Channel channel = ChannelDAO.getInstance().getUserChannel(resultSet.getString("channel_name"));
				user.subscribeChannel(channel);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public User getUserByUsername(String username) {
		User user = null;
		if (users.containsKey(username)) {
			user = users.get(username);
		}
		return user;
	}

	public boolean registerUser(String name, String password, String email) throws CreateUserException {
		System.out.println("Registe user in DAO");
		if(name.length()>12||name.length()<4){
			throw new CreateUserException("Username must be >4 and < 12");
		}
		if (users.containsKey(name)) {
			throw new CreateUserException("User with this username already exist !");
		} else if (addInCollection(name, password, email)) {
			return addInDB(name, password, email);
		}

		return false;
	}

	private boolean addInDB(String name, String password, String email) {

		try {
			this.connection = DBManager.getInstance().getConnection();

			String sql = "insert into users(username,password,email) values(?,?,?);";
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, name);
			stm.setString(2, password);
			stm.setString(3, email);

			stm.executeUpdate();

			connection.close();
			return true;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
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

	private boolean addInCollection(String name, String password, String email) throws CreateUserException {
		User user = new User(name, password, email);
		users.put(name, user);
		return true;
	}
	
	public boolean login(String username , String password){
		if(users.containsKey(username)){
			if(users.get(username).isValidPassword(password)){
				
				return true;
			}
		}
		return false;
	}
	

	
}
