package sinhanDS.first.project.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import sinhanDS.first.project.product.vo.ProductCategoryVO;

public class CategoryInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, 
							HttpServletResponse response, 
							Object handler)
							throws Exception {
		
		request.setAttribute("ProductCategoryVO", new ProductCategoryVO());
		System.out.println("request.set 설정 완료");
		return true;
	}
}
