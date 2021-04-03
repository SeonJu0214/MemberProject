package co.kr.mem.member.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {
	// member table ( 회원 정보 테이블 )

	// [ 회원 ID ( PK ) ]
	private String mem_id;
	
	// [ 회원 비밀번호 ]
	private String mem_pw;
	
	// [ 회원 이메일 ]
	private String mem_email;
	
	// [ 회원 전화번호 ]
	private String mem_phone;
	
	// [ 회원 이름 ]
	private String mem_name;
	
	// [ 회원 성별 ]
	private String mem_gender;
	
	// [ 회원 생년 월일 ]
	private String mem_birth;
	
	// [ 회원 가입 방식 ]
	private String mem_platform;
	
	// [ 회원 가입 날짜 ]
	private String mem_date;
	
	// [ 회원 삭제 여부 : 0이면 삭제 아님, 1이면 삭제된 회원 ]
	private int mem_del;
	
	// [ 관리자 권한 여부 : 0이면 일반 회원, 1이면 관리자 ]
	private int admin_auth;
}