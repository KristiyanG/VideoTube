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
</head>

<body>

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
					<button type="button" class="register-but"><a style="color:white;" href="registerForm.html">Register</a></button>
					<button type="button" class="login-but"><a href="loginForm.html">Login</a></button>
					<button type="button" class="upload-but"><a href="uploadVideo.html">Upload</a></button>
					
				</div>
			<!----start-top-nav---->
			<div class="top-nav">
				<ul>
					<li><a href="index.html">Home</a><p>My Forntpage</p></li>
					<li><a href="#">About</a><p>About this blog</p></li>
					<li><a href="categories.html">Categories</a><p>Be Ur Self</p></li>
					<li><a href="#">Economics</a><p>Human Needs</p></li>
					<li><a href="#">Health</a><p>Take A Trip</p></li>
					<li><a href="contact.html">Contact</a><p>Leave Messages</p></li>
				</ul>
			</div>
			<!----End-top-nav---->
		</div>
		<!----End-Header---->

		<div class="content">
			<div class="inner-page">

				<div class="title">
					<h3>Video Title </h3>
						<ul>
							<li><h4>By:</h4></li>
							<li><a href="#">Author</a></li>
							<li><a href="#"><img src="img/sub.png" title="subscribe" />subscribe</a></li>
						</ul>
					

						  	<c:set var="video" scope="page" value="${requestScope.video.getName()}"/>
							<video id="my-video" class="video-js"   controls preload="auto" width="640" height="264"
						  			 data-setup="{}">
							        <source src="address/${video}"  type='video/mp4'>
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
							<li><a href="#"><img src="img/f1.png" title="facebook" /></a></li>
							<li><a href="#"><img src="img/t1.png" title="Twitter" /></a></li>
							<li><a href="#"><img src="img/s1.png" title="Google+" /></a></li>
						</ul>
						<ul class="comment1">
							<li><a href="#">Comment(1)</a></li>
							<li><a href="#"><img src="img/re.png" title="report" /><span>Report</span></a></li>
						</ul>
					</div>
					<div class="views-count">
						<p><span>2,500</span> Views</p>
					</div>
					<div class="clear"> </div>
				</div>
				<div class="clear"> </div>
				<div class="video-details">
				
					<ul>
						<li><p>Uploaded on <a href="#">June 21, 2013</a> by <a href="#">Lorem</a></p></li>
						<li><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></li>
					</ul>
					
					
					<ul class="other-links">
						<li><a href="#">youtube.com/videos-tube</a></li>
						<li><a href="#">facebook.com/videos-tube</a></li>
						<li><a href="#">Twitter.com/videos-tube</a></li>
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