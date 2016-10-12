function search() {

if(document.getElementById('commentsDiv').style.display == "block"){
	document.getElementById('commentsDiv').style.display = "none";
}else{
	document.getElementById('commentsDiv').style.display = "block";}
   
   var user =  document.getElementById('user');
	if(user != null){
		document.getElementById('writeCommentLogin').style.display = "block";
    }
}

function writeComment(){
	var user =  document.getElementById('user');
	if(user == null){
		var msg = document.getElementById('confirmMessage');
		 msg.style.color = "#ff6666";
		msg.innerHTML = "Login for comment video";
    }
}

function showLikedVideos() {
	document.getElementById('videosList').style.display = "none";
	$.get("likeds", {}, function(result){
		document.getElementById("liked-videos-div").innerHTML = result;
    });
}


