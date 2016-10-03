<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>Videostube My Channel</title>
			<link rel="shortcut icon" type="image/x-icon" href="web/images/pageicon.png" />
			<link href="web/css/style.css" rel="stylesheet" type="text/css"  media="all" />
			<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
	</head>
	<body>
	<!----start-wrap---->
	<div class="wrap">
		<!----start-Header---->
	
			<!----start-Logo---->
			
			<div class="logo">
				<a href="index.html"><img src="web/images/logo.png" title="logo" /></a>
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
			<!----start-top-nav---->
			<div class="top-nav" >
				<ul>
					<li><a href="index.html">Home</a><p>My Forntpage</p></li>
					<li><a href="#">About</a><p>About this blog</p></li>
					<li><a href="categories.html">Categories</a><p>Be Ur Self</p></li>
					<li><a href="#">Economics</a><p>Human Needs</p></li>
					<li><a href="#">Health</a><p>Take A Trip</p></li>
					<li><a href="contact.html">Contact</a><p>Leave Messages</p></li>
				</ul>
			</div>
			<div class="clear"> </div>
			<!----End-top-nav---->
		<!----End-Header---->		
		<button type="button" class="reg-butt-channel"><a style="color:white; href="registerForm.html">Register</a></button>
		<button type="button" class="login-but"><a href="loginForm.html">Login</a></button>
			<!-- Channel start  -->
					<!-- code start -->
					<div class="twPc-div">
						<a class="twPc-bg twPc-block"></a>
						
						<div>
							<div class="twPc-button">
								<!-- Twitter Button | you can get from: https://about.twitter.com/tr/resources/buttons#follow -->
								<a href="#" class="twitter-follow-button" data-show-count="false" data-size="large" data-show-screen-name="false" data-dnt="true">Subscribe</a>
								<!-- Twitter Button -->   
							</div>
							<% User user = (User)request.getAttribute("user"); %> 

							<a title="#" href="#" class="twPc-avatarLink">
								<img alt="#" src="<%= user.getProfilePic() %>" class="twPc-avatarImg">
							</a>

							<div class="twPc-divUser">
								<div class="twPc-divName">
									<a href="#"> <%= user.getName() %>	</a>
								</div>
							</div>
							<br><br>
							<div class="twPc-divStats">
								<ul class="twPc-Arrange">
									<li class="twPc-ArrangeSizeFit">
										<a href="#">
											<span class="twPc-StatLabel twPc-block">Home</span>
										</a>
									</li>
									<li class="twPc-ArrangeSizeFit">
										<a href="#">
											<span class="twPc-StatLabel twPc-block">Videos</span>
										</a>
									</li>
									<li class="twPc-ArrangeSizeFit">
										<a href="#">
											<span class="twPc-StatLabel twPc-block">Playlists</span>
										</a>
									</li>
									<li class="twPc-ArrangeSizeFit">
										<a href="#">
											<span class="twPc-StatLabel twPc-block">About</span>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<!-- code end -->
				<!-- Channel end  -->		
	</div>
	<!----End-wrap---->
	</body>
</html>