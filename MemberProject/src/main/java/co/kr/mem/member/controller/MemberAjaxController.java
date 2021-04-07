package co.kr.mem.member.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.mem.member.service.MemberAjaxService;

@Controller
public class MemberAjaxController {
	@Inject
	MemberAjaxService memberAjaxService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberAjaxController.class);
	
	// [ 회원 가입 ] 실시간 회원 중복 검사
	
	// ID 중복 검사
	@ResponseBody
	@RequestMapping(value = "/join/memberIdCount", method = RequestMethod.POST)
	public String memberIdCount(HttpServletRequest request) {
		String mem_id = request.getParameter("mem_id");
		int result = memberAjaxService.memberIdCount(mem_id);
		
		return Integer.toString(result);
	}
	
	// 이메일 중복 검사
	@ResponseBody
	@RequestMapping(value = "/join/memberEmailCount", method = RequestMethod.POST)
	public String memberEmailCount(HttpServletRequest request) {
		String mem_email = request.getParameter("mem_email");
		int result = memberAjaxService.memberEmailCount(mem_email);
		
		return Integer.toString(result);
	}
	
	// 전화번호 중복 검사
	@ResponseBody
	@RequestMapping(value = "/join/memberPhoneCount", method = RequestMethod.POST)
	public String memberPhoneCount(HttpServletRequest request) {
		String mem_phone = request.getParameter("mem_phone");
		int result = memberAjaxService.memberPhoneCount(mem_phone);
		
		return Integer.toString(result);
	}
}