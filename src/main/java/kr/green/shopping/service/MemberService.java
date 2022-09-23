package kr.green.shopping.service;

import kr.green.shopping.vo.MemberVO;

public interface MemberService {

	public boolean signup(MemberVO member);

	public MemberVO login(MemberVO member);

	public void updateMemberSession(MemberVO user);

	public MemberVO loginBySession(String me_s_id);

	
}
