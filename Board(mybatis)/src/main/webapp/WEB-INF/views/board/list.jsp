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
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
목록 페이지
<a href="/board/enroll">게시판 등록</a>
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
	        
	    }    
	    
	});
</script>
</body>
</html>