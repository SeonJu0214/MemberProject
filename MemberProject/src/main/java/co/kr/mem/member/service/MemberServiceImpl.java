package co.kr.mem.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import co.kr.mem.member.dao.MemberDAO;
import co.kr.mem.member.model.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO memberDAO;
	
	// 유효성 체크 ( validation )
    public Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<String, String>();

        for (FieldError error : errors.getFieldErrors()) {
            String validKeyName = String.format("valid_%s", error.getField());
            validatorResult.put(validKeyName, error.getDefaultMessage());
        }
        return validatorResult;
    }

	// 회원 정보 입력
	@Override
	public void memberInsert(MemberDTO memberDTO) {
		memberDAO.memberInsert(memberDTO);
	}
}