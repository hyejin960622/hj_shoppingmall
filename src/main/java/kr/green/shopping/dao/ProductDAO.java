package kr.green.shopping.dao;

import java.util.ArrayList;

import kr.green.shopping.vo.CategoryVO;

public interface ProductDAO {

	ArrayList<CategoryVO> selectCategoryList();

	void insertCategory(CategoryVO category);



}
