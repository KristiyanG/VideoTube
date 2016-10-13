<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="my-playlists" id="my-playlists">
		<c:set var="playlists" value="${playlists}" />                	
         <c:forEach items="${playlists}" var="playlist">
			<div class="playlists-frame">
				<a href="video?name=${playlist.getFirstVideo()}">								
					<img src="img/play.png" class="video-list-image" id="edit-but"></img>
				</a>
				<h2 class="list-video-title">${playlist.name}</h2>
				<h3 class="list-video-uploader">By: ${playlist.user}</h3>
				<h4 class="list-video-views">Videos: ${playlist.count}</h4>
			</div>
		</c:forEach>
			<div class="playlists-frame" id="new-playlist" style="display:none;">
				<a href="#">								
					<img src="img/play.png" class="video-list-image" id="edit-but"></img>
				</a>
				<h2 class="list-video-title" id="new-paylist-name"></h2>
				<h4 class="list-video-views" id="new-playlist-count"></h4>
			</div>
	</div>
</body>
</html>