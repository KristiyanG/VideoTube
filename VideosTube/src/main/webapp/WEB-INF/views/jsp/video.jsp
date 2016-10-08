<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Video Page</title>
		<link rel="shortcut icon" type="image/x-icon" href="img/pageicon.png" />
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
		
	    <link href="http://vjs.zencdn.net/5.11.7/video-js.css" rel="stylesheet">
	  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
	function likeVideo() {
		
		var user =  document.getElementById('user');

			if(user== null){
				 var msg = document.getElementById('confirmMessage');
				 msg.style.color = "#ff6666";
				msg.innerHTML = "Login for vote video";
		    }
			else{
				$.get(
						"video/like", 
						{ videoName: document.getElementById("videoName").innerHTML
						},
						
						function(result){
							document.getElementById("likes").innerHTML =result.likes,
							document.getElementById("dislikes").innerHTML = result.dislikes;
					    });
			}
		
	}
	function dislikeVideo() {
		var user =  document.getElementById('user');
		if(user == null){
			var msg = document.getElementById('confirmMessage');
			 msg.style.color = "#ff6666";
			msg.innerHTML = "Login for vote video";
	    }
		else{$.get(
				"video/dislike", 
				{ videoName: document.getElementById("videoName").innerHTML
				},
				
				function(result){
					document.getElementById("likes").innerHTML =result.likes,
					document.getElementById("dislikes").innerHTML = result.dislikes;
			    });}
		
	}


</script>

</head>

<body>
		
	    <c:set var="videoLikes" scope ="page" value ="${video.getLikes()}"></c:set>
	    <c:set var="videoName" scope="page" value ="${video.getName()}"/>
		
	    <c:set var="username" scope="page" value ="${sessionScope.user.getUsername()}"/>
	    
		<!----start-wrap---->
	<div class="wrap">
		<!----start-Header---->
		<div class="header">
			<!----start-Logo---->
			<div class="logo">
				<a href="index.html"><img src="img/logo.png" title="logo" /></a>
			</div>
			<!----End-Logo---->
				<div class="searchbar">
					<div class="search-left">
						<p>Latest Video Form VideosTube</p>
					</div>
					<div class="search-right">
						<form>
							<input type="text"><input type="submit" value="" />
						</form>
					</div>
					<div class="clear"> </div>
				</div>
				  <div class="buttons">
              	 <c:if test="${sessionScope.user == null}" > 
                 <button type="button" class="register-but" ><a href="register" style="color:white;" >Register</a></button>
                 <button type="button" class="login-but"><a href="login">Login</a></button>
                 </c:if>
                 <c:if test="${sessionScope.user != null}">
                 <button type="button" class="register-but" ><a href="login" style="color:white;" >Log out</a></button>
                 <button type="button" class="login-but"><a href="myChannel"><div id="user"><c:out value="${username}"></c:out></div></a></button>
                 </c:if>
                 <button type="button" class="upload-but"><a href="upload">Upload</a></button>
             </div>
			<!----start-top-nav---->
			<div class="top-nav">
				 <ul>
                    <li><a href="home">Home</a><p>My Forntpage</p></li>
                    <c:if test="${sessionScope.user != null}" >
                    <li><a href="myChannel">My Channel</a><p>About this blog</p></li>
                    </c:if>
                    <li><a href="categories">Categories</a><p>Be Ur Self</p></li>
                    <c:if test="${sessionScope.user != null}" >
                    <li><a href="likedVideos">Liked Videos</a></li>
                    <li><a href="history">History</a><p>Watched videos</p></li>
                    <li><a href="myPlaylist">My Playlist</a></li>
                    <li><a href="abonatetChannel">Abonated Channel</a></li>
                    </c:if> <li><a href="#">Search</a><p>Search users or videos</p></li>
                </ul>
			</div>
			<!----End-top-nav---->
		</div>
		<!----End-Header---->

		<div class="content">
			<div class="inner-page">
				<c:set var="uploader" scope="page" value="${video.getUploader()}"/>
				<c:set var="description" scope="page" value="${video.getDescription()}"/>
				<div class="title">
					<h3 id="videoName"><c:out value="${video.getName()}"></c:out> </h3>
						<ul>
							<li><h4>By:</h4></li>
							<li><a href="myChannel"><c:out value="${uploader}"></c:out></a></li>
							<li><a href="#"><img src="img/sub.png" title="subscribe" />subscribe</a></li>
						</ul>
							
							<c:set var="videoDislikes" scope ="page" value ="${video.getDislikes()}"></c:set>
							<c:set var="views" scope ="page" value ="${video.getView()}"></c:set>
							<c:set var="videoDate" scope ="page" value ="${video.getDate().toString() }"></c:set>
						  	<c:set var="video" scope="page" value="${requestScope.video.getName()}"/>
							<video id="my-video" class="video-js"   controls preload="auto" width="640" height="264"
						  			 data-setup="{}">
							        <source src="video/${video}"  type='video/mp4'>
							<p class="vjs-no-js">
						      		To view this video please enable JavaScript, and consider upgrading to a web browser that
						    </p>
						  </video>

				</div>
				<div class="video-inner">
					
				</div>
				<div class="viwes">
					<div class="view-links">
						<ul>
							<li><h4>Share on:</h4></li>
							<li><button  type="button" onclick="likeVideo()"><img src="img/001.png" title="likes" /><div id="likes"><c:out value="${videoLikes}"/></div></li>
							<li><button type="button" onclick="dislikeVideo()"><img src="img/deslink.png" title="dislikes" /><div id="dislikes"><c:out value="${videoDislikes}"/></div></li>
							<li><a href="#"><img src="img/s1.png" title="Google+" /></a></li>
						</ul>
						<ul class="comment1">
							<li><a href="#">Comment(1)</a></li>
							<li><a href="#"><img src="img/re.png" title="report" /><span>Report</span></a></li>
						</ul>
					</div>
					<div class="views-count">
						<p><span><c:out value="${views }"/> </span> Views</p>
					</div>
					<div class="clear"> </div>
				</div>
				<div class="clear"> </div>
				<div class="video-details">
				
					<ul>
					<li> <a href="login" id="confirmMessage" class="confirmMessage"> </a></li>
						<li><p>Uploaded on <a href="#"><c:out value="${videoDate}"></c:out></a> by <a href="myChannel"><c:out value="uploader"></c:out></a></p></li>
						<li><p>Description for video :</p></li>
						<li><span><c:out value = "${description }"></c:out></span></li>
					</ul>
					
				</div>
				<div class="clear"> </div>
			
				<div class="clear"> </div>
				<div class="related-videos">
					<h6>Related-Videos</h6>
				<div class="grids">
					<div class="grid">
						<h3>Consectetur adipisicing elit</h3>
						<a href="#"><img src="img/g3.jpg" title="video-name"></a>
						<div class="time">
							<span>2:30</span>
						</div>
						<div class="grid-info">
							<div class="video-share">
								<ul>
									<li><a href="#"><img src="img/likes.png" title="links"></a></li>
									<li><a href="#"><img src="img/link.png" title="Link"></a></li>
									<li><a href="#"><img src="img/views.png" title="Views"></a></li>
								</ul>
							</div>
							<div class="video-watch">
								<a href="#">Watch Now</a>
							</div>
							<div class="clear"> </div>
							<div class="lables">
								<p>Labels:<a href="#">Lorem</a></p>
							</div>
						</div>
					</div>
					<div class="grid">
						<h3>Consectetur adipisicing elit</h3>
						<a href="#"><img src="img/g5.jpg" title="video-name"></a>
						<div class="time">
							<span>5:10</span>
						</div>
						<div class="grid-info">
							<div class="video-share">
								<ul>
									<li><a href="#"><img src="img/likes.png" title="links"></a></li>
									<li><a href="#"><img src="img/link.png" title="Link"></a></li>
									<li><a href="#"><img src="img/views.png" title="Views"></a></li>
								</ul>
							</div>
							<div class="video-watch">
								<a href="#">Watch Now</a>
							</div>
							<div class="clear"> </div>
							<div class="lables">
								<p>Labels:<a href="#">Lorem</a></p>
							</div>
						</div>
					</div>
					<div class="grid">
						<h3>Consectetur adipisicing elit</h3>
						<a href="#"><img src="img/g4.jpg" title="video-name"></a>
						<div class="time">
							<span>2:00</span>
						</div>
						<div class="grid-info">
							<div class="video-share">
								<ul>
									<li><a href="#"><img src="img/likes.png" title="links"></a></li>
									<li><a href="#"><img src="img/link.png" title="Link"></a></li>
									<li><a href="#"><img src="img/views.png" title="Views"></a></li>
								</ul>
							</div>
							<div class="video-watch">
								<a href="#">Watch Now</a>
							</div>
							<div class="clear"> </div>
							<div class="lables">
								<p>Labels:<a href="#">Lorem</a></p>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div class="clear"> </div>
			</div>
		<div class="right-content">
			<div class="popular">
				<h3>Popular Videos</h3>
				<p><img src="img/l1.png" title="likes" /> 10,000</p>
				<div class="clear"> </div>
			</div>
				<div class="grid1">
							<h3>Consectetur adipisicing elit</h3>
							<a href="#"><img src="img/g7.jpg" title="video-name" /></a>
							<div class="time1">
								<span>2:50</span>
							</div>
							
					<div class="grid-info">
						<div class="video-share">
							<ul>
								<li><a href="#"><img src="img/likes.png" title="links" /></a></li>
								<li><a href="#"><img src="img/link.png" title="Link" /></a></li>
								<li><a href="#"><img src="img/views.png" title="Views" /></a></li>
							</ul>
						</div>
						<div class="video-watch">
							<a href="#">Watch Now</a>
						</div>
						<div class="clear"> </div>
						<div class="lables">
							<p>Labels:<a href="#">Lorem</a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!----End-wrap---->
</body>
</html> 