package kr.co.coco.colabo.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Controller 
public class colaboProjectNoCheckInterceptor  implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		// projectNo 가 null 일때  먼저하는이유는  앞에서 true 가 되면 뒤에는 || 연산자 즉 or 이기때문에
		// 뒤에있는 로직이 실행되지않고  만약 앞에서 false 가 나오게되면 프로젝트넘버는 있다는것이기때문에
		// 뒤에있는 세션을 실행  0 일때는 내가 colabo 페이지로올때 임의로 정해둔 값임
		if(session.getAttribute("getProjectNo") == null || (int)session.getAttribute("getProjectNo") == 0) {
			response.sendRedirect("/colabo");
			return false;
		}
		
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler,
			@Nullable Exception ex) throws Exception {
	}
}
