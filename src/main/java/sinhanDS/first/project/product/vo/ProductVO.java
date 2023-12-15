package sinhanDS.first.project.product.vo;

import lombok.Data;

@Data
public class ProductVO {
	//상품 번호
	private int no;
	//판매자 번호
	private int seller_no;
	//상품 명
	private String name;
	//상품 가격
	private int price;
	//할인 가격
	private int discount;
	//재고
	private int stock;
	//제조사
	private String company;
	//브랜드
	private String brand;
	//평점
	private float rating;
	//이미지url
	private String image_url;
	
	//상품 설명
	private String description;
}
