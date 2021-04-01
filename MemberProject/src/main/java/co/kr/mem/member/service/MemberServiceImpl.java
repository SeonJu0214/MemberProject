package co.kr.mem.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import co.kr.mem.member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO memberDAO;

}