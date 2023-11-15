package com.reviewcow.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	// 실제 업로드 된 이미지가 저장될 경로(서버) - 상수
	//public static final String FILE_UPLOAD_PATH = "C:\\7_spring_project_solo\\reviewcow\\workspace\\images/";
	
	public static final String FILE_UPLOAD_PATH = "/home/ec2-user/images/";
	
	// input:MultipartFile(이미지파일), loginId
	// output:image path(String)
	
	
	public String saveFile(String loginId, MultipartFile file) {
		// 파일 디렉토리(폴더)		예) aaaa_4775757/sun.png
		String directoryName = loginId + "_" + System.currentTimeMillis() + "/";
		String filePath = FILE_UPLOAD_PATH + directoryName;	// C:\\6_spring_project\\memo\\workspace\\images/aaaa_4775757/sun.png
	
		File directory = new File(filePath);
		if (directory.mkdir() == false) {
			return null;	// 폴더 만드는데 실패 시 이미지경로 null
		}
		
		// 파일 업로드: byte 단위로 업로드
		try {
			byte[] bytes = file.getBytes();
			
			//파일명 암호화
			String origName = new String(file.getOriginalFilename().getBytes("8859_1"),"UTF-8");
			String ext = origName.substring(origName.lastIndexOf(".")); // 확장자
			String saveFileName = getUuid() + ext;
			
			Path path = Paths.get(filePath + saveFileName);
			Files.write(path, bytes);
			
			// 파일 업로드가 성공했으면 이미지 url path를 리턴한다.
			// http://localhost/images/aaaaa_1678875757/sun.png
			return "/images/" + directoryName + saveFileName;
			
		} catch (IOException e) {	// 파일 업로드 실패시
			e.printStackTrace();
		}
		
		return null;	// orignalFileName은 사용자가 올린 파일 이름
	}
	
    // uuid 생성
	public static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	// input: 이미지패스(String)		output: X
	public void deleteFile(String imagePath) {	//imagePath: /images/aaaaa_1678875757/sun.png
		//C:\\6_spring_project\\memo\\workspace\\images/aaaaa_1678875757/sun.png
		// 겹치는 images 경로를 제거 - imagePath 안에 있는 /images/ 구문 제거
		Path path = Paths.get(FILE_UPLOAD_PATH + imagePath.replace("/images/", ""));
		// 이미지 삭제
		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("[이미지 삭제] 이미지 삭제 실패. imagePath:{}", imagePath);
				return;
			}
		}
		// 디렉토리(폴더) 삭제
		path = path.getParent();
		if (Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				logger.error("[이미지 삭제] 디렉토리 삭제 실패. imagePath:{}", imagePath);
			}
		}
	}
	
}

