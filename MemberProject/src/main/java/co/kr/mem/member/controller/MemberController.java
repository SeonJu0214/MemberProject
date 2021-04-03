package co.kr.mem.member.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import co.kr.mem.member.model.MemberDTO;
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
	
	// 회원 가입 > 정보 입력 페이지로 이동
	@GetMapping(value = "/join/memberInsert")
	public String memberInsert(MemberDTO memberDTO) {
		return "join/memberInsert";
	}
	
	// 회원 가입 (회원 정보 입력)
	@PostMapping("/join/memberInsert")
	public String memberInsert(@ModelAttribute("memberDTO") @Valid MemberDTO memberDTO, Errors errors, Model model) {
		// 유효성 체크 ( validation )
		if(errors.hasErrors()) {
			logger.info("회원 가입 실패 (유효성 검사 :: 에러 발생)");
			// 회원가입 실패시, 입력 데이터를 유지
			model.addAttribute("memberDTO", memberDTO);
			
			// 유효성 통과 못한 필드와 메시지를 핸들링
			Map<String, String> validatorResult = memberService.validateHandling(errors);
			for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
			return "join/memberInsert";
		}
		
		logger.info("회원 가입 성공 (회원 정보 DB에 저장 완료)");
		memberService.memberInsert(memberDTO);
		
		return "redirect:/index";
	}
}