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
	var idCheck = true;
	var emailCheck = true;
	var phoneCheck = true;
	
	$(document).ready(function(){
		$("#mem_id").change(function(){
			// 문자 길이 검사
			// 영어, 숫자 외 입력 값 검사 ( 공백 및 특수문자 검사 포함 )
			var id = "#mem_id";
			var msgID = "#memberIdCheckMsg";
			
			lengthCheck(id, 8, 30, msgID);
			englishNumberPatternCheck(id, msgID);
			
			var mem_id = $(id).val();
			if(idCheck == true) {
				$.ajax({
					url : "${root}join/memberIdCount",
					type : "POST",
					dataType : "json",
					data : {
						"mem_id" : mem_id
					},
					success : function(data) {
						if (data == 0 && $.trim(mem_id) != '') {
							var msg = "사용 가능한 ID입니다.";
							trueMsg(msgID, msg);
						} else {
							var msg = "이미 사용중인 ID입니다.";
							falseMsg(msgID, id, msg);
						}
					},
					error : function(data) {
						alert("서버 에러" + data);
					}
				});
			}
		});
		
		$("#mem_pw").change(function(){
			// 문자 길이 검사
			// 영어 숫자 외 입력 값 검사 ( 공백 및 특수문자 검사 포함 )
			var id = "#mem_pw";
			var msgID = "#memberPwCheckMsg";
			
			lengthCheck(id, 8, 30, msgID);
			englishNumberPatternCheck(id, msgID);
		});
		
		$("#pw_check").change(function(){
			// 비밀번호 일치 검사
			var id = "#pw_check";
			var msgID = "#pwChkMsg";
			var mem_pw = $("#mem_pw").val();
			var pw_check = $(id).val();
			
			if(mem_pw != pw_check) {
				var msg = "비밀번호가 일치하지 않습니다.";
				falseMsg(msgID, id, msg);
			} else {
				var msg = "비밀번호 확인 완료";
				trueMsg(msgID, msg);
			}
		});
		
		$("#mem_email").change(function(){
			// 문자 길이 검사
			// 공백 검사
			var id = "#mem_email";
			var msgID = "#memberEmailCheckMsg";
			
			lengthCheck(id, 8, 100, msgID);
			
			var mem_email = $(id).val();
			if(emailCheck == true) {
				$.ajax({
					url : "${root}join/memberEmailCount",
					type : "POST",
					dataType : "json",
					data : {
						"mem_email" : mem_email
					},
					success : function(data) {
						if (data == 0 && $.trim(mem_email) != '') {
							var msg = "사용 가능한 이메일입니다.";
							trueMsg(msgID, msg);
						} else {
							var msg = "이미 사용중인 이메일입니다.";
							falseMsg(msgID, id, msg);
						}
					},
					error : function(data) {
						alert("서버 에러" + data);
					}
				});
			}
		});
		
		$("#mem_phone").change(function(){
			// 문자 길이 검사
			// 숫자 외 입력 값 검사 ( 공백 및 특수문자 검사 포함 )
			var id = "#mem_phone";
			var msgID = "#memberPhoneCheckMsg";
			
			lengthCheck(id, 8, 20, msgID);
			numberPatternCheck(id, msgID);
			
			var mem_phone = $(id).val();
			if(phoneCheck == true) {
				$.ajax({
					url : "${root}join/memberPhoneCount",
					type : "POST",
					dataType : "json",
					data : {
						"mem_phone" : mem_phone
					},
					success : function(data) {
						if (data == 0 && $.trim(mem_phone) != '') {
							var msg = "사용 가능한 번호입니다.";
							trueMsg(msgID, msg);
						} else {
							var msg = "이미 사용중인 번호입니다.";
							falseMsg(msgID, id, msg);
						}
					},
					error : function(data) {
						alert("서버 에러" + data);
					}
				});
			}
		});
		
		$("#mem_name").change(function(){
			// 문자 길이 검사
			// 특수문자 입력 검사
			// 공백 검사
			var id = "#mem_name";
			var msgID = "#memberNameCheckMsg";
			
			lengthCheck(id, 0, 50, msgID);
			spaceCheck(id, msgID);
			specialPatternCheck(id, msgID);
		});
	});
	
	// 문자 공백 검사
	function spaceCheck(id, msgID) {
		var item = $(id).val();
		
		if(item.search(/\s/) != -1) {
			var msg = "공백을 포함할 수 없습니다.";
			falseMsg(msgID, id, msg);
		}
	}
	
	// 문자 길이 검사
	function lengthCheck(id, min, max, msgID) {
		var item = $(id).val();
		var msg = min + "자 ~ " + max + "자 이내로 입력해주세요.";
		
		if(item.length < min || item.length > max) {
			falseMsg(msgID, id, msg);
		} else {
			idCheck = true;
			emailCheck = true;
			phoneCheck = true;
			
			$(msgID).html("");
			$('button#joinBtn').attr("disabled", false);
		}
	}
	
	// 통과 메세지 출력
	function trueMsg(msgID, msg) {
		$(msgID).empty();
		$(msgID).html(msg);
		$(msgID).css('color', 'green');
		$('button#joinBtn').attr("disabled", false);
	}
	
	// 에러 메세지 출력
	function falseMsg(msgID, id, msg) {
		idCheck = false;
		emailCheck = false;
		phoneCheck = false;
		
		$(msgID).empty();
		$(msgID).html(msg);
		$(msgID).css('color', 'red');
		$(id).focus();
		$('button#joinBtn').attr("disabled", true);
	}
	
	// 정규식 : 특수문자 검사
	function specialPatternCheck(id, msgID) {
		var item = $(id).val();
		var reg_special = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		
		if(reg_special.test(item) == true) { 
			var msg = "특수문자는 입력할 수 없습니다.";
			falseMsg(msgID, id, msg);
		}
	}
	
	// 정규식 : 영어, 숫자 검사
	function englishNumberPatternCheck(id, msgID) {
		var item = $(id).val();
		var reg_english_num = /^[a-z|A-Z|0-9|\*]+$/;
		
		if(reg_english_num.test(item) == false) { 
			var msg = "영어와 숫자만 입력할 수 있습니다.";
			falseMsg(msgID, id, msg);
		}
		
		if(/(\w)\1\1\1/.test(item)){
           	msg = "같은 문자를 4번 이상 사용하실 수 없습니다.";
           	falseMsg(msgID, id, msg);
	    }
	}
	
	// 정규식 : 숫자 검사
	function numberPatternCheck(id, msgID) {
		var item = $(id).val();
		var reg_number = /^[0-9|\*]+$/;
		
		if(reg_number.test(item) == false) {
			var msg = "숫자만 입력할 수 있습니다.";
			falseMsg(msgID, id, msg);
		}
	}
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