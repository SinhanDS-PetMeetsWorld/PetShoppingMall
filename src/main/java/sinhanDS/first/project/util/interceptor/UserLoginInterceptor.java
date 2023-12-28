package sinhanDS.first.project.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import sinhanDS.first.project.user.vo.UserVO;

public class UserLoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, 
							HttpServletResponse response, 
							Object handler) throws Exception {
		HttpSession sess = request.getSession();
		UserVO login = (UserVO)sess.getAttribute("userLoginInfo");
		
		String url = ("" + request.getRequestURL());
		
		if (login == null) {
		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			if (url.contains("qnawrite.do")) {
				//자식 창 닫기
				out.print("<script>");
				out.print("alert('로그인 후 사용가능합니다.');");
				
				//부모창이 이동해야되는데???
				out.print("opener.parent.location.href='/user/login.do';");
				out.print("window.close();");
				out.print("</script>");
				
				return false;
				
				}
				
			
			out.print("<script>");
			out.print("alert('로그인 후 사용가능합니다.');");
			out.print("location.href='/user/login.do';");
			out.print("</script>");
			out.close();
			return false;
		}
		return true;
	}
}
