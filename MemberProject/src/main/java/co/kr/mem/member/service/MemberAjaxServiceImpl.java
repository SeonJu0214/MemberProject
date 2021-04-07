package co.kr.mem.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import co.kr.mem.member.dao.MemberAjaxDAO;

@Service
public class MemberAjaxServiceImpl implements MemberAjaxService {
	@Inject
	MemberAjaxDAO memberAjaxDAO;

	// [ 회원 가입 ] 실시간 회원 중복 검사
	
	// ID 중복 검사
	@Override
	public int memberIdCount(String mem_id) {
		return memberAjaxDAO.memberIdCount(mem_id);
	}

	// 이메일 중복 검사
	@Override
	public int memberEmailCount(String mem_email) {
		return memberAjaxDAO.memberEmailCount(mem_email);
	}

	// 전화번호 중복 검사
	@Override
	public int memberPhoneCount(String mem_phone) {
		return memberAjaxDAO.memberPhoneCount(mem_phone);
	}
}