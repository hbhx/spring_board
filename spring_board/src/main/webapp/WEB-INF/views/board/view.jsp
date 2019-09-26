<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>게시글 상세보기/수정</title>
<script>
	$(document).ready(function(){
		$("#btnEdit").click(function(){
			$("#form1").submit();
        });
		
		$("#btnDelete").click(function(){
			window.location.href="/board/delete.do?bno=" + ${post.bno};
        });
    });
	
	$(document).ready(function(){
		
    });
</script>
</head>
<body>
	<h2>게시글 상세보기/수정</h2>
	<form id="form1" method="post" action="/board/update.do">
		<input type="hidden" name="bno" value="${post.bno}">
		<input type="hidden" name="viewcnt" value="${post.viewcnt}">
		
		<div>
			제목 <input name="title" id="title" size="80" value="${post.title}">
		</div>
		<div>
			내용
			<textarea name="content" id="content" rows="4" cols="80">${post.content }</textarea>
		</div>
		<div>
			이름 <input name="writer" id="writer" value="${post.writer }">
		</div>
		<div style="width: 650px; text-align: center;">
			<button type="button" id="btnEdit">수정</button>
			<button type="button" id="btnDelete">삭제</button>
		</div>
	</form>
</body>
</html>
