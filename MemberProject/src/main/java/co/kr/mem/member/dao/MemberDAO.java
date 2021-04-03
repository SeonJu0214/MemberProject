package co.kr.mem.member.dao;

import co.kr.mem.member.model.MemberDTO;

public interface MemberDAO {
	// 회원 정보 입력
	public void memberInsert(MemberDTO memberDTO);
}