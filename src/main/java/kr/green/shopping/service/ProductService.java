package kr.green.shopping.service;

import java.util.ArrayList;

import kr.green.shopping.vo.CategoryVO;

public interface ProductService {

	ArrayList<CategoryVO> getCategoryList();

	int insertCategory(CategoryVO category);


}
