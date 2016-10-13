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
	<link href="css/add_playList.css" rel="stylesheet" type="text/css"  media="all" />
	<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
	
    <link href="http://vjs.zencdn.net/5.11.7/video-js.css" rel="stylesheet">
  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="script/register_form.js"></script>

	<script src="script/add_playlist.js"></script>
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
	                <form action="javascript:search()">
	                    <input type="text" id="search-field" placeholder="Search videos">
	                    <input type="submit" value=""/>
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
	                 <c:if test="${sessionScope.user != null}" >
		                 <li><a href="likedVideos">Liked Videos</a></li>
		                 <li><a href="myPlaylist">My Playlist</a></li>
		                 <li><a href="abonatetChannel">Abonated Channel</a></li>
	                 </c:if> 
	             </ul>
			</div>
			<!----End-top-nav---->
		</div>
		<!----End-Header---->
		<div class="content">
            <div class="left-content">            
				<div id="searchResults"></div>
			</div>
			<div class="inner-page" id="inner-page" style="display:block;">
				<c:set var="uploader" scope="page" value="${video.getUploader()}"/>
				<c:set var="description" scope="page" value="${video.getDescription()}"/>
				<div class="title">
					<h3 id="videoName"><c:out value="${video.getName()}"></c:out> </h3>
						<ul>
							<li><h4>By:</h4></li>

							<li><a href="userProfile?name=${uploader}"><div id="up"><c:out value="${uploader}"></c:out></div></a></li>
			
								<c:out value="${sessionScope.user.isSubscribeChannel(uploader)} "></c:out>
								<c:set var="flag" value="${sessionScope.user.isSubscribeChannel(uploader)} "></c:set>		
								<c:choose>
    								<c:when test="${sessionScope.user.isSubscribeChannel(uploader) }">
										<li><img onclick="subscribe()" src="img/sub.png" title="Unsubscribe" /><button onclick="subscribe()" type="button"><div id="sub">Unsubscribe</div></button><a href="login" id="confirmM" class="confirmMessage"> </a></li>
							    	</c:when>
							    	<c:otherwise>
										<li><img  src="img/sub.png" title="subscribe" /><button onclick="subscribe()" type="button"><div id="sub">Subscribe</div></button><a href="login" id="confirmM" class="confirmMessage"> </a></li>
							    		
							    	</c:otherwise>
								</c:choose>
	
							<li></li>
							<li> 
								<div id="list1" class="dropdown-check-list" tabindex="100">
		        					<span class="anchor">Add to playlist</span>
		        					<ul class="items">
			        					<c:if test="${sessionScope.user!=null}">
			        						<c:forEach items="${sessionScope.user.getPlayLists()}" var="list">        
			            						<li><input id="${list.name}" type="checkbox" onchange="addPlaylist(this.id)"/><c:out value="${list.name}"/> </li>
			        						</c:forEach>
			        						<li><a href="login" id="addToList" class="confirmMessage"> </a></li>
			        					</c:if>
		        					</ul>
		    					</div>
	   						</li>
						</ul>
						<c:set var="videoDislikes" scope ="page" value ="${video.getDislikes()}"></c:set>
						<c:set var="views" scope ="page" value ="${video.getView()}"></c:set>
						<c:set var="videoDate" scope ="page" value ="${video.getDate().toString() }"></c:set>
					  	<c:set var="video" scope="page" value="${requestScope.video.getName()}"/>
						<video id="my-video" class="video-js"   controls preload="auto" width="640" height="264" data-setup="{}">
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
							<li><a onclick="showDiv()" >Comment(<c:out value="${ comments.size()}"/>)</a></li>
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
						 
						 <div id="commentsDiv" style="display:none;" class="comments-container">
        <h1>Video comments </h1>

        <ul id="comments-list" class="comments-list">
           
           <li>
                <div id="writeCommentLogin" style="display:none;" class="comment-main-level">
                    <!-- Avatar -->
                    <div class="comment-avatar"><img src="http://i9.photobucket.com/albums/a88/creaticode/avatar_2_zps7de12f8b.jpg" alt=""></div>
                    <!-- Contenedor del Comentario -->
                    <div class="comment-box">
                        <div class="comment-head">
                            <h6 class="comment-name"><a href="http://creaticode.com/blog">You</a></h6>
                        </div>
                       <form action="javascript:writeComment()">
                        <div class="comment-content">
                        <input id="commentText"  type="text" placeholder="Write comment..." maxlength="100"></input><button type="submit"  >Add</button>
                        </div>
                        </form>
                    </div>
                </div>
            </li>
            <li>
            <div id="newComment" style="display:none;" class="comment-main-level">
                    <!-- Avatar -->
                    <div class="comment-avatar"><img src="http://i9.photobucket.com/albums/a88/creaticode/avatar_1_zps8e1c80cd.jpg" alt=""></div>
                    <!-- Contenedor del Comentario -->
                    <div class="comment-box">
                        <div class="comment-head">
                            <h6 id="commentAuthor" class="comment-name by-author"></h6>
                            <span><div id="newCommentDate"></div></span>
                            <i class="fa fa-reply"></i>
                            <i class="fa fa-heart"></i>
                        </div>
                        <div id="commentContent" class="comment-content">
                         
                         </div>
                    </div>
                </div>
            </li>
            
             <c:forEach items="${comments}" var="com">
            <li>
       
                <div  class="comment-main-level">
                    <!-- Avatar -->
                    <div class="comment-avatar"><img src="http://i9.photobucket.com/albums/a88/creaticode/avatar_1_zps8e1c80cd.jpg" alt=""></div>
                    <!-- Contenedor del Comentario -->
                    <div class="comment-box">
                        <div class="comment-head">
                        
                            <h6 class="comment-name by-author"><c:out value="${com.user}"/></h6>
                           
                            <span><c:out value="${com.date}"/></span>
                            <i class="fa fa-reply"></i>
                            <i class="fa fa-heart"></i>
                        </div>
                        <div  class="comment-content">
                         <c:out value="${com.text}"/>
                         </div>
                    </div>
                </div>
            </li>
            </c:forEach>
            
        </ul>
    </div>
	<li> <a href="login" id="confirmMessage" class="confirmMessage"> </a></li>
					</ul>
					
				</div>
				<div class="clear"> </div>
			
				<div class="clear"> </div>
				
				<div class="clear"> </div>
			</div>
		<div class="right-content">
			
			</div>
		</div>
	</div>
	<!----End-wrap---->
<script type="text/javascript">

var checkList = document.getElementById('list1');
checkList.getElementsByClassName('anchor')[0].onclick = function (evt) {
    if (checkList.classList.contains('visible'))
        checkList.classList.remove('visible');
    else{
        checkList.classList.add('visible');
    }
}

</script>
	
</body>
</html>