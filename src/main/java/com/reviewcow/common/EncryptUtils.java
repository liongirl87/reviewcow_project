package com.reviewcow.common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;

import com.reviewcow.member.MemberRestController;

public class EncryptUtils {
	
	public static String getSha512(String password) {
		String encPwd= null;
		//암호화 완료된 값 보관할 변수
		try {
			/* salt */
			SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
			// SecureRandom 숫자 생성 알고리즘
			byte[] bytes = new byte[16];
			// 16길이의 배열생성 (타입:바이트)
			random.nextBytes(bytes);
			// 생성한 배열에 랜덤 바이트값으로 채운다
			String salt = new String(Base64.getEncoder().encode(bytes));
			// 생성한 바이트값들을 Base64로 인코딩후 salt에 넣는다
			this.salt = salt;
			// 솔트값 저장			
			
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			// 'SHA-512' 방식으로 해쉬 -MessageDigest 클래스로 md 객체생성
			// string을 getBytes()로 bytes 배열로 변경
			byte[] passwordByte = password.getBytes();
			
			// salt+password 반복문
			for(int i = 0; i < 1000; i++) {
				String temp = byteToString(passwordByte) + salt;	
				// 패스워드와 Salt 를 합쳐 새로운 문자열 생성 
				md.update(temp.getBytes());						
				// temp 의 문자열을 해싱하여 md 에 저장해둔다 
				passwordByte = md.digest();							
				// md 객체의 다이제스트를 얻어 password 를 갱신한다 
			}
//			
//			md.update(salt.getBytes());
//	     	md.update(password.getBytes());
//	     	// 알고리즘을 이용하여 byte단위로 암호화처리(getBytes()), update는 byte배열만 받는다 - update()를 호출해서 객체내에 저장된 digest값 갱신
//	     	

	      	encPwd = String.format("%0128X", new BigInteger(1, passwordByte));
	      	// 16진수로 변환하는 과정 Integer -> String ->encPwd 반환
	      	// %0128x -> x:16진수 ,128: width 길이, 빈칸은 0으로 채운다
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		//encPwd 반환
		return encPwd;
	}
	// 바이트 값을 16진수로 변경해준다 
	private static String byteToString(byte[] temp) {
		String convertTemp = null;
		convertTemp = String.format("%0128X", new BigInteger(1, temp));

		return convertTemp;
	}
	public void getSalt(String salt) {
		
		return ;
	}
	
}
