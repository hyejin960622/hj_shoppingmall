package kr.green.shopping.service;

import kr.green.shopping.vo.MemberVO;

public interface MemberService {
  public String getEmail(String id);

	public boolean signup(MemberVO member);
}
