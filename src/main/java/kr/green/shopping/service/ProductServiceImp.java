package kr.green.shopping.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.shopping.dao.ProductDAO;
import kr.green.shopping.pagination.Criteria;
import kr.green.shopping.utils.UploadFileUtils;
import kr.green.shopping.vo.CartVO;
import kr.green.shopping.vo.CategoryVO;
import kr.green.shopping.vo.MemberVO;
import kr.green.shopping.vo.ProductVO;
import kr.green.shopping.vo.WishVO;

	
	@Service
	public class ProductServiceImp implements ProductService {
		
		@Autowired
		ProductDAO productDao;
		
		String productThumbnailUploadPath = "C:\\git\\product";

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

		@Override
		public void insertProduct(ProductVO product, MultipartFile file) {
			if(product == null || file == null || file.getOriginalFilename().length() == 0)
				return;

			String prefix = product.getPr_ca_name();//COM001
			CategoryVO category = productDao.selectCategoryByCa_code(prefix.substring(0,3));
			try {
				product.setPr_ca_name(category.getCa_name());
				String dir = product.getPr_ca_name();//COM

				String str = UploadFileUtils.uploadFile(productThumbnailUploadPath,File.separator + dir, prefix, file.getOriginalFilename(), file.getBytes());
				product.setPr_thumb("/" +dir+ str);
			} catch (Exception e) {
				e.printStackTrace();
				return;
			}
			productDao.insertProduct(product);
			productDao.updateCategory(category);
		}

		@Override
		public ArrayList<ProductVO> selectProductList(Criteria cri) {
			if(cri == null)
				cri = new Criteria();
			return productDao.selectProductList(cri);
		}

		@Override
		public int getProductTotalCount(Criteria cri) {
			if(cri == null)
				cri = new Criteria();
			return productDao.selectProductTotalCount(cri);
		}

		@Override
		public ProductVO selectProduct(String pr_code) {
			if(pr_code == null || pr_code.length() != 6)
				return null;
			return productDao.selectProduct(pr_code);
		}

		@Override
		public boolean deleteProduct(String pr_code) {
			if(pr_code == null || pr_code.length() != 6)
				return false;
			ProductVO product= productDao.selectProduct(pr_code);
			if(product == null)
				return false;
			UploadFileUtils.deleteFile(productThumbnailUploadPath, product.getPr_thumb());
			return productDao.deleteProduct(pr_code) == 1 ? true : false;
		}

		@Override
		public boolean updateProduct(ProductVO product, MultipartFile file) {
			System.out.println(product);
			if(product == null)
				return false;

			ProductVO dbProduct = productDao.selectProduct(product.getPr_code());
			if(dbProduct == null)
				return false;
			if(file == null || file.getOriginalFilename().length() == 0) {
				product.setPr_thumb(dbProduct.getPr_thumb());
			}else {
				//기존 썸네일 서버에서 삭제
				UploadFileUtils.deleteFile(productThumbnailUploadPath, dbProduct.getPr_thumb());
				//새 썸네일 서버에 업로드 후 vo에 추가
				String prefix = product.getPr_code();
				try {
					String dir = product.getPr_ca_name();//COM
					String str = UploadFileUtils.uploadFile(productThumbnailUploadPath,File.separator + dir, prefix, file.getOriginalFilename(), file.getBytes());
					product.setPr_thumb("/" +dir+ str);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return productDao.updateProduct(product) == 1 ? true : false;
		}

		@Override
		public WishVO getWishlist(String pr_code, MemberVO user) {
			if(pr_code == null || pr_code.length() != 6 || user == null)
				return null;

			return productDao.selectWish(pr_code, user.getMe_id());
		}

		@Override
		public int updateWish(WishVO wishlist) {
			if(wishlist == null || 
					wishlist.getWi_pr_code() == null ||
					wishlist.getWi_pr_code().length() != 6 || 
					wishlist.getWi_me_id() == null)
				return -1;
			WishVO dbWishlist = 
					productDao.selectWish(wishlist.getWi_pr_code(), wishlist.getWi_me_id());
			if(dbWishlist == null) {
				productDao.insertWish(wishlist);
				return 1;
			}
			productDao.deleteWish(wishlist);
			return 0;
		}

		@Override
		public ArrayList<ProductVO> selectProductListByWish(MemberVO user) {
			if(user == null || user.getMe_id() == null)
				return null;
			return productDao.selectProductListByWish(user.getMe_id());
		}

		@Override
		public int putCart(CartVO cart, MemberVO user) {
			if(cart == null || user == null)
				return -1;
			CartVO dbCart = 
					productDao.selectCart(cart.getCa_pr_code(), cart.getCa_me_id());
			if(dbCart == null) {
				productDao.insertCart(cart);
				return 1;
			}
			productDao.deleteCart(cart);
			return 0;
			
		}

		@Override
		public ArrayList<ProductVO> selectProductListByCart(MemberVO user) {
			if(user == null || user.getMe_id() == null)
				return null;
			return productDao.selectProductListByCart(user.getMe_id());
		}

		@Override
		public ArrayList<CartVO> getCartList(MemberVO user) {
			if(user == null || user.getMe_id() == null)
				return null;
			return productDao.selectBasketList(user.getMe_id());
		}

		
}
