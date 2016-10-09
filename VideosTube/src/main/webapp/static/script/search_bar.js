/**
 * 
 */
	
	function search() {
		
		var searchField = document.getElementById("search-field").value;
		var searchType = document.getElementById("search-drop-down").value;
		if(searchType == "Video"){
			$.get(
					"doSearch", 
					{ search: searchField, 
						type: searchType
					},
					function(result){		
						alert("video")
						searchResultVideo(result);
				    });
		}else{
			alert("ELSE")
			$.get(
					"searchChannel", 
					{ search: searchField, 
						type: searchType
					},
					function(result){		
						alert("START FUNCTION")
						alert(resut)
						alert("RESULT HERE")
						searchResultChannel(result);
				    });
		}
	}
	
	function searchResultVideo(result){
		$('#videoBox').empty();

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
		script("VAAAAAAAAAAAA")
		$('#videoBox').empty();
		
		alert(result + " in function")
		var trHTML = '';
        $.each(result, function (i, item) {
        	trHTML +='<div class="grid">'
        	+'<h3>'+ item.name +'</h3>'	
        	+ '<a href="video?name=' + item.name + '"><img src="img/g1 copy.png" title= "' +item.name+'" /></a>'
        	+'<div class="grid-info">'
			+'<div class="video-share">'
			+'</div>'
			+'<div class="clear"> </div>'
			+'</div>'
        	+ '</div>'

        });
        $('#videoBox').append(trHTML);
	}
	