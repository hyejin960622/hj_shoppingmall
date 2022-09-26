package kr.green.shopping.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.shopping.dao.ProductDAO;
import kr.green.shopping.vo.CategoryVO;

	
	@Service
	public class ProductServiceImp implements ProductService {
		
		@Autowired
		ProductDAO productDao;

		@Override
		public ArrayList<CategoryVO> getCategoryList() {
			return productDao.selectCategoryList();
		}

		@Override
		public int insertCategory(CategoryVO category) {
			
			if(category == null || 
					category.getCa_name()==null || category.getCa_name().length() == 0 ||
					category.getCa_code() == null || category.getCa_code().length() == 0)
				return -2;
			
			if(category.getCa_code().length() != 3)
				return 1;

			try {
				productDao.insertCategory(category);
				
			}catch(Exception e) {
				return -1;
			}
			
			return 0;
		}

		
}