<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://crea0tivecommons.org/licenses/by/3.0/
-->

<!DOCTYPE HTML>
<html>
	<head>
	<c:if test="${sessionScope.user == null}" >
		<c:redirect url="login"/>
	</c:if>
		<title>Videostube Website Template | Home :: W3layouts</title>
	
	<link rel="shortcut icon" type="image/x-icon" href="img/pageicon.png" />
		
<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		
<meta name="keywords" content="legend iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia,
 Samsung, LG, SonyErricsson, Motorola web design" />
		
<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
	
<script type="text/javascript">

function viewEditButton() {
	var a = document.getElementById ('edit-but') ;
	a.style.visibility = 'visible';
}
function hideEditButton() {
	var a = document.getElementById ('edit-but') ;
	a.style.visibility = 'hidden';
}

</script>	
	
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
								<img alt="#" onmouseover="viewEditButton()" onmouseout="hideEditButton()" src="myChannel/${sessionScope.user.getUsername()}" class="twPc-avatarImg">`
								<a href="#">								
									<img src="img/edit-button.png" onmouseover="viewEditButton()"  class="edit-but" id="edit-but"></img>
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

