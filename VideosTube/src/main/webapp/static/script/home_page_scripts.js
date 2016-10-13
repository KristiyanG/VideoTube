//function search() {
//
//if(document.getElementById('commentsDiv').style.display == "block"){
//	document.getElementById('commentsDiv').style.display = "none";
//}else{
//	document.getElementById('commentsDiv').style.display = "block";}
//   
//   var user =  document.getElementById('user');
//	if(user != null){
//		document.getElementById('writeCommentLogin').style.display = "block";
//    }
//}
//
//function writeComment(){
//	var user =  document.getElementById('user');
//	if(user == null){
//		var msg = document.getElementById('confirmMessage');
//		 msg.style.color = "#ff6666";
//		msg.innerHTML = "Login for comment video";
//    }
//}

function showLikedVideos() {
	document.getElementById('videosList').style.display = "none";
	$.get("likeds", {}, function(result){
		document.getElementById("liked-videos-div").innerHTML = result;
    });
}
function showAbonatedChannals() {
	document.getElementById('videosList').style.display = "none";
	$.get("abonatedChannals", {}, function(result){
		document.getElementById("liked-videos-div").innerHTML = result;
    });
}
function showMyPlaylists() {
	document.getElementById('videosList').style.display = "none";
	$.get("myPlaylists", {}, function(result){
		document.getElementById("liked-videos-div").innerHTML = result;
    });
}


function search() {
	var searchField = document.getElementById("search-field").value;
	var searchType = document.getElementById("search-drop-down").value;
	
	$.get(
			"doSearch", 
			{ search: searchField, 
				type: searchType
			},
			function(result){		
				document.getElementById('videosList').innerHTML = result;
		    });
}

