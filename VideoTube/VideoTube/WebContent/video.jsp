<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Video Page</title>
	
		  <link href="http://vjs.zencdn.net/5.11.7/video-js.css" rel="stylesheet">
		  <script src="http://vjs.zencdn.net/5.11.7/video.js"></script>
		  
				<link href="node_modules/video.js/dist/video-js/video-js.css" rel="stylesheet">
				<script src="node_modules/video.js/dist/video-js/video.js"></script>
 				<script src="videojs-java.js"></script>	
 				  <script>
    				videojs.options.java.jar = "WEB-INF/lib/video-js.jar";
  				  </script>	
		
</head>

<body>
	<video id="my-video" class="video-js" controls preload="auto" width="640" height="264"
  			poster="MY_VIDEO_POSTER.jpg" data-setup="{}">
  					    
		    <source src="web/images/tsveta.avi" type='video/avi'>
		    <source src="web/images/abc.mp4" type='video/mp4'>
		    
		    <p class="vjs-no-js">
      		To view this video please enable JavaScript, and consider upgrading to a web browser that
      <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
    </p>
  </video>
	<br>
	
	
  	<video id="video"
         class="video-js vjs-default-skin"
         height="300"
         width="600"
         controls
         data-setup='{"techOrder": ["java"]}'>
	
		    <source src="web/images/tsveta.avi" type='video/avi'>
		    <source src="web/images/abc.mp4" type='video/mp4'>
	</video>


</body>
</html>