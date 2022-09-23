package kr.green.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
