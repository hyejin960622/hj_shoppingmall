package kr.green.shopping.service;

import javax.servlet.http.HttpServletResponse;

public interface MessageService {

	void categoryMessage(HttpServletResponse response, int res);

	void message(HttpServletResponse response, String content, String redirectUrl);



}
