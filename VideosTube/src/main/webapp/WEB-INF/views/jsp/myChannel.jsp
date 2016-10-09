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
	
	<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 40%;
    height: 100px;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {
	padding: 2px 16px;
	vertical-align: middle;	
}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
.modal-submit{
	position: absolute;
	top: 60px;
	left: 10px;
	width: 25%;
	height: 25px;
}
</style>
	
	
	<script type="text/javascript">
	window.onload = hideEditButton;
	
	function viewEditButton() {
		var img = document.getElementById ('edit-but') ;
		img.style.visibility = 'visible';
	}
	function hideEditButton() {
		var img = document.getElementById ('edit-but') ;
		img.style.visibility = 'hidden';
	}
	</script>	
	
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
								<img alt="#" onmouseover="viewEditButton()" onmouseout="hideEditButton()" src="myChannel/${sessionScope.user.getUsername()}" class="twPc-avatarImg">`
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
<script type="text/javascript">
var span = document.getElementsByClassName("close")[0];
var modal = document.getElementById('myModal');

function displayModal() {	
	modal.style.display = "block";
}

span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

</script>
</div>
	</body>
</html>

