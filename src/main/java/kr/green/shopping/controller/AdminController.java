package kr.green.shopping.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shopping.pagination.Criteria;
import kr.green.shopping.pagination.PageMaker;
import kr.green.shopping.service.BoardService;
import kr.green.shopping.service.MessageService;
import kr.green.shopping.service.ProductService;
import kr.green.shopping.vo.BoardVO;
import kr.green.shopping.vo.CategoryVO;
import kr.green.shopping.vo.MemberVO;
import kr.green.shopping.vo.ProductVO;

@Controller
public class AdminController {

	@Autowired
	ProductService productService;
	
	@Autowired
	MessageService messageService;
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("/admin/home");
		return mv;
	}
	@RequestMapping(value = "/admin/category", method = RequestMethod.GET)
	public ModelAndView category(ModelAndView mv) {
		ArrayList<CategoryVO> list = productService.getCategoryList();
		mv.addObject("list",list);
		mv.setViewName("/admin/category");
		return mv;
	}
	@RequestMapping(value = "/admin/category", method = RequestMethod.POST)
	public ModelAndView categoryPost(ModelAndView mv, CategoryVO category,
			HttpServletResponse response) throws IOException {
		int res = productService.insertCategory(category);
		
		messageService.categoryMessage(response, res);
		
		mv.setViewName("redirect:/admin/category");
		return mv;
	}
	@RequestMapping(value = "/admin/product/list", method = RequestMethod.GET)
	public ModelAndView productListGet(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(2);
		ArrayList<ProductVO> list = productService.selectProductList(cri);
		int totalCount = productService.getProductTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
		ArrayList<CategoryVO> categoryList = productService.getCategoryList();
		mv.addObject("cl", categoryList);
		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.setViewName("/admin/productList");
		return mv;
	}
	@RequestMapping(value = "/admin/product/insert", method = RequestMethod.GET)
	public ModelAndView productInsertGet(ModelAndView mv) {
		ArrayList<CategoryVO> cartegoryList = productService.getCategoryList();
		mv.addObject("list", cartegoryList);
		mv.setViewName("/admin/productInsert");
		return mv;
	}
	@RequestMapping(value = "/admin/product/insert", method = RequestMethod.POST)
	public ModelAndView productInsertPost(ModelAndView mv, ProductVO product, MultipartFile file,
			HttpServletResponse response) {
		productService.insertProduct(product, file);
		messageService.message(response, "????????? ??????????????????.", "/shopping/admin/product/list");
		mv.setViewName("redirect:/admin/product/list");
		return mv;
	}
	@RequestMapping(value = "/admin/product/delete", method = RequestMethod.POST)
	public ModelAndView productDeletePost(ModelAndView mv, HttpServletResponse response, String pr_code) {
		boolean res = productService.deleteProduct(pr_code);
		if(res)
			messageService.message(response, "?????????????????????", "/shopping/admin/product/list");
		else
			messageService.message(response, "???????????? ???????????????.", "/shopping/admin/product/list");
		mv.setViewName("redirect:/admin/product/list");
		return mv;
	}
	
	@RequestMapping(value = "/admin/product/update", method = RequestMethod.GET)
	public ModelAndView productUpdateGet(ModelAndView mv, String pr_code) {
		ProductVO product = productService.selectProduct(pr_code);
		mv.addObject("pr", product);
		mv.setViewName("/admin/productUpdate");
		return mv;
	}
	@RequestMapping(value = "/admin/product/update", method = RequestMethod.POST)
	public ModelAndView productUpdatePost(ModelAndView mv, ProductVO product, MultipartFile file
			,HttpServletResponse response) {
		boolean res = productService.updateProduct(product, file);
		if(res) 
			messageService.message(response, "????????????", "/shopping/admin/product/list");
		else
			messageService.message(response, "????????????", "/shopping/admin/product/list");
		mv.setViewName("/admin/productUpdate");
		return mv;
	}
	
	@RequestMapping(value = "/admin/notice/list", method = RequestMethod.GET)
	public ModelAndView noticeList(ModelAndView mv, Criteria cri) {
		cri.setPerPageNum(2);
		ArrayList<BoardVO> list = boardService.getBoardList(cri, "NOTICE");
		int totalCount = boardService.getTotalCount(cri, "NOTICE");
		PageMaker pm = new PageMaker(totalCount, 2, cri);

		mv.addObject("pm", pm);
		mv.addObject("list", list);
		mv.setViewName("/admin/noticeList");
		return mv;
	}
	@RequestMapping(value = "/admin/notice/insert", method = RequestMethod.GET)
	public ModelAndView noticeInsertGet(ModelAndView mv) {

		mv.setViewName("/admin/noticeInsert");
		return mv;
	}
	@RequestMapping(value = "/admin/notice/insert", method = RequestMethod.POST)
	public ModelAndView noticeInsertPost(ModelAndView mv, BoardVO board, 
			HttpServletResponse response, HttpSession session) {
		MemberVO user= (MemberVO)session.getAttribute("user");
		boolean res = boardService.insertBoard(board, user, "NOTICE");
		if(res)
			messageService.message(response, "????????????", "/shopping/admin/notice/list");
		else
			messageService.message(response, "????????????", "/shopping/admin/notice/insert");
		return mv;
	}
	@RequestMapping(value = "/admin/notice/update", method = RequestMethod.GET)
	public ModelAndView noticeUpdateGet(ModelAndView mv, Integer bd_num) {
		BoardVO board = boardService.getBoard(bd_num);
		mv.addObject("bo", board);
		mv.setViewName("/admin/noticeUpdate");
		return mv;
	}
	@RequestMapping(value = "/admin/notice/update", method = RequestMethod.POST)
	public ModelAndView noticeUpdatePost(ModelAndView mv, BoardVO board,
			HttpServletResponse response, HttpSession session) {
		MemberVO user= (MemberVO)session.getAttribute("user");
		boolean res = boardService.updateBoard(board, user);
		if(res)
			messageService.message(response, "????????????", "/shopping/admin/notice/list");
		else
			messageService.message(response, "????????????", "/shopping/admin/notice/list");
		return mv;
	}
	
}