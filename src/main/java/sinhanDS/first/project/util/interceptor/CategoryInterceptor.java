package sinhanDS.first.project.util.interceptor;

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
		return true;
	}
}
