<%@page import="org.springframework.context.support.AbstractApplicationContext"%>
<%@page import="com.raqib91.Entities.TODO"%>
<%@page import="java.util.List"%>
<%@page import="com.raqib91.Dao.TodoDao"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<html>
<head>
<title>Todo Update Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

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

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");

	if (session.getAttribute("roleUser") == null) {
		response.sendRedirect("index.jsp");
	}
	
	int id = Integer.parseInt(request.getParameter("todoId"));
	
	ApplicationContext context = new ClassPathXmlApplicationContext("com/raqib91/Dao/ormConfig.xml");
	TodoDao todoDao = context.getBean("todoDao", TodoDao.class);
	TODO t = todoDao.GetSingleTODO(id);
	
	((AbstractApplicationContext) context).close();
	%>

	<center>

		<div class="container">
			<h1>Update Selected Todo</h1>
			<br> <br>
			<div class="card">
				<div class="card-body">
					<form action="userUpdateTodo" method="post">
						<input type="hidden" name="todoId" value="<%= t.getTodoId()%>">
						
						<div class="form-group">
							<label>Enter Todo Title:</label> <input type="text"
								class="form-control" name="todoTitle" value="<%= t.getTodoTitle()%>" readonly>
						</div>
						<div class="form-group">
							<label>Enter Todo Description:</label> <input type="text"
								class="form-control" name="todoDescription" value="<%= t.getTodoDescription()%>" readonly>
						</div>
						
						<div class="form-group">
							<label>Select Todo Status:</label> <select class="form-control"
								name="todoStatus">
								<option value="Pending">Pending</option>
								<option value="Done">Done</option>
							</select>
						</div>
						
						<script type="text/javascript">
							$('[name=todoStatus]').val('<%=t.getTodoStatus()%>');
						</script>
						
						<button type="submit" class="btn btn-primary"><i class="far fa-edit"></i> Update</button>
					</form>
				</div>
			</div>
		</div>

	</center>
</body>
</html>
