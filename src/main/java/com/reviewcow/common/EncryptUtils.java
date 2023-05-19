package com.reviewcow.common;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

public class EncryptUtils {
	
	// salt값을 생성하는 메소드
	public static String getSalt() {
		/* salt */
		SecureRandom random;
		String salt = null;
		try {
			random = SecureRandom.getInstance("SHA1PRNG");
			// SecureRandom 숫자 생성 알고리즘
			byte[] bytes = new byte[16];
			// 16길이의 배열생성 (타입:바이트)
			random.nextBytes(bytes);
			// 생성한 배열에 랜덤 바이트값으로 채운다
			salt = new String(Base64.getEncoder().encode(bytes));
			// 생성한 바이트값들을 Base64로 인코딩후 salt에 넣는다(type을 String으로 변경)
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return salt;
	}
	
	// salt+password 합쳐진 키 값으로 비밀번호 해싱하는 메소드
	public static String passWordHashing(String password, String salt) {
		
		byte[] passwordByte = password.getBytes();
		//암호화 완료된 값 보관할 변수
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			// 'SHA-512' 방식으로 해쉬 -MessageDigest 클래스로 md 객체생성
			// string을 getBytes()로 bytes 배열로 변경
			// byte[] passwordByte = password.getBytes();
			
			// salt+password 반복문
			for(int i = 0; i < 1000; i++) {
				String temp = byteToString(passwordByte) + salt;	
				// 패스워드와 Salt 를 합쳐 새로운 문자열 생성 
				md.update(temp.getBytes());						
				// temp 의 문자열을 해싱하여 md 에 저장해둔다 
				passwordByte = md.digest();							
				// md 객체의 다이제스트를 얻어 password 를 갱신한다 
			}
	      	//encPwd = String.format("%0128X", new BigInteger(1, passwordByte));
	      	// 16진수로 변환하는 과정 Integer -> String ->encPwd 반환
	      	// %0128x -> x:16진수 ,128: width 길이, 빈칸은 0으로 채운다
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		//16진수로 변환시켜 리턴한다
		return byteToString(passwordByte);
	}
	
	// 바이트 값을 16진수로 변경해주는 메소드
	private static String byteToString(byte[] temp) {
		String convertTemp = null;
		convertTemp = String.format("%0128X", new BigInteger(1, temp));

		return convertTemp;
	}
}
