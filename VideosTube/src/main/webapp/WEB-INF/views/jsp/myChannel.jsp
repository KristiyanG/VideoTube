<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>
<head>
	<c:if test="${sessionScope.user == null}" >
		<c:redirect url="login"/>
	</c:if>
		<title>My Channel</title>
	<link rel="shortcut icon" type="image/x-icon" href="img/pageicon.png" />
	<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />		
	<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
	
	<style>
.tooltip {
    position: relative;
    display: inline-block;
    border-bottom: 1px dotted black;
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 120px;
    background-color: black;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;

    /* Position the tooltip */
    position: absolute;
    z-index: 1;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}
</style>
	
</head>
	<body>
	<!----start-wrap---->
	<div class="wrap">
		<!----start-Header---->
		<!----start-Logo---->
			<div class="logo">
				<a href="home"><img src="img/logo.png" title="logo" /></a>
			</div>
			<!----End-Logo---->
	        <div class="searchbar">
	            <div class="search-left">
	            	<p>Search</p>
	                <select class="search-drop-down" id="search-drop-down">
	                	<option>Video</option>
	                	<option>Play List</option>
	                	<option>Channel</option>
	              	 </select>
	            </div>
	            <div class="search-right">
	                <form>
	                    <input type="text" id="search-field" placeholder="Search videos">
	                    <input type="submit" value="" onmousedown="search()" onsubmit="handle"/>
	                </form>
	            </div>
	            <div class="clear"> </div>
	        </div>
			<!----start-top-nav---->
			<div class="top-nav" >
				 <ul>
                    <li><a href="home">Home</a><p>My Forntpage</p></li>
                    <li><a href="myChannel">My Channel</a><p>About this blog</p></li>
                    <li><a href="likedVideos">Liked Videos</a></li>
                    <li><a href="myPlaylist">My Playlist</a></li>
                    <li><a href="abonatetChannel">Abonated Channel</a></li>
                </ul>
			</div>
			<div class="clear"> </div>
			<!----End-top-nav---->
			<!----End-Header---->		
			<div class="buttons">
                 <c:if test="${sessionScope.user == null}" > 
                    <button type="button" class="register-but" ><a href="register" style="color:white;" >Register</a></button>
                    <button type="button" class="login-but"><a href="login">Login</a></button>
                 </c:if>
                 <c:if test="${sessionScope.user != null}">
                    <button type="button" class="register-but" ><a href="login" style="color:white;" >Log out</a></button>
                    <button type="button" class="login-but"><a href="myChannel"><c:out value="${sessionScope.user.getUsername() }"></c:out></a></button>
                 </c:if>
                    <button type="button" class="upload-but"><a href="upload">Upload</a></button>
	        </div> 	<!-- Channel start  -->
					<!-- code start -->
		<div class="twPc-div">
			<a class="twPc-bg twPc-block"></a>		
			<div>
				<div class="twPc-button">
					<!-- Twitter Button | you can get from: https://about.twitter.com/tr/resources/buttons#follow -->
					<a href="#" class="twitter-follow-button" data-show-count="false" data-size="large" data-show-screen-name="false" data-dnt="true">Subscribe</a>
					<!-- Twitter Button -->   
				</div>
	
				<div title="#" href="#" class="twPc-avatarLink">
					<img alt="#" onmouseover="viewEditButton()" onmouseout="hideEditButton()" src="myChannel/${sessionScope.user.getUsername()}" class="twPc-avatarImg">
					<a href="#">								
						<img src="img/edit-button.png" class="edit-but" id="edit-but" 
							onmouseover="viewEditButton()" onmouseout="hideEditButton()" 
							onclick="displayModal()"></img>
					</a>
				</div>
	
				<div class="twPc-divUser">
					<div class="twPc-divName">
						<a href="#"><c:out value="${sessionScope.user.getUsername() }"></c:out></a>
					</div>
				</div>
				<br><br>
				<div class="twPc-divStats">
					<ul class="twPc-Arrange">
						<li class="twPc-ArrangeSizeFit">
							<a href="#">
								<span id="my-videos" onclick="showMyVideos()" class="twPc-StatLabel twPc-block">My videos</span>
							</a>
						</li>
						<li class="twPc-ArrangeSizeFit">
							<a href="#" id="playlist-button" onclick="showPlaylists()">
								<span class="twPc-StatLabel twPc-block">Playlists</span>
							</a>
						</li>
						<li class="twPc-ArrangeSizeFit">
							<a href="#" onclick="swohSubscriptions()">
								<span class="twPc-StatLabel twPc-block">Subscriptions</span>
							</a>
						</li>
						<li class="twPc-ArrangeSizeFit">
							<a href="#">
								<span class="twPc-StatLabel twPc-block">Liked videos</span>
							</a>
						</li>
						<li class="twPc-ArrangeSizeFit">
							<a href="#" onclick="openDialog()">
								<span class="twPc-StatLabel twPc-block">Create Playlist</span>
								  <span class="tooltiptext">Tooltip text</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="my_channel_content" id="my_channel_content">
			<div id="subscriptionsDiv"></div>

				<div class="my-playlists" id="my-playlists" style="display:none;">
	
					<c:set var="playlists" value="${sessionScope.user.getPlayLists()}" />                	
                	<c:forEach items="${playlists}" var="playlist">
						<div class="playlists-frame">
							<a href="video?name=${playlist.name}&username=${sessionScope.user.getUsername()}">								
								<img src="img/play.png" class="video-list-image" id="edit-but"></img>
							</a>
							<h2 class="list-video-title">${playlist.name}</h2>
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
           		<div id="videoBox" style="display:block;" >   
	               	<c:set var="videosList" value="${userVideos}" />                	
	               	<c:forEach items="${videosList}" var="video">
						<div class="grid">
							<h3> ${video.name}</h3>
							<a href="video?name=${video.name}"><img src="img/g1 copy.png" title= "${video.name}" /></a>
							<div class="time">
							<span>Views<c:out value="${ video.view}"/></span>
							</div>
							<div class="grid-info">
								
								<div class="clear"> </div>
								<div class="lables">
									<p>Uploader:<a href="userProfile?name=${video.uploader}">${video.uploader}</a></p>
								</div>
							</div>
						</div>
					</c:forEach>
       			</div>

		</div>
	<!-- code end -->
	<!-- Channel end  -->		
	</div>
	<!----End-wrap---->
	<div id="myModal" class="modal">
	  <!-- Modal content -->
		 <div class="modal-content">
		   <div class="modal-header">
		     <span class="close">x</span>
		     <h2>Choice Picture</h2>
		   </div>
		   <form method="POST" enctype="multipart/form-data">
		    <div class="modal-body">
		      <input type="file" name="userPic" id="js-upload-files" accept="image/jpeg" value="select file">
		      <input type="submit" class="modal-submit" value="Change Picture">
		    </div>
		</form>
		 </div>
	</div>
	<div id="create-playlist-modal" class="create-playlist-modal">
		<div class="playlist-modal-content">
			<div class="playlist-modal-header">
		     	<span class="playlist-dialog-close">x</span>
		     	<h2>PLAYLIST TITLE</h2>
			</div>
			<form action="javascript:createPlaylist()">
				<div class="playlist-modal-body">
					<input type="text" font size="9" maxlength="20"
						class="playlist-modal-input" id="playlist-name"  placeholder="type here">
					<input type="submit" class="playlist-modal-submit" value="Create" ">
			    </div>
			</form>
		</div>
	</div>

<script src="script/my_channel_scripts.js"></script>

	</body>
</html>
