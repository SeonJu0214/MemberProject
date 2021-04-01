<!-- head.jsp : 공통 링크 코드 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Bootstrap -->
<!-- viewport
	: 화면 상의 화상 표시 영역
	- width : viewport의 크기 조정 
	- device-width : 100% 스케일에서 CSS 픽셀들로 계산된 화면의 폭을 의미 (너비를 장치 너비로 설정)
	- initial-scale : 페이지가 처음 로드될 때 줌 레벨 조정 
	- maximum-scale, minimum-scale, user-scalable : 사용자가 얼마나 페이지를 줌-인, 줌-아웃 할 수 있는지를 조정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<!-- JSTL : JSP 개발을 단순화하기 위한 태그 라이브러리
	- 빠른 개발
	- 코드 재사용성 : 다양한 페이지에서 JSTL 태그 사용 가능
	- 스크립틀릿 태그를 사용할 필요가 없음
	
	선언 방법
	 : taglib uri="URI" prefix="접두사"
	 - uri : 태그 라이브러리의 네임 스페이스 URI 식별자
	 - prefix : JSTL 태그를 사용할 때 태그 이름 앞에 붙일 접두사 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- c:set
	- 변수를 다룰 때 사용한다.
	- var : 변수명
	- value : 값 -->
<!-- ${pageContext.request.contextPath } : javax.servlet.jsp.PageContext 클래스를 상속해 웹 컨테이너가 JSP 실행시 자동으로 생성해서 제공하는 내장 객체이다. -->
<c:set var='root' value="${pageContext.request.contextPath }/" />

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- css link -->
<link rel="stylesheet" href="<spring:url value='/resources/css/layout/commonLayout.css'/>" />
<link rel="stylesheet" href="<spring:url value='/resources/css/font/commonFont.css'/>" />

<!-- Sweet Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<!-- Summer Note 설정 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>

<!-- favicon.ico 404 (Not Found) 오류 메시지 해결 방법
	- favicon : 웹 브라우저의 탭에 나타나는 웹 페이지의 아이콘 -->
<link rel="shortcut icon" href="data:,">