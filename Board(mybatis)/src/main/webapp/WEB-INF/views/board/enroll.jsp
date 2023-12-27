<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<div class="container">
  <h2>게시판 등록</h2>
  <form action="/board/enroll" method="post">
    <div class="form-group">
      <label for="title">제목:</label>
      <input type="text" class="form-control" id="title" placeholder="제목을 작성해주세요." name="title"/>
    </div>
    <div class="form-group">
      <label for="content">내용:</label>
      <textarea rows="10" class="form-control" name="content" placeholder="내용을 입력해주세요"></textarea>
    </div>
    <div class="form-group">
      <label for="writer">작성자</label>
      <input type="text" class="form-control" id="writer" name="writer"/>
    </div>
    <button type="submit" class="btn btn-default btn-lg" >등록</button>
  </form>


</div>
</body>
</html>