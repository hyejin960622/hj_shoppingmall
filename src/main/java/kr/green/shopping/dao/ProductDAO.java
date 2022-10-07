package kr.green.shopping.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.green.shopping.pagination.Criteria;
import kr.green.shopping.vo.CartVO;
import kr.green.shopping.vo.CategoryVO;
import kr.green.shopping.vo.ProductVO;
import kr.green.shopping.vo.WishVO;

public interface ProductDAO {

	ArrayList<CategoryVO> selectCategoryList();

	void insertCategory(CategoryVO category);

	CategoryVO selectCategoryByCa_code(String substring);

	void updateCategory(CategoryVO category);

	void insertProduct(ProductVO product);

	ArrayList<ProductVO> selectProductList(Criteria cri);

	int selectProductTotalCount(Criteria cri);

	ProductVO selectProduct(String pr_code);

	int deleteProduct(String pr_code);

	int updateProduct(ProductVO product);

	WishVO selectWish(@Param("pr_code")String pr_code, @Param("me_id")String me_id);

	void insertWish(WishVO wishlist);

	void deleteWish(WishVO wishlist);

	ArrayList<ProductVO> selectProductListByWish(String me_id);

	CartVO selectCart(@Param("pr_code")String ca_pr_code, @Param("me_id")String ca_me_id);

	void insertCart(CartVO cart);

	void deleteCart(CartVO cart);



}
