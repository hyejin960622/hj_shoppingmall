package kr.green.shopping.vo;

import java.text.DecimalFormat;

import lombok.Data;

@Data
public class CartVO {
	
	private int ca_num;
	private String ca_me_id;
	private String ca_pr_code;
	private int ca_count;
	
	private String pr_thumb; //썸네일
	private String pr_code;
	private String pr_name;
	private int pr_price;
	
	public String getPr_thumb_url() {
		return "/product/img" + pr_thumb;
	}
	
	public String getPr_price_str() {
		DecimalFormat format = new DecimalFormat("#,###");
		String str = format.format(pr_price) + "원";
		return str;
	}

}
