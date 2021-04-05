<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- form 태그 라이브러리 : HTML 폼에 데이터를 바인딩하거나 에러 메시지 처리 등을 간편하게 할 수 있다. -->
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

<script type="text/javascript">
	$("#mem_id").change(function(){
		var mem_id = $("#mem_id").val();
		
		if($("#mem_id").val() != null) {
			
		} else {
			$('#memberIdCheckMsg').empty();
			$('#memberIdCheckMsg').html("값을 입력해주세요.");
			$('#memberIdCheckMsg').css('color', 'red');
			$("#mem_id").focus();
			$('button#joinBtn').attr("disabled", true);
		}
	});
</script>

<%@include file="../include/title.jsp"%>
	<div id="wrap">

		<div class="container">
			<div class="row">
				<div class="col-sm-2"></div>

				<div class="col-sm-8">
				<!-- 회원 정보 입력 START -->
				<form:form action="${root}join/memberInsert" id="memberInsertForm" name="memberInsertForm"
					modelAttribute="memberDTO" method="POST">
					<!-- 사이트 내 회원 가입 플랫폼 이용시  NOMAL 회원으로 가입 -->
					<form:hidden path="mem_platform" value="NOMAL" />
					<table class="table">
						<!-- 테이블의 넓이를 고정시키는 태그 ( 100% ) -->
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
								<!-- path : id, name을 한꺼번에 설정해줌! -->
								<form:input path="mem_id" class="form-control" autocomplete="off"/>
								<div id="memberIdCheckMsg" class="msg">
									<a id="necessaryTag"><form:errors path="mem_id"/></a>
								</div>
							</th>
						</tr>
						<tr>
							<th>비밀번호<a id="necessaryTag"> *</a></th>
							<th>
								<!-- password : 입력한 문자를 ● 요렇게 보이게 해줌 ( 보안 ) -->
								<form:password path="mem_pw" class="form-control" autocomplete="off"/>
								<div id="memberPwCheckMsg" class="msg">
									<a id="necessaryTag"><form:errors path="mem_pw"/></a>
								</div>
							</th>
						</tr>
						<tr>
							<th>비밀번호 확인<a id="necessaryTag"> *</a></th>
							<th>
								<!-- 비밀번호 확인은 DB에 전송할 필요가 없기 때문에 기본 태그를 활용 -->
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
				<!-- 회원 정보 입력 END -->
				</div>

				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
</body>
</html>