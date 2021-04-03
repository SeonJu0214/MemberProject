<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="utf-8">
<%@include file="../include/head.jsp"%>
<title>회원가입</title>
<style type="text/css">
#joinTable {
	font-size: 14px;
}
</style>
</head>
<body>
<%@include file="../include/title.jsp"%>
	<div id="wrap">

		<div class="container">
			<div class="row">
				<div class="col-sm-2"></div>

				<div class="col-sm-8">
				<form:form action="${root}join/memberInsert" id="memberInsertForm" name="memberInsertForm"
					modelAttribute="memberDTO" method="POST">
					<!-- 사이트 내 회원 가입 플랫폼 이용시  NOMAL 회원으로 가입 -->
					<form:hidden path="mem_platform" value="NOMAL" />
					<table class="table">
						<tr id="route">
							<th>
								<a href="${root }index">HOME</a>
								<a>&nbsp;>&nbsp;</a>
								<a>회원가입</a>
								<a>&nbsp;>&nbsp;</a>
								<a href="${root}join/agreement">약관 동의</a>
								<a>&nbsp;>&nbsp;</a>
								<a>회원 정보 입력</a>
							</th>
						</tr>
						<tr>
							<th>
								<div class="text-center">
									<br>
									<h4>회원 정보 입력</h4>
									<br>
								</div>
							</th>
						</tr>
					</table>
				</form:form>
				</div>

				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
</body>
</html>