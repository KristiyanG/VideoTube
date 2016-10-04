<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Upload Video</title>
	
	<link rel="shortcut icon" type="image/x-icon" href="img/pageicon.png" />
	<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
	<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
	
</head>
<body>
	<!----start-wrap---->
	<div class="wrap">
		<!----start-Logo---->

		<div class="logo">
			<a href="home"><img src="img/logo.png" title="logo" /></a>
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
			<div class="clear"></div>
		</div>
		<div class="buttons">
			<button type="button" class="register-but">
				<a style="color: white;" href="register">Register</a>
			</button>
			<button type="button" class="login-but">
				<a href="login">Login</a>
			</button>
			<button type="button" class="upload-but">
				<a href="upload">Upload</a>
			</button>
		</div>

		<!----start-top-nav---->
		<div class="top-nav">
			<ul>
				<li><a href="home">Home</a>
				<p>My Forntpage</p></li>
				<li><a href="#">About</a>
				<p>About this blog</p></li>
				<li><a href="categories.html">Categories</a>
				<p>Be Ur Self</p></li>
				<li><a href="#">Economics</a>
				<p>Human Needs</p></li>
				<li><a href="#">Health</a>
				<p>Take A Trip</p></li>
				<li><a href="contact.html">Contact</a>
				<p>Leave Messages</p></li>
			</ul>
		</div>
		<div class="clear"></div>
		<!----End-top-nav---->

		<!-- Drop-gown start  -->
		<div class="content">


		<div class="panel panel-default">		 
			<div class="panel-heading">
				<h1>Upload Files</h1>
			</div>
			<div class="panel-body">

				<!-- Standar Form -->
				<h4>Select files from your computer</h4>
				<form id="js-upload-form" enctype="multipart/form-data" method="POST">
					<div class="form-inline">
						<div class="form-group">
							<input type="file" name="video" id="js-upload-files" 
								accept="video/mp4" value="select file">
						</div>
												
						<div class="video-upload-name">
						      <label for="comment" id="video-name-label">Video name:</label>
						      <input class="form-control" rows="5" id="comment" maxlength="30" 
						      		id="videoName" onblur="validateName(this)" name="videoName" placeholder="Type here..."></input>
    					</div>
						
						<div class="video-category-drop">
							<label>Category</label>
							<select name="category">
								<option>Autos and Vehicles</option>
								<option>Comedy</option>
								<option>Education</option>
								<option>Film & Animation</option>
								<option>Gaming</option>
								<option>Howto & Style</option>
								<option>Music</option>
								<option>News & Politics</option>
								<option>Nonprofits & Activism</option>
								<option>People & Blogs</option>
								<option>Pets & Animals</option>
								<option>Science & Technology</option>
								<option>Sports</option>
								<option>Travel & Events</option>
							</select>
						</div><br>
						<div class="video-upload-description">
						      <label for="comment">Description:</label>
						      <textarea class="form-control" rows="5" id="comment" name="description" maxlength="255" placeholder="Type here..."></textarea>
    					</div>						
						
						<button type="submit" name="submit" class="btn btn-sm btn-primary"							
							id="js-upload-submit">Upload files</button>
					</div>
				</form>
				<br>
				<h1 style="color:red;">${status}</h1>
				
				
				<!-- Drop Zone
				<h4>Or drag and drop files below</h4>
				<div class="upload-drop-zone" id="drop-zone">Just drag and
					drop files here</div>

				<!-- Progress Bar 
				<div class="progress">
					<div class="progress-bar" id="progress-bar" role="progressbar"
						aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
						style="width: 60%;">
						<span class="sr-only"></span>
					</div>

					<div class="progress-bar" id="progress-bar-butt" role="progressbar"
						aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
						style="width: 60%;">
						<span class="sr-only"></span>
					</div>
				</div>
				-->
				
			</div>
		</div>
		</div>
		<!-- Drop-gown end  -->
	</div>
	<!----End-wrap---->
	<script>
		function validateName(input){

			var regex = new RegExp("[^a-zA-Z_\n\r.0-9]+");
			var status = document.getElementById("video-name-label")
			
			if(regex.test(input.value)){
				input.style.backgroundColor = "#ff6666";
				status.innerText = " Invalid video name";
				status.style.color = "#ff6666";
				
			}else{
				input.style.backgroundColor = "#66cc66";
				status.innerText = "Video name";
				status.style.color = "black";
			}
		}
	
		window.onload = function() {
			var dropbox = document.getElementById("drop-zone");
			dropbox.addEventListener("dragenter", noop, false);
			dropbox.addEventListener("dragexit", noop, false);
			dropbox.addEventListener("dragover", noop, false);
			dropbox.addEventListener("drop", dropUpload, false);
		}

		function noop(event) {
			event.stopPropagation();
			event.preventDefault();
		}

		function dropUpload(event) {
			noop(event);
			var files = event.dataTransfer.files;

			for (var i = 0; i < files.length; i++) {
				upload(files[i]);
			}
		}

		function upload(file) {
			//document.getElementById("status").innerHTML = "Uploading " + file.name;
			var formData = new FormData();
			formData.append("video", file);

			var xhr = new XMLHttpRequest();
			xhr.upload.addEventListener("progress", uploadProgress, false);
			xhr.addEventListener("load", uploadComplete, false);
			xhr.open("POST", "UploadVideoServlet", true); // If async=false, then you'll miss progress bar support.
			xhr.send(formData);
		}

		function uploadProgress(event) {
			// Note: doesn't work with async=false.
			var progress = Math.round(event.loaded / event.total * 100);
			document.getElementById("progress-bar").innerHTML = "Progress "
					+ progress + "%";
		}

		function uploadComplete(event) {
			document.getElementById("progress-bar").innerHTML = event.target.responseText;
		}

		function uploadByButton(file) {
			var formData = new FormData();
			formData.append("video", file);

			var xhr = new XMLHttpRequest();
			xhr.open("POST", "UploadVideoServlet", true); // If async=false, then you'll miss progress bar support.
			xhr.send(formData);
			document.getElementById("progress-bar-butt").innerHTML = "Complate"
		}
	</script>
</body>
</html>