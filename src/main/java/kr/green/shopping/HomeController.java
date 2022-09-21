package kr.green.shopping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.shopping.service.MemberService;


@Controller
public class HomeController {
	
	@Autowired
  MemberService memberService;
  
  @RequestMapping(value="/")
  public ModelAndView main(ModelAndView mv) throws Exception{
      mv.setViewName("/main/home");
      mv.addObject("setHeader", "타일즈테스트");
      System.out.println(memberService.getEmail("asd"));
      return mv;
  }


	
}
