package com.reviewcow.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.reviewcow.member.model.Member;

@Component	// 스프링빈
public class PermissionInterceptor implements HandlerInterceptor{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler) throws IOException {
		
		// 요청 URL을 가져온다.
		String uri = request.getRequestURI();
		logger.info("[$$$$$$$$$$ preHandler] uri:{}", uri);
		// 로그인 여부 확인 - 세션확인
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		logger.info("[$$$$$$$ memberid] memberId:{}", member);
		
		response.setContentType("text/html; charset=UTF-8");
		// PrintWriter out =response.getWriter();
		
		// 비로그인 => 로그인 페이지로 리다이렉트 => return false(기존 컨트롤러 수행 방지)
		
		// 회원정보 수정
		if(member == null && uri.equals("/member/modify_myinfo_view")) { 
			response.getWriter().println("<script>alert('로그인 후 이용해주세요');location.href='/member/login_view';</script>"); 
			// out.close();
			// response.sendRedirect("/member/login_view"); // 보내는 주소
			return false; }
		
		// 문의하기
		if(member == null && uri.equals("/board/helpdesk_view")) {
			response.getWriter().println("<script>alert('로그인 후 이용해주세요');location.href='/member/login_view';</script>");
			return false;
		} else if (member == null && uri.equals("/board/helpdesk_write_view")) {
			response.getWriter().println("<script>alert('로그인 후 이용해주세요');location.href='/member/login_view';</script>");
			return false;
		}
		
		// 포인트 관리
		if(member == null && uri.startsWith("/point/manage_point_view")) {
			response.getWriter().println("<script>alert('로그인 후 이용해주세요');location.href='/member/login_view';</script>");
			return false;
		}
		
		// 체험단모집
		if(member == null && uri.equals("/sellpost/upload_product_view")) { 
			response.getWriter().println("<script>alert('로그인 후 이용해주세요');location.href='/member/login_view';</script>"); 
			return false; 
			} else if (member == null && uri.equals("application/manage_applicants_view")) {
			response.getWriter().println("<script>alert('로그인 후 이용해주세요');location.href='/member/login_view';</script>"); 
			return false; 
		}
		
		// 찜목록
		if(member == null && uri.equals("/like_list_view")) { 
			response.getWriter().println("<script>alert('로그인 후 이용해주세요');location.href='/member/login_view';</script>"); 
			return false; 
		}
		
		// 리뷰관리
		if(member == null && uri.equals("/review/myreview_list_view")) { 
			response.getWriter().println("<script>alert('로그인 후 이용해주세요');location.href='/member/login_view';</script>"); 
			return false; 
		}
		
		// 신청한 체험단
		if(member == null && uri.equals("/application/apply_product_list_view")) { 
			response.getWriter().println("<script>alert('로그인 후 이용해주세요');location.href='/member/login_view';</script>"); 
			return false; 
		}
		
		// 로그인후 로그인화면 접근 불가
		if (member != null && uri.equals("/member/login_view")) {
			response.sendRedirect("/main/main_view");
			return false;
		}
		
		// 어드민 페이지 권한 (비 로그인시 어드민 페이지 접근 불가)
		if (member == null && uri.startsWith("/admin/")) {
			response.getWriter().println("<script>alert('관리자 계정으로 로그인해주세요11');location.href='/admin/login_view';</script>");
			return false;
		}
		
		// 어드민 계정외에 접근 불가
		if (member != null) {
			if (!member.getLoginId().equals("admin") && uri.startsWith("/admin/")) {
				response.getWriter().println("<script>alert('관리자 계정으로 로그인해주세요');location.href='/admin/login_view';</script>");
				return false;
			} else {
				return true;}
		}
		
		return true;// 컨트롤러 수행
	}
	
	@Override
	public void postHandle (
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			ModelAndView mav) {
		
		
		// view 객체가 존재한다는 것은 아직 jsp가 HTML로 변환되기 전이다.
		logger.info("[######## postHandle]");
	}
	
	@Override
	public void afterCompletion(
			HttpServletRequest request,
			HttpServletResponse response,
			Object handler,
			Exception ex) {
		// JSP가 HTML로 최종 변환된 후
		logger.info("[@@@@@@@ afterCompletion]");
	}
}
