package com.reviewcow.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.reviewcow.common.FileManagerService;
import com.reviewcow.interceptor.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	@Autowired
	private PermissionInterceptor interceptor;
	
	// 서버에 업로드 된 이미지와 웹 이미지 매핑
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**") // 웹 이미지 주소
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH); // 실제 파일 위치 **윈도우는 /// <-3개 사용
	}
	
	// interceptor 설정 추가
	public void addInterceptors(InterceptorRegistry registry) {
		registry
		.addInterceptor(interceptor)
		.addPathPatterns("/**")	// 모든주소 "/**" 아래 디렉토리까지 모두 확인
		.excludePathPatterns("/favicon.ico", "/error", "/static/**", "/member/sign_out", "/admin/sign_out", "/admin/login_view", "/admin/login")
		;
		
	}
}
