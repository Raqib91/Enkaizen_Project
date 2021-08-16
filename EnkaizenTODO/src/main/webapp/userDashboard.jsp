<%@page import="org.springframework.context.support.AbstractApplicationContext"%>
<%@page import="com.raqib91.Entities.TODO"%>
<%@page import="java.util.List"%>
<%@page import="com.raqib91.Dao.TodoDao"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

.head {
	width: 100%;
	height: 50px;
	position: fixed;
	height: 50px;
	box-shadow: 3px 5px 10px #000;
	z-index: 1;
}

.leftside {
	width: 80%;
	height: 100%;
	float: left;
}

.leftside h3 {
	margin: 0px;
	margin-top: 13px;
	margin-left: 20px;
}

.rightside {
	width: 20%;
	height: 100%;
	float: right;
}

.rightside button {
	margin: 0px;
	margin-top: 8px;
	margin-right: 30px;
	float: right;
}

.rightside .btn2 {
	float: right;
}

.content {
	width: 100%;
	height: auto;
	padding-top: 50px;
}

ul
{
	width: 100%;
	list-style: none;
}

li
{
	margin-top: 20px;
	margin-bottom: 20px;
}

.card
{
	width: 50%;
	box-shadow: 3px 5px 10px #000;
}

.card-body
{
/* 	padding: 0; */
/* 	padding-bottom: 10px; */
}

.desc
{
	width: 100%;
/* 	height: 100%; */
/* 	float: left; */
/* 	background-color: yellow; */
	padding: 15px;
	padding-top: 5px;
}

.st
{
	width: 30%;
/* 	height: 100%; */
/* 	float: right; */
 	background-color: cyan;
 	border-radius: 10px;
}

.up
{
/* 	margin-right: 30px; */
}

form
{
	display: inline;
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
	
	ApplicationContext context = new ClassPathXmlApplicationContext("com/raqib91/Dao/ormConfig.xml");
	TodoDao todoDao = context.getBean("todoDao", TodoDao.class);
	List<TODO> todos = todoDao.GetAllTODO();
	
	((AbstractApplicationContext) context).close();
	%>

	<div class="head">
		<div class="leftside">
			<h3><i class="fas fa-user-circle"></i> Hello User!</h3>
		</div>
		<div class="rightside">
			<form action="userLogout">
				<button type="submit" class="btn btn-danger btn2"><i class="fas fa-sign-out-alt"></i> Logout</button>
			</form>
		</div>
	</div>
	
	<div class="content">
			<ul class="allTodos">

			</ul>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>

	<script type="text/javascript">	
		$(function() {
			<%for (TODO t : todos) {%>
			$('.allTodos').append('<li><center><div class="card"><form action="userUpdateTodo.jsp" method="post"><input type="hidden" name="todoId" value="<%= t.getTodoId()%>"><div class="card-header">' + "<%= t.getTodoTitle() %>" + '</div><div class="card-body"><div class="desc">' + "<%= t.getTodoDescription() %>" + '</div><div class="st">Status: ' + "<%= t.getTodoStatus()%>" + '</div></div><div class="card-footer"><button type="submit" class="btn btn-info up"><i class="far fa-edit"></i> Edit</button></form></div></div></center></li>');
			<%}%>
		});
		
	</script>

</body>
</html>