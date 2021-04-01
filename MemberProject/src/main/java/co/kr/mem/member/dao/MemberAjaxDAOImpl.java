package co.kr.mem.member.dao;

import org.apache.ibatis.session.SqlSession;
import javax.inject.Inject;

import org.springframework.stereotype.Repository;

@Repository
public class MemberAjaxDAOImpl implements MemberAjaxDAO {
	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "co.kr.mem.member.memberAjaxMapper";
}