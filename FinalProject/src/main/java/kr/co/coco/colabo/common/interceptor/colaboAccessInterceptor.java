package kr.co.coco.colabo.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class colaboAccessInterceptor implements HandlerInterceptor{
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 사용자가 요청할 당시의 주소 (URL)
		String referer = request.getHeader("referer");
		
		// 사용자가 요청한 주소(URL)
		String requestURI = request.getRequestURI();
		
		// 서버의 도메인 주소(ex. http://localhost) 를 구하기 위한 코드
		String serverDomain = request.getRequestURL().toString();
		
		
		String localServerDomain = serverDomain.replace(requestURI, "");
		
		/*  
		  	list.do 에서 디테일로 들어갔을때의 결과값   URL 에 직접 Detail.do 주소를 입력하게되면 
		  	                                   referer 가 생기지않음 .  클릭했을때만 접근이가능한데
		  	                                   이유는 클릭이벤트 발생과동시에 서버쪽으로 데이터가 넘어가게되어
		  	                                   referer 를 판단가능?
		  	
		    referer : http://localhost/free/detail.do?boardIdx=58
			requestURI : /resources/uploads/free/
			serverDomain : http://localhost/resources/uploads/free/
			localServerDomain : http://localhost
		*/
		System.out.println("referer  : "+referer);
		System.out.println("requestURI  : "+requestURI);
		System.out.println("serverDomain  : "+serverDomain);
		System.out.println("localServerDomain  : "+localServerDomain);
		
		if(requestURI.equals("/info/editForm.do") &&
				(referer == null || !referer.startsWith(localServerDomain+"/info/detail.do"))
				) {
			response.sendRedirect("/common/error.jsp");
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

