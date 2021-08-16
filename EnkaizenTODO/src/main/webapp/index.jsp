<html>
<head>
<title>Login Page</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
	
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
}

.card {
	width: 50%;
	box-shadow: 3px 5px 10px #000;
	padding: 20px;
	border-radius: 5px;
}
</style>

</head>

<body>

	<center>

		<div class="container">
			<h1>Welcome to the TODO App</h1>
			<br> <br>
			<div class="card">
				<div class="card-body">
					<form action="login" method="post">
						<div class="form-group">
							<label>Select Role:</label> <select class="form-control"
								name="role" required>
								<option value="Admin">Admin</option>
								<option value="User">User</option>
							</select>
						</div>
						<div class="form-group">
							<label for="pwd">Enter Password:</label> <input type="password"
								class="form-control" name="pass" required>
						</div>
						<button type="submit" class="btn btn-primary"><i class="fas fa-sign-in-alt"></i> Login</button>
					</form>
				</div>
			</div>
		</div>

	</center>
</body>
</html>
