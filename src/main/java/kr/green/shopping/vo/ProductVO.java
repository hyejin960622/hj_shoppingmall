package kr.green.shopping.vo;

import java.text.DecimalFormat;

import lombok.Data;

@Data
public class ProductVO {
	private String pr_code;
	private String pr_ca_name;
	private String pr_name;
	private String pr_thumb;
	private String pr_content;
	private int pr_price;
	private int pr_count;
	
	public String getPr_thumb_url() {
		return "/product/img" + pr_thumb;
	}
	public String getPr_price_str() {
		if(pr_price == 0)
			return "";
		DecimalFormat format = new DecimalFormat("#,###");
		return format.format(pr_price) + "원";
	}
	
}


