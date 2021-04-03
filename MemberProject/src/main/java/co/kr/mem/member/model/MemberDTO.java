package co.kr.mem.member.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.springframework.validation.annotation.Validated;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
// validation 어노테이션 설정
@Validated
public class MemberDTO {
	// member table ( 회원 정보 테이블 )

	// [ 회원 ID ( PK ) ]
	@NotBlank(message = "값을 입력해주세요.")
	@Length(min = 8, max = 30, message = "8자 ~ 30자 이내로 입력해주세요.")
	private String mem_id;

	// [ 회원 비밀번호 ]
	@NotBlank(message = "값을 입력해주세요.")
	@Length(min = 8, max = 30, message = "8자 ~ 30자 이내로 입력해주세요.")
	@Pattern(regexp = "^(?=.*[0-9])(?=.*[a-zA-Z])[A-Za-z\\d]*$", message = "영어와 숫자만 입력할 수 있습니다.")
	private String mem_pw;

	// [ 회원 이메일 ]
	@NotBlank(message = "값을 입력해주세요.")
	@Email(message = "이메일 형식이 올바르지 않습니다.")
	@Length(min = 8, max = 100, message = "8자 ~ 100자 이내로 입력해주세요.")
	private String mem_email;

	// [ 회원 전화번호 ]
	@NotBlank(message = "값을 입력해주세요.")
	@Length(min = 8, max = 20, message = "8자 ~ 20자 이내로 입력해주세요.")
	@Pattern(regexp = "^[0-9]*$", message="숫자만 입력할 수 있습니다.")
	private String mem_phone;

	// [ 회원 이름 ]
	@Length(min = 0, max = 50, message = "50자 이내로 입력해주세요.")
	private String mem_name;

	// [ 회원 성별 ]
	private String mem_gender;

	// [ 회원 생년 월일 ]
	private String mem_birth;

	// [ 회원 가입 방식 ]
	private String mem_platform;

	// [ 회원 가입 날짜 ]
	private String mem_date;

	// [ 회원 삭제 여부 : 0이면 삭제 아님, 1이면 삭제된 회원 ]
	private int mem_del;

	// [ 관리자 권한 여부 : 0이면 일반 회원, 1이면 관리자 ]
	private int admin_auth;
}