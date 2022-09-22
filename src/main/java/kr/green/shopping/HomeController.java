package kr.green.shopping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shopping.service.MemberService;
import kr.green.shopping.vo.MemberVO;


@Controller
public class HomeController {
	
	@Autowired
  MemberService memberService;
  
	@RequestMapping(value= "/", method=RequestMethod.GET)
	public ModelAndView home(ModelAndView mv){
	    mv.setViewName("/main/home"); 
	    return mv;
}
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv) {
		mv.setViewName("/main/signup");
		return mv;
}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
  public ModelAndView signupPost(ModelAndView mv, MemberVO member){
  		if(memberService.signup(member)) {
  			mv.setViewName("redirect:/");  
  		}else {
  			mv.setViewName("redirect:/signup");  
  		}
      return mv;
  }


	
}
