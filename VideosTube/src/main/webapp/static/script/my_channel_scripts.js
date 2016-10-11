

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
	if(document.getElementById("new-playlist").style.display == 'block' ){
		return;
	}
	playlistModal.style.display = "block";
}

playlistSpan.onclick = function() {
	playlistModal.style.display = "none";
}

function createPlaylist() {
	
	var playlistName = document.getElementById("playlist-name").value;
	playlistModal.style.display = "none";
	$.post("createPlaylist", {name: playlistName}, function(result){

		document.getElementById('new-paylist-name').innerHTML = result.name;
		document.getElementById('new-playlist-count').innerHTML = "Videos: " + result.count;
		
		document.getElementById("new-playlist").style.display = "block";

    });
	
	document.getElementById("playlist-button").click();
}


function showPlaylists() {
	document.getElementById("my-playlists").style.display = "block";
	document.getElementById("videoBox").style.display = "none";
}

function showMyVideos() {
	document.getElementById("my-playlists").style.display = "none";
	document.getElementById("videoBox").style.display = "block";
}

