function checkPass()
{
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('pass');
    var pass2 = document.getElementById('confirm');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field 
    //and the confirmation field	
	
    if(pass1.value == pass2.value){		
        //The passwords match. 
        //Set the color to the good color and inform
        //the user that they have entered the correct password 
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match"
    }else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        pass2.style.backgroundColor = "#ff6666";
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }
} 

// validates text only
function Validate(txt) {
    txt.value = txt.value.replace(/[^a-zA-Z_\n\r.0-9]+/g, '');
}

function CheckLength(){
	var val = document.getElementById('username');
	var statusUsername = document.getElementById('errLast');
	if(val.value.length < 4 || val.value.length > 12){
		val.style.backgroundColor = "#ff6666";
		statusUsername.style.color = "#ff6666";
		statusUsername.innerHTML = "Username shoud be between 4 and 12 symbols."
	}else{
		val.style.backgroundColor = "#ffffff";
		statusUsername.innerHTML = ""
	}

}
// validate email
function email_validate(email)
{
	var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;

    if(regMail.test(email) == false)
    {
    document.getElementById("status").innerHTML    = "<span class='warning' style=color:red;>Email address is not valid yet.</span>";
    }
    else
    {
    document.getElementById("status").innerHTML	= "<span class='valid' style=color:#66cc66;>Thanks, you have entered a valid Email address!</span>";	
    }
}

//validate password length
function PasswordLength(){
	window.alert("Tyk sum. Proverqvam parolata ")
	 var pass = document.getElementById('pass');
	 var msg = document.getElementById('confirmMessage');

	if(pass.value.length < 6 || pass.value.length > 20){
		pass.style.backgroundColor = "#ff6666";
		msg.style.color = "#ff6666";
		msg.innerHTML = "Incorrect Password Length! Should be between 6 and 20 symbols."
	}else{
		pass.style.backgroundColor = "#ffffff";
		msg.innerHTML = "";
	}
}

function dislikeVideo() {
	var user =  document.getElementById('user');
	if(user == null){
		var msg = document.getElementById('confirmMessage');
		 msg.style.color = "#ff6666";
		msg.innerHTML = "Login for vote video";
    }
	else{$.get(
			"video/dislike", 
			{ videoName: document.getElementById("videoName").innerHTML
			},
			
			function(result){
				document.getElementById("likes").innerHTML =result.likes,
				document.getElementById("dislikes").innerHTML = result.dislikes;
		    });}
	
}

function likeVideo() {
	
	var user =  document.getElementById('user');

		if(user== null){
			 var msg = document.getElementById('confirmMessage');
			 msg.style.color = "#ff6666";
			msg.innerHTML = "Login for vote video";
	    }
		else{
			$.get(
					"video/like", 
					{ videoName: document.getElementById("videoName").innerHTML
					},
					
					function(result){
						document.getElementById("likes").innerHTML =result.likes,
						document.getElementById("dislikes").innerHTML = result.dislikes;
				    });
		}
	
	
	
}
