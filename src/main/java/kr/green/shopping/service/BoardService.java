package kr.green.shopping.service;

import java.util.ArrayList;

import kr.green.shopping.pagination.Criteria;
import kr.green.shopping.vo.BoardVO;
import kr.green.shopping.vo.MemberVO;

public interface BoardService {

	boolean insertBoard(BoardVO board, MemberVO user, String string);

	ArrayList<BoardVO> getBoardList(Criteria cri, String string);

	int getTotalCount(Criteria cri, String string);

	boolean deleteBoard(Integer bd_num, MemberVO user);

	String getDeleteRedirectURL(String bd_type);

	BoardVO getBoard(Integer bd_num);

	boolean updateBoard(BoardVO board, MemberVO user);



}
