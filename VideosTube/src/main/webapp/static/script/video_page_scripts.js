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