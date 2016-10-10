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
	
	
	
</head>
	<body>
	<!----start-wrap---->
	<div class="wrap">
		<!----start-Header---->
	
			<!----start-Logo---->
			
			<div class="logo">
				<a href="index.html"><img src="img/logo.png" title="logo" /></a>
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
	                    <input type="submit" value="" onmousedown="search()"  onsubmit="handle"/>
	                </form>
	            </div>
	            <div class="clear"> </div>
	        </div>
			<!----start-top-nav---->
			<div class="top-nav" >
				 <ul>
                	
                    <li><a href="home">Home</a><p>My Forntpage</p></li>
                    
                    <li><a href="myChannel">My Channel</a><p>About this blog</p></li>
                    
                    <li><a href="categories">Categories</a><p>Be Ur Self</p></li>
                    
                    <li><a href="likedVideos">Liked Videos</a></li>
                    <li><a href="history">History</a><p>Watched videos</p></li>
                    <li><a href="myPlaylist">My Playlist</a></li>
                    <li><a href="abonatetChannel">Abonated Channel</a></li>
                    <li><a href="#">Search</a><p>Search users or videos</p></li>
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
								<img   src="myChannel/${userChannel.username}" class="twPc-avatarImg">`
								
							</div>

							<div class="twPc-divUser">
								<div class="twPc-divName">
									<a href="#"><c:out value="${userChannel.username}"></c:out></a>
								</div>
							</div>
							<br><br>
							<div class="twPc-divStats">
								<ul class="twPc-Arrange">
									<li class="twPc-ArrangeSizeFit">
										<a href="#">
											<span >Videos</span>
										</a>
									</li>
									<li class="twPc-ArrangeSizeFit">
										<a href="#">
											<span >Playlists</span>
										</a>
									</li>
									
								</ul>
							</div>
						</div>
						<div id="videosList"  class="box">		
					<div class="grids">
                		<div id="videoBox" >
                		
	                	<c:set var="videosList" value="${videos}" />                	
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
										<p>Uploader:<a href="myChannel">${video.uploader}</a></p>
									</div>
								</div>
							</div>
						</c:forEach>
                		</div>
                		
                		</div>
                	</div>
					</div>
					<!-- code end -->
				<!-- Channel end  -->		
	</div>
	<!----End-wrap---->
	</body>
</html>

