<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">

<title>회원가입 > 이용 약관 페이지</title>

<style type="text/css">
#agreeTitle {
	font-weight: bold;
}

/* 약관 동의 테이블 기초 설정 */
#agreeTable {
	font-size: 14px;
	margin: 10px;
	margin-left: auto;
	margin-right: auto;
}

/* 약관 전체 동의 메세지 */
#agreeAllMsg {
	color: #121212;
	font-size: 18px;
}

/* 약관 내용 보기 태그 */
.agreeDetail {
	color: #000051;
	font-weight: normal;
}
</style>
</head>
<body>
	<%@include file="../include/title.jsp"%>
	<%@include file="privacyModal.jsp"%>
	<%@include file="tosModal.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {
			// 기초 설정 : 다음 단계 버튼 잠금
			$('button#joinNextBtn').attr("disabled", true);

			// 이용 약관 전체 선택 및 전체 해제
			$("#agreeAllChk").click(function() {
				if ($("#agreeAllChk").prop("checked")) {
					$("input[name=agreeChk]").prop("checked", true);
					$('button#joinNextBtn').attr("disabled", false);
				} else {
					$("input[name=agreeChk]").prop("checked", false);
					$('button#joinNextBtn').attr("disabled", true);
				}
			});
			
			// 이용약관 내용 보기 : 이용약관 모달 실행
			$('#tosDetail').click(function() {
				$('#tosModal').modal("show");
			});

			// 개인정보 처리방침 내용 보기 : 개인정보 처리방침 모달 실행
			$('#privacyDetail').click(function() {
				$('#privacyModal').modal("show");
			});
			
			// 동의하지 않습니다 버튼 클릭
			$("#agreeNotBtn").click(function(){
				alert("약관에 동의하지 않으면 회원 가입을 진행할 수 없습니다.");
			});

			// 다음 단계 버튼 클릭
			$('#joinNextBtn').click(function() {
				var agreeTos = "input:checkbox[id=agreeTos]";
				var agreePrivacy = "input:checkbox[id=agreePrivacy]";
				// 약관 동의를 하지 않은 경우 경고 메시지 출력
				if ($(agreeTos).is(":checked") != true || $(agreePrivacy).is(":checked") != true) {
					$('button#joinNextBtn').attr("disabled", true);
					// 이용약관에 동의하지 않은 경우
					if($(agreeTos).is(":checked") != true) {
						alert("이용약관에 동의해주세요");
					}
					// 개인정보 처리방침에 동의하지 않은 경우
					if($(agreePrivacy).is(":checked") != true) {
						alert("개인정보 처리방침에 동의해주세요");
					}
				} else {
					// 약관 동의를 완료한 경우 다음 가입 절차로 넘어감 (회원 정보 입력)
					location.href = '${root}join/memberInsert';
				}
			});

			// [ 약관 동의 체크 박스 ]
			$('#agreeTos').click(function() {
				agreeChk();
			});

			// [ 개인정보 처리방침 체크 박스 ]
			$('#agreePrivacy').click(function() {
				agreeChk();
			});
		});
		
		// 동의에 체크했을 경우 버튼 잠금 해제
		function agreeChk() {
			if ($("input:checkbox[name=agreeChk]").is(":checked") == true) {
				$('button#joinNextBtn').attr("disabled", false);
			} else {
				$('button#joinNextBtn').attr("disabled", true);
			}
		}
	</script>
	
	<div id="wrap">

		<div class="container">
			<div class="row">
				<div class="col-sm-2"></div>

				<!-- 약관 동의 테이블 START -->
				<div class="col-sm-8">
					<table class="table" id="tosTable">
						<tr id="route">
							<th>
								<a href="${root }index">HOME</a>
								<a>&nbsp;>&nbsp;</a>
								<a>회원가입</a>
								<a>&nbsp;>&nbsp;</a>
								<a>약관 동의</a>
							</th>
						</tr>
						<tr>
							<th>
								<div class="text-center">
									<br>
									<h4 id="agreeTitle">약관 동의</h4>
									<br>
								</div>
							</th>
						</tr>
						<tr>
							<th>
								<!-- 약관 내용 테이블 START -->
								<table class="table table-bordered" id="agreeTable">
									<colgroup>
										<col style="width: 80%">
										<col style="width: 20%">
									</colgroup>
									<tr>
										<td colspan="2">
											<label for="agreeAllChk" style="cursor:pointer">
											<input type="checkbox" id="agreeAllChk" name="agreeAllChk">
											&nbsp;<a id="agreeAllMsg">약관전체 동의</a>
											</label>
										</td>
									</tr>
									<tr>
										<td>
											<label for="agreeTos" style="cursor:pointer">
											<input type="checkbox" id="agreeTos" name="agreeChk"
											value="true">&nbsp;이용약관&nbsp;<a
											id="necessaryTag">(필수)</a>
											</label>
										</td>
										<td>
											<a href="javascript:void(0);" class="agreeDetail"
											id="tosDetail">보기</a>
										</td>
									</tr>
									<tr>
										<td>
											<label for="agreePrivacy" style="cursor:pointer">
											<input type="checkbox" id="agreePrivacy"
											name="agreeChk" value="true">&nbsp;개인정보 처리방침&nbsp;<a
											id="necessaryTag">(필수)</a>
											</label>
										</td>
										<td>
											<a href="javascript:void(0);" class="agreeDetail"
											id="privacyDetail">보기</a>
										</td>
									</tr>
								</table>
								<!-- 약관 내용 테이블 END -->
							</th>
						</tr>
						<tr>
							<td>
								<div class="text-center">
									<button type="submit" class="btn btn-secondary btn-lg"
										id="agreeNotBtn">동의하지 않습니다</button>
									<button type="submit" class="btn btn-secondary btn-lg"
										id="joinNextBtn">동의합니다</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<!-- 약관 동의 테이블 END -->

				<div class="col-sm-2"></div>
			</div>
		</div>
	</div>
</body>
</html>