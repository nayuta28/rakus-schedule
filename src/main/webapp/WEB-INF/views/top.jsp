<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="Stylesheet" type="text/css" href="css/ui-lightness/jquery-ui.min.css">
<title>RAKUSCHEDULE</title>
<link href="/css/style.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Fredericka+the+Great' rel='stylesheet' type='text/css'>
</head>
<body>
	<header>
	    <h1>RAKUSCHEDULE</h1>
	</header>
	<article>
	<div class="status" id="status0">
		<p class="statusName">Standby</p>
		<p id="btnAddTask">+Add Task</p>
	</div>
	<div class="status" id="status1">
		<p class="statusName">Working</p>
	</div>
	<div class="status" id="status2">
		<p class="statusName">In Review</p>
	</div>
	<div class="status" id="status3">
		<p class="statusName">Done</p>
	</div>
	</article>
	<div id="dialogAddTask" title="+Add Task">
		<div id="dialogContentsLeft">
			<div>Task Name</div>
			<div>Status</div>
			<div>Priority</div>
			<div>Date Start</div>
			<div>Date End</div>
			<div>Descriptions</div>
		</div>
		<div id="dialogContentsRight">
			<form id="formCreateTask" action="javascript:void(0);">
				<div><input type="text" name="taskName"></div>
				<div><input type="hidden" name="status" value="0">Standby</div>
				<div>
					<label><input type="radio" name="priority" value="高" checked="checked">高</label>
					<label><input type="radio" name="priority" value="中">中</label>
					<label><input type="radio" name="priority" value="低">低</label>
					<label><input type="radio" name="priority" value="保留">保留</label>
				</div>
				<div><input type="date" name="anticipatedCommencementDate"></div>
				<div><input type="date" name="expectedCompletionDate"></div>
				<div><textarea>入力してください</textarea></div>
			</form>
		</div>
		<a href="javascript:test(5,1);" id="btnSave">SAVE</a>
	</div><!-- #dialogAddTask -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/viewDialog.js"></script>
<script type="text/javascript">
//全体表示
$(document).ready(function(){
	<c:forEach var="status" items="${allTaskList}">
		<c:forEach var="task" items="${status}">
			var status = '#status' + '${task.taskStatus}';
			var task = status  + ' .task';
			$(status).append('<div class="task"></div>');
			$(task).append('<div class="taskId">' + <c:out value="${task.taskId}"/> + '</div>');
			$(task).append('<div class="taskName"><c:out value="${task.taskName}"/></div>');
			$(task).append('<div class="priority"><c:out value="${task.priority}"/></div>');
			$(task).append('<div class="btnEdit"><img src="img/edit.png"></div>');
			$(task).append('<div class="engineerId"><img src="img/1.png"><p>担当者</p></div>');
			if(status === '#status0'){
				$(task).append('<div class="anticipatedCommencementDate">' + <c:out value="${task.anticipatedCommencementDate}"/> + '</div>');
				$(task).append('<div class="expectedCompletionDate">' + <c:out value="${task.expectedCompletionDate}"/> + '</div>');
			}else if(status === '#status1') {
				$(task).append('<div class="anticipatedCommencementDate">' + <c:out value="${task.anticipatedCommencementDate}"/> + '</div>');
				$(task).append('<div class="expectedCompletionDate">' + <c:out value="${task.expectedCompletionDate}"/> + '</div>');
			}else if(status === '#status2') {
				$(task).append('<div class="anticipatedCommencementDate">' + <c:out value="${task.anticipatedCommencementDate}"/> + '</div>');
				$(task).append('<div class="expectedCompletionDate">' + <c:out value="${task.expectedCompletionDate}"/> + '</div>');
			}else {
				$(task).append('<div class="completionDate">' + <c:out value="${task.completionDate}"/> + '</div>');
			}
		</c:forEach>
	</c:forEach>
	statusHeight();
});
//高さ調節
function statusHeight(){
	var statusHeight = '200px';
	$('.status').each(function(){
		if(this.height > statusHeight) {
			statusHeight = this.height();
		}
	})
	$('.status').css('height', statusHeight);
}
</script>
<script>
function test(id, status){
  $.ajax({
    url: "/?action=create",
    type: "POST",
    data: {
      'id': id,
      'status': status
    }
  }).done(function(data){
    alert('success!');
  }).fail(function(data){
	    alert(data.id);
	    alert('error!');
  })
}
</script>
</body>
</html>

