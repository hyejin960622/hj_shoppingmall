package kr.green.shopping.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.green.shopping.pagination.Criteria;
import kr.green.shopping.vo.CategoryVO;
import kr.green.shopping.vo.ProductVO;

public interface ProductService {

	ArrayList<CategoryVO> getCategoryList();

	int insertCategory(CategoryVO category);

	void insertProduct(ProductVO product, MultipartFile file);

	ArrayList<ProductVO> selectProductList(Criteria cri);

	int getProductTotalCount(Criteria cri);

	ProductVO selectProduct(String pr_code);

	boolean deleteProduct(String pr_code);

	boolean updateProduct(ProductVO product, MultipartFile file);


}
