package co.kr.mem.member.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import co.kr.mem.member.service.MemberAjaxService;

@Controller
public class MemberAjaxController {
	@Inject
	MemberAjaxService memberAjaxService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberAjaxController.class);
}