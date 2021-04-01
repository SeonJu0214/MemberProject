package co.kr.mem.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import co.kr.mem.member.dao.MemberAjaxDAO;

@Service
public class MemberAjaxServiceImpl implements MemberAjaxService {
	@Inject
	MemberAjaxDAO memberAjaxDAO;
}