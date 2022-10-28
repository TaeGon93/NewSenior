package kr.or.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int productNo;
	private int classNo;
	private String productName;
	private int productPrice;
	private String wonPrice;
	private int productStatus;
	private String productCategory;
	private String productSubName;
	private int productQty;
	private String productImgName;
	private String productImgPath;
	private String productContent;
}
