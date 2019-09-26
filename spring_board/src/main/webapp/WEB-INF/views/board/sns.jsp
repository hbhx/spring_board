<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Acme|Jua|Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/sns.css" type="text/css" media="screen" />
<title>SNS</title>

</head>
<!-- 윤기가 짜준 코드 -->
<body onload="reload()">
	<!-- Header -->
	<div id="header">
		<h1><a href="https://www.instagram.com/doo_bi_doo_bob/?igshid=ipyjnibmgumw">DooBi DooBab</a></h1>
	</div>
	
	<!-- Input -->
	<div id="input">
		<div id="input_div">
			<form id="input_form" method="post" action="/restboard/insert.do">
				<div id="input_row1">
					<input type="text" name="writer" placeholder="작성자"/>
					<input type="text" name="title" placeholder="어디?">
				</div>
				<div id="input_row2">
					<textarea name="content" placeholder="내용"></textarea>
					<button type="button" id="btn_submit" onclick="submit()">작성</button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- Content -->
	<div id="content">
		<div id="post_div">
			<div id="content_row1">
				<p id="writer">@{writer}</p>
				<a href="/restboard/delete.do?bno={bno}" id="link_delete">[삭제]</a> 
			</div>
			<div id="content_row2">
				<div id="content">{content}</div>
			</div>
			<div id="content_row3">
				<p id="date"># {title}</p>
			</div>
		</div>
	</div>
	
	<div id="postpost" style="display:none">
		
		<div id="post_div" style="">
			<div id="content_row1">
				<p id="writer">@{writer}</p>
				<a href="/restboard/delete.do?bno={bno}" id="link_delete">[삭제]</a> 
			</div>
			<div id="content_row2">
				<div id="content">{content}</div>
			</div>
			<div id="content_row3">
				<p id="date"># {title}</p>
			</div>
		</div>
		
	</div>

	<script>
	//Templating
	function submit(){
		$.ajax({
			url : "http://localhost:8080/restboard/list.do"
			, type : "POST"
			, dataType : "json"
			, data : JSON.stringify(allData)
			, success : function(allData){
				console.log(allData)
			}
			, error : function(xhr, status, error){
				alert(error);
			}
		});
	}
	
	function reload(){
		$.ajax({
			url : "http://localhost:8080/restboard/list.do"
			, type : "GET"
			, success : function(data){
					// Templating
					// var html = document.querySelector("template-list-item").innerHTML;
					var templateHtml = $("#postpost").html();
					var resultHTML = "";
					
					console.log(data);
					
					
					for(var i=0; i<data.length; i++){
						resultHTML += templateHtml.replace("{writer}",data[i].writer)
												  .replace("{bno}",data[i].bno)
												  .replace("{content}",data[i].content)
												  .replace("{title}",data[i].title)
					}
					
					// document.querySelector("#content").innerHTML = resultHTML;
					$("#content").html("");
					$("#content").html(resultHTML);
			}
			, error : function(xhr, status, error){
				alert(error);
			}
		});
	}

	/* 5초마다 JSON 파일을 가져와 Content 재구성 */
	setInterval(function(){
		reload();
	}, 5000);
	
	</script>
</body>
</html>