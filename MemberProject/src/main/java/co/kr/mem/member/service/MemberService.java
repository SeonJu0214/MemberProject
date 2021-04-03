package co.kr.mem.member.service;

import java.util.Map;

import org.springframework.validation.Errors;

import co.kr.mem.member.model.MemberDTO;

public interface MemberService {
	// 유효성 체크 ( validation )
	public Map<String, String> validateHandling(Errors errors);
	
	// 회원 정보 입력
	public void memberInsert(MemberDTO memberDTO);
}