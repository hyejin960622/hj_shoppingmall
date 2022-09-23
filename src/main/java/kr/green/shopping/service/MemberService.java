package kr.green.shopping.service;

import kr.green.shopping.vo.MemberVO;

public interface MemberService {

	public boolean signup(MemberVO member);

	public MemberVO login(MemberVO member);

	
}
