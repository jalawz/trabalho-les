<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>Gerenciador de Tarefas | Home</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Task Manager</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-task">Nova Tarefa</a></li>
					<li><a href="all-tasks">Listar Tarefas</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode == 'MODE_HOME' }">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Bem vindo ao Gerenciador de Tarefas</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS' }">
			<div class="container text-center" id="tasksDiv">
				<h3>My Tasks</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th>Id</th>
								<th>Nome</th>
								<th>Descrição</th>
								<th>Data de Criação</th>
								<th>Completa?</th>
								<th></th>
								<th></th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id }</td>
									<td>${task.name }</td>
									<td>${task.description }</td>
									<td><fmt:formatDate pattern="dd/MM/yyyy" value="${task.dateCreated }" /></td>
									<td>${task.finished }</td>
									<td><a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Gerenciar Tarefa</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}" />

					<div class="form-group">
						<label class="control-label col-md-3">Nome</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name"
								value="${task.name}">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Descrição</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="description"
								value="${task.description}">
						</div>
					</div>

					<div class="form-group">
						<label class="control-label col-md-3">Terminada?</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="finished" value="true" />
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished"
								value="false" checked="checked" />
							<div class="col-sm-1">No</div>
						</div>
					</div>

					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Salvar" />
					</div>

				</form>
			</div>
		</c:when>
	</c:choose>






	<script src="static/js/jquery.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>