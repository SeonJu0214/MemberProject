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
						<colgroup>
							<col style="width: 30%">
							<col style="width: 70%">
						</colgroup>
						<tr id="route">
							<th colspan="2">
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
							<th colspan="2">
								<div class="text-center">
									<br>
									<h4>회원 정보 입력</h4>
									<br>
								</div>
							</th>
						</tr>
						<tr>
							<th colspan="2">
								<a id="necessaryTag">필수 입력 *</a>
							</th>
						</tr>
						<tr>
							<th>ID<a id="necessaryTag"> *</a></th>
							<th>
								<form:input path="mem_id" class="form-control" autocomplete="off"/>
								<div id="memberIdCheckMsg" class="msg">
									<a id="necessaryTag"><form:errors path="mem_id"/></a>
								</div>
							</th>
						</tr>
						<tr>
							<th>비밀번호<a id="necessaryTag"> *</a></th>
							<th>
								<form:password path="mem_pw" class="form-control" autocomplete="off"/>
								<div id="memberPwCheckMsg" class="msg">
									<a id="necessaryTag"><form:errors path="mem_pw"/></a>
								</div>
							</th>
						</tr>
						<tr>
							<th>비밀번호 확인<a id="necessaryTag"> *</a></th>
							<th>
								<input type="password" class="form-control" id="pw_check">
								<div id="pwChkMsg" class="msg"></div>
							</th>
						</tr>
						<tr>
							<th>E-MAIL<a id="necessaryTag"> *</a></th>
							<th>
								<form:input path="mem_email" class="form-control" autocomplete="off"/>
								<div id="memberEmailCheckMsg" class="msg">
									<a id="necessaryTag"><form:errors path="mem_email"/></a>
								</div>
							</th>
						</tr>
						<tr>
							<th>전화번호<a id="necessaryTag"> *</a></th>
							<th>
								<form:input path="mem_phone" class="form-control" autocomplete="off"/>
								<div id="memberPhoneCheckMsg" class="msg">
									<a id="necessaryTag"><form:errors path="mem_phone"/></a>
								</div>
							</th>
						</tr>
						<tr>
							<th colspan="2">
								<a id="necessaryTag">( 선택 입력 )</a>
							</th>
						</tr>
						<tr>
							<th>이름</th>
							<th>
								<form:input path="mem_name" class="form-control" autocomplete="off"/>
								<div id="memberNameCheckMsg" class="msg">
									<a id="necessaryTag"><form:errors path="mem_name"/></a>
								</div>
							</th>
						</tr>
						<tr>
							<th>성별</th>
							<th>
								<form:radiobutton path="mem_gender" value="남" label="　남" />
								&nbsp;&nbsp;
								<form:radiobutton path="mem_gender" value="여" label="　여" />
							</th>
						</tr>
						<tr>
							<th>생년월일</th>
							<th><form:input path="mem_birth" type="date" class="form-control"/></th>
						</tr>
					</table>
					<div class="text-center">
						<button type="submit" class="btn btn-secondary btn-lg"
						id="joinBtn">회원 가입</button>
						<button type="reset" class="btn btn-secondary btn-lg"
						id="resetBtn">다시 입력</button>
					</div>
				</form:form>
				</div>

				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
</body>
</html>