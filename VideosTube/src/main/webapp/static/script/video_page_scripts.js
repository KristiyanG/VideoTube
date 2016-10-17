function subscribe(uploader, user){
	
	if(uploader == user){
		showErrMsg();
		return;
	}
	var user =  document.getElementById('user');
	if(user == null){
		var msg = document.getElementById('confirmM');
		 msg.style.color = "#ff6666";
		msg.innerHTML = "Login for subscribe.";
    }
	else{
		$.post(
			"subscribe", 
			{ channel: uploader
			}).done(
					
			function(data){
				document.getElementById('sub').innerHTML = data;
		    });}
}
function showErrMsg() {
	document.getElementById("subsErrMsg").style.visibility = "visible" ;
    setTimeout(hideErrMsg, 3000);
}
function hideErrMsg(){
	document.getElementById("subsErrMsg").style.visibility = "hidden" ;
	return;
}
function chechPlaylist(size) {
	if(size == 0){
		document.getElementById("popular").style.visibility = "hidden" ;
	}
}

function showLikedVideos() {
	$.get("likeds", {}, function(result){
		document.getElementById("searchResults").innerHTML = result;
		document.getElementById('newVideo').style.display = "none";
    });
}
function showAbonatedChannals() {
	$.get("abonatedChannals", {}, function(result){
		document.getElementById("searchResults").innerHTML = result;
		document.getElementById('newVideo').style.display = "none";
    });
}
function showMyPlaylists() {
	alert("sadasda")
	$.get("myPlaylists", {}, function(result){
		document.getElementById("searchResults").innerHTML = result;
		document.getElementById('newVideo').style.display = "none";
		
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
				document.getElementById('searchResults').innerHTML = result;
				document.getElementById('newVideo').style.display = "none";
		    });
}

