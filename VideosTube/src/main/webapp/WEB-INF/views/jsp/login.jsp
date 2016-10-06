<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="msg" uri="http://www.springframework.org/tags" %>
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
	<%
		response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
		response.addHeader("Pragma", "no-cache"); 
		response.addDateHeader ("Expires", 0);
	%>
		<title>Videostube Website Template | Home :: W3layouts</title>
	
	<link rel="shortcut icon" type="image/x-icon" href="img/pageicon.png" />
		
<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		
<meta name="keywords" content="legend iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia,
 Samsung, LG, SonyErricsson, Motorola web design" />
		
<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
	
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="css/main.css">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		<title>Admin</title>
	
	
</head>
	<body>
	<!----start-wrap---->
		<div class="wrap">
		<!----start-Header---->
			<div class="header">
			<!----start-Logo---->
			
				<div class="logo">
					<a href="home"><img src="img/logo.png" title="logo" /></a>
				</div>
				<div class="searchbar">
                    <div class="search-left">
                        <p>Latest Video Form VideosTube</p>
                    </div>
                    <div class="search-right">
                        <form>
                            <input type="text" placeholder="Search videos"><input type="submit" value="" />
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
                    <button type="button" class="login-but"><a href="myChannel"><c:out value="${sessionScope.user.getUsername() }"></c:out></a></button>
                    </c:if>
                    <button type="button" class="upload-but"><a href="upload">Upload</a></button>
                </div>
					<!----End-Logo---->
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
				<div class="clear"> </div>
				<!----End-top-nav---->
			</div>
			</div>
			<!----End-Header---->
			<div class="clear"> </div>
			
			<div class="clear"> </div>
		
			<!---reg Form start --->
			<div class="container">
				
		
					<div class="main-login main-center">
						<form class="form-horizontal" method = "POST"  >
		
							<div class="login-txt" align="center" style="color:#FFFFFF;"> Login <c:out value="${msg}"></c:out></div><br>
					
							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label">Username</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
										<input type="text" class="form-control" name="username" 
											placeholder="Enter your username"/>
									</div>
								</div>
								<div class="status" id="status"></div>
							</div>

							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label">Password</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
										<input type="password" class="form-control" name="password" id="password" minlength="4" maxlength="16"  
												onblur="PasswordLength()" id="pass1" placeholder="Enter your Password"/>
									</div>
								</div>
							</div>

							<span id="confirmMessage" class="confirmMessage"></span>
							
							<div class="form-group ">
								<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Login</button>
							</div>
						</form>
					</div>
				
		
		</div>

			<script type="text/javascript" src="assets/js/bootstrap.js"></script>
			<script src="web/script/register_form.js"></script>
				<!--- reg Form end -->
				<div class="clear"> </div>

	<!----End-wrap---->
	</body>
</html>

