<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="container">
  <h2>게시판 조회</h2>
  	<div class="form-group">
      <label for="bno">번호:</label>
      <input type="text" class="form-control" readonly="readonly"  name="bno" value='<c:out value="${vo.bno}"/>'>
    </div>
    <div class="form-group">
      <label for="title">제목:</label>
      <input type="text" class="form-control" readonly="readonly" id="title"  name="title"/ value='<c:out value="${vo.title}"/>'/>
    </div>
    <div class="form-group">
      <label for="content">내용:</label>
      <textarea rows="10" class="form-control" readonly="readonly" name="content" ><c:out value="${vo.content}"/></textarea>
    </div>
    <div class="form-group">
      <label for="writer">작성자</label>
      <input type="text" class="form-control" readonly="readonly" id="writer" name="writer" value='<c:out value="${vo.writer}"/>'/>
    </div>
    <div class="form-group">
      <label for="bno">등록일:</label>
      <input type="text" class="form-control" readonly="readonly"  name="regdate" value='<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${vo.regdate}"/>' />
    </div>
    <div class="form-group">
      <label for="bno">등록일:</label>
      <input type="text" class="form-control" readonly="readonly"  name="updateDate" value='<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${vo.updateDate}"/>' />
    </div>
    <div style="text-align: center">
		<a class="btn btn-info" id="list_btn">목록 페이지</a> 
		<a class="btn btn-warning" id="modify_btn">수정화면</a>
	</div>
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${vo.bno}"/>'>
	</form>
</div>
<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/modify");
		form.submit();
	});	
</script>
</body>
</html>