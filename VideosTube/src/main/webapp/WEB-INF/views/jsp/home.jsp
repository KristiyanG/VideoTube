<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <title>Video Tube </title>
   
        <link rel="shortcut icon" type="image/x-icon" href=img/pageicon.png" />
        <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
        <link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
   
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
            <!----start-top-nav---->
            <div class="top-nav" >
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
        <!----End-Header---->
        <div class="clear"> </div>
        <div class="content">
            <div class="left-content">
 
                <div class="box">
               
                </div>
                <div class="clear"> </div>
            </div>
            <div class="clear"> </div>
           
            <div class="clear"> </div>
        </div>
   
        
   
    <!----End-wrap---->
    </body>
</html>