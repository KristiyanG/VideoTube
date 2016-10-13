function addPlaylist(listName){
	var user =  document.getElementById('user');
	if(user == null){
		var msg = document.getElementById('confirmM');
		 msg.style.color = "#ff6666";
		msg.innerHTML = "Login for subscribe comment";
    }
	else{
		$.post(
				"addPlaylist", 
				{ playlist: listName,
					videoName: document.getElementById("videoName").innerHTML
				},
				function(result){
					alert(resutl);
					var msg = document.getElementById('addToList');
					 msg.style.color = "#ff6666";
					msg.innerHTML = result;
			    });		
	}		
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
				document.getElementById('inner-page').style.display = "none";
				document.getElementById('searchResults').innerHTML = result;
		    });
}