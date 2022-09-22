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
    public String getEmail(String id) {
        return memberDao.getEmail(id);
    }

		@Override
		public boolean signup(MemberVO member) {
			// TODO Auto-generated method stub
			return false;
		}
}
