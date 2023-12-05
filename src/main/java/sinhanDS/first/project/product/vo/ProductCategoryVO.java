package sinhanDS.first.project.product.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ProductCategoryVO {
	private int no;
	private int product_no;
	private int category1;
	private int category2;
	private int[] category1_list;
	private int[] category2_list;
	
	private List<ArrayList<String>> category;
	private List<String> category_name;
	public ProductCategoryVO(){
		category_name = new ArrayList<String>();
		category_name.add("강아지");
		category_name.add("고양이");
		category_name.add("기타");
		
		category = new ArrayList<ArrayList<String>>();
		ArrayList<String> category0 = new ArrayList<>();
		category0.add("사료");
		category0.add("간식");
		category0.add("영양제");
		category0.add("배변용품");
		category0.add("건강/관리용품");
		category0.add("아동/산책용품");
		category0.add("미용/목욕");
		category0.add("식기/급수기");
		category0.add("장난감/훈련");
		category0.add("의류/패션");
		category0.add("기타잡화");
		category.add(category0);
		
		ArrayList<String> category1 = new ArrayList<>();
		category1.add("사료");
		category1.add("간식");
		category1.add("영양제");
		category1.add("배변용품");
		category1.add("건강/관리용품");
		category1.add("캣타워/캣폴");
		category1.add("미용/목욕");
		category1.add("식기/급수기");
		category1.add("장난감/훈련");
		category1.add("의류/패션");
		category1.add("기타잡화");
		category.add(category1);
		
		ArrayList<String> category2 = new ArrayList<>();
		category2.add("조류");
		category2.add("어류");
		category2.add("햄스터");
		category2.add("토끼");
		category2.add("고슴도치");
		category2.add("기타동물");
		category.add(category2);
	}
}

/*
 카테고리1 - 카테고리 2
 
 0 강아지 
 	0 사료
 	1 간식
 	2 영양제
 	3 배변용품
 	4 건강/관리용품
 	5 아동/산책용품
 	6 미용/목욕
 	7 식기/급수기
 	8 장난감/훈련
 	9 의류/패션
 	10 기타 잡화
 1 고양이
 	0 사료
 	1 간식
 	2 영양제
 	3 배변용품
 	4 건강/관리용품
 	5 캣타워/캣폴
 	6 미용/목욕
 	7 식기/급수기
 	8 장난감
 	9 의류/패션
 	10 기타 잡화
 2 기타
 	0 조류
 	1 어류
 	2 햄스터
 	3 토끼
 	4 고슴도치
 	5 기타 동물
 
 
 
 * */