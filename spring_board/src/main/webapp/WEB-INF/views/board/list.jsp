<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>게시글 목록</title>
<script>
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
        	window.location.href="/board/write.do"
        });
    });
</script>
</head>
<body>
	<h2>게시글 목록</h2>
	<button type="button" id="btnWrite">글쓰기</button>
	<table border="1" width="600px">
	        <tr>
               <th>번호</th>
               <th>제목</th>
               <th>이름</th>
               <th>작성일</th>
               <th>조회수</th>
	        </tr>
	        <c:forEach var="list" items="${requestScope.list}">
               <tr>
	               <td>${list.bno }</td>
	               <td><a href="/board/view.do/${list.bno}">${list.writer }</a></td>
	               <td>${list.title }</td>
	               <td>${list.regdate }</td>
	               <td>${list.viewcnt }</td>
               </tr>
	        </c:forEach>
	</table>
</body>
</html>