package co.kr.mem.member.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import co.kr.mem.member.model.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "co.kr.mem.member.memberMapper";

	// 회원 정보 입력
	@Override
	public void memberInsert(MemberDTO memberDTO) {
		sqlSession.insert(NAMESPACE + ".memberInsert", memberDTO);
	}
}