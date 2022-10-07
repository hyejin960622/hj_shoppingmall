package kr.green.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shopping.pagination.Criteria;
import kr.green.shopping.pagination.PageMaker;
import kr.green.shopping.service.ProductService;
import kr.green.shopping.vo.CartVO;
import kr.green.shopping.vo.CategoryVO;
import kr.green.shopping.vo.MemberVO;
import kr.green.shopping.vo.ProductVO;
import kr.green.shopping.vo.WishVO;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(value = "/product/select", method = RequestMethod.GET)
	public ModelAndView productSelect(ModelAndView mv, String pr_code,
			HttpSession session) {
		ProductVO product = productService.selectProduct(pr_code);
		MemberVO user = (MemberVO)session.getAttribute("user");
		WishVO wishlist = productService.getWishlist(pr_code, user);
		mv.addObject("wi", wishlist);
		mv.addObject("p", product);
		mv.setViewName("/product/select");
		return mv;
	}
	
	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public ModelAndView productList(ModelAndView mv, String ca_name) {
		mv.addObject("pr_ca_name", ca_name);
		mv.setViewName("/product/list");
		return mv;
	}
	@RequestMapping(value = "/wish/list", method = RequestMethod.GET)
	public ModelAndView wishList(ModelAndView mv, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		ArrayList<ProductVO> list = productService.selectProductListByWish(user);
		mv.addObject("list", list);
		mv.setViewName("/product/wishList");
		return mv;
	}
	
	@RequestMapping(value="/category/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> categoryList() {
		HashMap<Object,Object> map = new HashMap<Object, Object>();
		ArrayList<CategoryVO> list = productService.getCategoryList();
		map.put("list", list);
		return map;
	}
	@RequestMapping(value="/ajax/product/list", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> ajaxProductList(@RequestBody Criteria cri) {
		HashMap<Object,Object> map = new HashMap<Object, Object>();
		ArrayList<ProductVO> list = productService.selectProductList(cri);
		int totalCount = productService.getProductTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 2, cri);
		map.put("pm", pm);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value="/wishlist", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> wishlist(@RequestBody WishVO wishlist) {
		HashMap<Object,Object> map = new HashMap<Object, Object>();
		int res = productService.updateWish(wishlist);
		map.put("res", res);
		return map;
	}
	
	@RequestMapping(value = "/put/cart", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object, Object> putCart(@RequestBody CartVO cart, HttpSession session) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		MemberVO user = (MemberVO)session.getAttribute("user");
		int res = productService.putCart(cart, user);
		
		map.put("res", res);
		return map;
	}

}
