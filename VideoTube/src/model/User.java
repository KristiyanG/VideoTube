package model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import exception.CreateUserException;

public class User {
	public static final String DEFAULT_PROFILE_PICTURE = "..WebContent\\image\\profile-pic.jpg";
	private String name;
	private String password;
	private String profilePic;
	private String email;
	private String myChannel;
	private List<Channel> subscriptions;
	private TreeSet<History> history;
	private List<Video> likedVideos;
	private String playList;

	public User(String name, String password, String email) throws CreateUserException {
		super();
		if (name.length() < 4 || name.length() > 12) {
			throw new CreateUserException("Username must be >4 and < 12");
		}
		this.name = name;
		this.password = password;
		if (!isValidEmail(email)) {
			throw new CreateUserException("Invalid email !!!");
		}
		this.email = email;
		this.profilePic = DEFAULT_PROFILE_PICTURE;
		this.subscriptions = new ArrayList<>();
		this.history = new TreeSet<History>((v1, v2) -> v1.getDate().compareTo(v2.getDate()));
		this.likedVideos = new ArrayList<>();

	}

	public void addVideoInLikedVideos(Video video) {
		this.likedVideos.add(video);
	}

	public void removeVideoFromLikedVideos(Video video) {
		this.likedVideos.remove(video);
	}

	public List<Video> getVideosWhereILike() {
		return Collections.unmodifiableList(this.likedVideos);
	}

	public void addInHistory(History his) {
		this.history.add(his);

	}

	public Set<History> getHistory() {
		return Collections.unmodifiableSet(this.history);
	}

	public void subscribeChannel(Channel channel) {
		this.subscriptions.add(channel);
	}

	public List<Channel> getChannels() {
		return Collections.unmodifiableList(this.subscriptions);
	}

	public String getMyChannel() {
		return myChannel;
	}

	public void cancelSubscribeChannel(Channel channel) {
		this.subscriptions.remove(channel);
	}

	public String getPlayList() {
		return playList;
	}

	public void setPlayList(String playList) {
		this.playList = playList;
	}

	public void setMyChannel(String myChannel) {
		this.myChannel = myChannel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}

	public String getEmail() {
		return email;
	}

	public boolean isValidPassword(String password){
		return this.password.equals(password);
	}

	public static boolean isValidEmail(String enteredEmail) {
		String EMAIL_REGIX = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
				+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		Pattern pattern = Pattern.compile(EMAIL_REGIX);
		Matcher matcher = pattern.matcher(enteredEmail);
		return ((!enteredEmail.isEmpty()) && (enteredEmail != null) && (matcher.matches()));

	}

}
