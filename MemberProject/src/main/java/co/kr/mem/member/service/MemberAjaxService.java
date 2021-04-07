package co.kr.mem.member.service;

public interface MemberAjaxService {
	// [ 회원 가입 ] 실시간 회원 중복 검사
	
	// ID 중복 검사
	public int memberIdCount(String mem_id);
	
	// 이메일 중복 검사
	public int memberEmailCount(String mem_email);
	
	// 전화번호 중복 검사
	public int memberPhoneCount(String mem_phone);
}