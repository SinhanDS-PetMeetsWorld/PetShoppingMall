package sinhanDS.first.project.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import sinhanDS.first.project.user.vo.UserVO;

public class AmdinLoginInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, 
							HttpServletResponse response, 
							Object handler) throws Exception {
		HttpSession sess = request.getSession();
		String login = (String)sess.getAttribute("adminLoginInfo");
		
		if (login == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('로그인 후 사용가능합니다.');");
			out.print("location.href='/admin/index.do';");
			out.print("</script>");
			out.close();
			return false;
		}
		return true;
	}
}
