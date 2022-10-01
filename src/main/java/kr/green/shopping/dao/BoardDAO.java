package kr.green.shopping.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.shopping.pagination.Criteria;
import kr.green.shopping.vo.BoardVO;

public interface BoardDAO {

	int insertBoard(BoardVO board);

	ArrayList<BoardVO> selectBoardList(@Param("cri")Criteria cri,  @Param("bd_type")String bd_type);

	int selectBoardTotalCount(@Param("cri")Criteria cri,  @Param("bd_type")String bd_type);

	BoardVO selectBoard(Integer bd_num);

	int deleteBoard(Integer bd_num);

	int updateBoard(BoardVO dbBoard);

}
