<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>개인정보 처리방침 MODAL</title>
</head>
<body>
	<!-- 개인정보 처리방침 모달 START -->
	<div class="modal fade" id="privacyModal">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
          			<button type="button" class="close" data-dismiss="modal" id="loginModalClose">&times;</button>
        		</div>

				<div class="modal-body">
					<div class="text-center">
						<br>
						<h4 id="title">^_ 개인정보 처리방침 _^</h4>
						<br>
					</div>
					<hr>
					<c:out value="${agree_privacy}" />
					
					<div class="text-center">
						<button class="btn btn-secondary btn-lg">닫기</button>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- 개인정보 처리방침 모달 END -->
</body>
</html>