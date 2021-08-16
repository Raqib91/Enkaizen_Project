<html>
<head>
<title>Todo Creation Page</title>
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

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("roleAdmin") == null) {
		response.sendRedirect("index.jsp");
	}
	%>

	<center>

		<div class="container">
			<h1>Create New Todo</h1>
			<br> <br>
			<div class="card">
				<div class="card-body">
					<form action="createTodo" method="post">
						<div class="form-group">
							<label>Todo Title:</label> <input type="text"
								class="form-control" name="todoTitle" placeholder="Enter todo title here">
						</div>
						<div class="form-group">
							<label>Todo Description:</label> <input type="text"
								class="form-control" name="todoDescription" placeholder="Enter todo description here">
						</div>
						<div class="form-group">
							<label>Select Todo Status:</label> <select class="form-control"
								name="todoStatus">
								<option value="Pending">Pending</option>
								<option value="Done">Done</option>
							</select>
						</div>
						<input type="submit" class="btn btn-primary" value="Create">
					</form>
				</div>
			</div>
		</div>

	</center>
</body>
</html>
