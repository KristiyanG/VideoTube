/**
 * 
 */
	
	function search(event) {
		var searchField = document.getElementById("search-field").value;
		var searchType = document.getElementById("search-drop-down").value;
		if(searchType == "Video"){
			$.get(
					"doSearch", 
					{ search: searchField, 
						type: searchType
					},
					function(result){		

						searchResultVideo(result);
				    });
		}
		if(searchType == "Channel"){
			$.get(
					"searchChannel", 
					{ search: searchField, 
						type: searchType
					},
					function(result){		
						alert("dasdad")	
						searchResultChannel(result);
				    });
		}
	}
	
	function searchResultVideo(result){
		
		$('#videoBox').html('');
		var trHTML = '';
        $.each(result, function (i, item) {
        	trHTML +='<div class="grid">'
        	+'<h3>'+ item.name +'</h3>'	
        	+ '<a href="video?name=' + item.name + '"><img src="img/g1 copy.png" title= "' +item.name+'" /></a>'
        	+'<div class="grid-info">'
			+'<div class="video-share">'
			+'<ul>'
			+'<li><a href="#"><img src="img/likes.png" title="links" /></a></li>'
			+'<li><a href="#"><img src="img/link.png" title="Link" /></a></li>'
			+'<li><a href="#"><img src="img/views.png" title="Views" /></a></li>'
			+'</ul>'
			+'</div>'
			+'<div class="video-watch">'
			+'<a href="single.html">Watch Now</a>'
			+'</div>'
			+'<div class="clear"> </div>'
			+'<div class="lables">'
			+'<p>Labels:<a href="categories.html">' +item.uploader+ '</a></p>'
			+'</div>'
			+'</div>'
        	+ '</div>'

        });
        $('#videoBox').append(trHTML);
	}
	
	function searchResultChannel(result){

		$('#videoBox').empty();

		var trHTML = '';
        $.each(result, function (i, item) {
        	trHTML +='<div class="grid">'
        	+'<h3>'+ item.username +'</h3>'	
        	+ '<a href="video?name=' + item.username + '"><img style="width:234px;height:178px;" src="profilePic/'+ item.profilePic +'" title= "'+ item.username +'" /></a>'
        	+'<div class="grid-info">'
			+'<div class="video-share">'
			+'</div>'
			+'<div class="clear"> </div>'
			+'</div>'
        	+ '</div>'

        });
        $('#videoBox').append(trHTML);
	}
	