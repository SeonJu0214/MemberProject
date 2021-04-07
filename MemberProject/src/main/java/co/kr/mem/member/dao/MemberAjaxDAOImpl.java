package co.kr.mem.member.dao;

import org.apache.ibatis.session.SqlSession;
import javax.inject.Inject;

import org.springframework.stereotype.Repository;

@Repository
public class MemberAjaxDAOImpl implements MemberAjaxDAO {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "co.kr.mem.member.memberAjaxMapper";

	// [ 회원 가입 ] 실시간 회원 중복 검사
	
	// ID 중복 검사
	@Override
	public int memberIdCount(String mem_id) {
		return sqlSession.selectOne(NAMESPACE + ".memberIdCount", mem_id);
	}

	// 이메일 중복 검사
	@Override
	public int memberEmailCount(String mem_email) {
		return sqlSession.selectOne(NAMESPACE + ".memberEmailCount", mem_email);
	}

	// 전화번호 중복 검사
	@Override
	public int memberPhoneCount(String mem_phone) {
		return sqlSession.selectOne(NAMESPACE + ".memberPhoneCount", mem_phone);
	}
}