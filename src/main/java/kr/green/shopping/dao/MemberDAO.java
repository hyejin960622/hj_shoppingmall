package kr.green.shopping.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.shopping.vo.MemberVO;

public interface MemberDAO {

		public MemberVO selectMember(@Param("me_id")String me_id);

		public void insertMember(@Param("m")MemberVO member);

		public void updateMemberSession(MemberVO user);

		public MemberVO selectBySession(String me_s_id);
}
