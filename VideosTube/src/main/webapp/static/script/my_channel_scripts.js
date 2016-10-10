

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