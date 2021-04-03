-- member table ( 회원 정보 테이블 )

CREATE TABLE `member` (
  `mem_id` varchar(30) NOT NULL,			-- 회원 ID ( PK )
  `mem_pw` varchar(200) NOT NULL,			-- 회원 비밀번호
  `mem_email` varchar(100) NOT NULL,		-- 회원 이메일
  `mem_phone` varchar(20) NOT NULL,			-- 회원 전화번호
  `mem_name` varchar(50) DEFAULT NULL,		-- 회원 이름
  `mem_gender` varchar(10) DEFAULT NULL,	-- 회원 성별
  `mem_birth` date DEFAULT NULL,			-- 회원 생년월일
  `mem_platform` varchar(30) NOT NULL,		-- 회원 가입 방식
  `mem_date` datetime NOT NULL,				-- 회원 가입 날짜
  `mem_del` int NOT NULL,					-- 회원 삭제 여부
  `admin_auth` int NOT NULL,				-- 관리자 권한 여부
  PRIMARY KEY (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;