window.onload = hideEditButton;

function viewEditButton() {
	var img = document.getElementById ('edit-but') ;
	img.style.visibility = 'visible';
}
function hideEditButton() {
	var img = document.getElementById ('edit-but') ;
	img.style.visibility = 'hidden';
}

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

// Create Playlist Dialog
var playlistSpan = document.getElementsByClassName("playlist-dialog-close")[0];
var playlistModal = document.getElementById('create-playlist-modal');

function openDialog() {

	playlistModal.style.display = "block";
}

playlistSpan.onclick = function() {
	playlistModal.style.display = "none";
}

function createPlaylist() {
	document.getElementById("tooltiptext").style.visibility = "visible" ;

	var playlistName = document.getElementById("playlist-name").value;
	playlistModal.style.display = "none";
	$.post("createPlaylist", {name: playlistName}, function(result){

		if(result.name != null){
			
			document.getElementById("new-playlist").style.display = "block";
			document.getElementById('new-paylist-name').innerHTML = result.name;
			document.getElementById('new-playlist-count').innerHTML = "Videos: " + result.count;
			document.getElementById("tooltiptext").style.visibility = "hidden" ;

		}else{
			document.getElementById("tooltiptext").style.visibility = "visible" ;
		}
    });
	
	document.getElementById("playlist-button").click();
}
function showLikedVideos() {
	hideAll();
	document.getElementById("liked-videos-div").style.display = "block";
	$.get("likeds", {}, function(result){
		document.getElementById("liked-videos-div").innerHTML = result;
    });
}
function showPlaylists() {
	hideAll();
	document.getElementById("my-playlists").style.display = "block";
	$.get("myPlaylists", {}, function(result){
		document.getElementById("my-playlists").innerHTML = result;
    });
}

function showMyVideos() {
	hideAll();
	document.getElementById("videoBox").style.display = "block";
}

function swohSubscriptions() {
	hideAll();
	document.getElementById("subscriptionsDiv").style.display = "block";

	$.get("abonatedChannals", {}, function(result){
		document.getElementById("subscriptionsDiv").innerHTML = result;
    });
}

function hideAll() {
	document.getElementById("subscriptionsDiv").style.display = "none";
	document.getElementById("my-playlists").style.display = "none";
	document.getElementById("videoBox").style.display = "none";
	document.getElementById("liked-videos-div").style.display = "none";
}

function Validate(txt) {
    txt.value = txt.value.replace(/[^a-zA-Z _\n\r.0-9]+/g, '');
}

function showError() {
	document.getElementById("subscribeError").style.visibility = "visible" ;
}
function hideError() {
	document.getElementById("subscribeError").style.visibility = "hidden" ;
}