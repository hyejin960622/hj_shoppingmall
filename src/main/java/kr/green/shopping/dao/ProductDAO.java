package kr.green.shopping.dao;

import java.util.ArrayList;

import kr.green.shopping.vo.CategoryVO;
import kr.green.shopping.vo.ProductVO;

public interface ProductDAO {

	ArrayList<CategoryVO> selectCategoryList();

	void insertCategory(CategoryVO category);

	CategoryVO selectCategoryByCa_code(String substring);

	void updateCategory(CategoryVO category);

	void insertProduct(ProductVO product);



}
