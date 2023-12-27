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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
<a href="/board/enroll"><button class="btn btn-default">게시판 등록</button></a>
  <h2>게시판 목록</h2>        
  <table class="table table-hover">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>수정일</th>
        <th>게시물 삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="list">
      <tr>
        <td><c:out value="${list.bno}"/></td>
        <td><a  href='/board/get?bno=<c:out value="${list.bno}"/>'><c:out value="${list.title}"/></a></td>
        <td><c:out value="${list.writer}"/></td>
        <td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${list.regdate}"/></td>
        <td><fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${list.updateDate}"/></td>
        <td><a href="/board/delete?bno=${list.bno}"><button class="btn btn-danger">삭제</button></a></td>
      </tr>   
    </c:forEach>
    </tbody>
  </table>
</div>

<script>
	$(document).ready(function(){
	    
	    let result = "<c:out value='${result}'/>";
	    
	    checkAlert(result);
	    
	    function checkAlert(result){
	        
	        if(result === ''){
	            reutrn;
	        }
	        
	        if(result === "enroll success"){
	            alert("등록이 완료되었습니다.");
	        }
	        
	        if(result === "modify success"){
	            alert("수정이 완료되었습니다.");
	        }
	        
	        if(result === "delete success"){
	            alert("삭제 되었습니다.");
	        }
	    }    
	    
	});
</script>
</body>
</html>