<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="msg" uri="http://www.springframework.org/tags" %>


<!DOCTYPE HTML>
<html>
	<head>
		<title>Videostube Website Template | Home :: W3layouts</title>
	
	<link rel="shortcut icon" type="image/x-icon" href="img/pageicon.png" />
		
<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		
<meta name="keywords" content="legend iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia,
 Samsung, LG, SonyErricsson, Motorola web design" />
		
<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
	
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="css/bootstrap.css">

		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="css/main.css">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

		<title>Admin</title>
	
</head>
	<body>
	<!----start-wrap---->
	<div class="wrap">
		<!----start-Header---->
	
	<div class="header">
			<!----start-Logo---->
			
<div class="logo">
				<a href="index.html"><img src="img/logo.png" title="logo" /></a>
			</div>
			
                
			<!----End-Logo---->
			<!----start-top-nav---->
			<div class="top-nav">
					 <ul>
                	
                    <li><a href="home">Home</a><p>My Forntpage</p></li>
                    
                    <li><a href="categories">Categories</a><p>Be Ur Self</p></li>
                    <li><a href="#">Search</a><p>Search users or videos</p></li>
                </ul>
				</div>
			<div class="clear"> </div>
			<!----End-top-nav---->
		</div>
		<!----End-Header---->
		<div class="clear"> </div>
		
		<div class="clear"> </div>
		</div>
		
			<!---reg Form start --->
				<div class="container">
			<div class="row main">
		
				<div class="main-login main-center">
				
					<sf:form  class="form-horizontal" commandName="user">
						
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Username</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<sf:input type="text" path="username" class="form-control"  id="username" maxlength="16"
									
										onkeyup ="Validate(this)" onblur="CheckLength()" placeholder="Enter your Username" />
								</div>
							</div>
							<div id="errLast"></div>
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<sf:input type="email" path="email" class="form-control"  id="email" maxlength="50"
										onchange="email_validate(this.value);"
										placeholder="Enter your Email"/>
								</div>
							</div>
							<!--  -->
							<div class="status" id="status"></div>
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<sf:input type="password" path="password" class="form-control"   id="pass" 
											minlength="4" maxlength="16"  
											 placeholder="Enter your Password"/>
											
								</div>
							</div>
							
							  
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"
										 minlength="4" maxlength="16" placeholder="Enter again to validate"  
										 id="pass2" onkeyup="checkPass(); return false;"
										 placeholder="Confirm your Password"/>
								</div>
							</div>
							 
						</div>

		
				
							<span id="confirmMessage" class="confirmMessage"></span>
						
						<div class="form-group ">
							<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Register</button>
						</div>
						<div class="login-register">
				            <a  href="login">Login</a>
				         </div>
					</sf:form>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="assets/js/bootstrap.js"></script>
		<script src="script/register_form.js"></script>
			<!--- reg Form end -->
			<div class="clear"> </div>

	</div>
	<!----End-wrap---->
	</body>
</html>

