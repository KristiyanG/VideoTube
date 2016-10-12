function addPlaylist(listName){
	alert(listName);
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

