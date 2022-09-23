package kr.green.shopping.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import kr.green.shopping.dao.MemberDAO;
import kr.green.shopping.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService {
    @Autowired
    MemberDAO memberDao;

		@Override
		public boolean signup(MemberVO member) {
		//유효성 검사
			if(member == null)
				return false;

			if(member.getMe_id() == null || member.getMe_id().length() == 0)
				return false;

			if(member.getMe_pw() == null || member.getMe_pw().length() == 0)
				return false;

			if(member.getMe_email() == null || member.getMe_email().length() == 0)
				return false;
			
			if(member.getMe_name() == null || member.getMe_name().length() == 0)
				return false;
			
			if(member.getMe_phone() == null || member.getMe_phone().length() == 0)
				return false;
			
			MemberVO dbMember = memberDao.selectMember(member.getMe_id());
			if(dbMember != null)
				return false;
			
			memberDao.insertMember(member);
			return true;
			
		}

		@Override
		public MemberVO login(MemberVO member) {
			if(member == null || member.getMe_id() == null)
				return null;

			MemberVO user = memberDao.selectMember(member.getMe_id());

			if(user == null)
				return null;
			
			user.setAutoLogin(member.isAutoLogin());

			if(user.getMe_pw().equals(member.getMe_pw()))
				return user;

			return null;
		}
		
		@Override
		public void updateMemberSession(MemberVO user) {
			if(user == null || user.getMe_email() == null)
				return;
			memberDao.updateMemberSession(user);
		}

		@Override
		public MemberVO loginBySession(String me_s_id) {
			if(me_s_id == null)
				return null;
			return memberDao.selectBySession(me_s_id);
		}
		@Override
		public void logout(HttpServletRequest request, HttpServletResponse response) {
			if(request == null)
				return;
			HttpSession session = request.getSession();
			MemberVO user = (MemberVO)session.getAttribute("user");
			if(user == null)
				return ;
			session.removeAttribute("user");
			Cookie cookie = WebUtils.getCookie(request, "lgCookie");
			if(cookie == null || response == null)
				return;
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			user.setMe_s_id(null);
			user.setMe_s_limit(null);
			memberDao.updateMemberSession(user);
		}
		
		
}
