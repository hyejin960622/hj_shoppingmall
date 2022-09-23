package kr.green.shopping.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.green.shopping.vo.MemberVO;

public interface MemberService {

	public boolean signup(MemberVO member);

	public MemberVO login(MemberVO member);

	public void updateMemberSession(MemberVO user);

	public MemberVO loginBySession(String me_s_id);

	public void logout(HttpServletRequest request, HttpServletResponse response);

	
}
