package kr.green.shopping.vo;

import lombok.Data;

@Data
public class ProductVO {
	private String pr_code;
	private String pr_ca_name;
	private String pr_name;
	private String pr_thumb;
	private String pr_content;
	private int pr_price;
	
	public String getPr_thumb_url() {
		return "/product/img" + pr_thumb;
	}
	
}


