package co.kr.mem.member.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import co.kr.mem.member.service.MemberService;

@Controller
public class MemberController {
	@Inject
	MemberService memberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 회원 가입 > 약관 동의 페이지로 이동
	@GetMapping(value = "/join/agreement")
	public String agreement() {
		return "join/agreement";
	}
}