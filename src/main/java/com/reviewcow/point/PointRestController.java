package com.reviewcow.point;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.point.bo.PointBo;

@RestController
@RequestMapping("/point")
public class PointRestController {

	@Autowired
	private PointBo pointBo;
	
	@PutMapping("/deposit")
	public Map<String, Object> depositPoint (
			@RequestParam("point") int point,
			@RequestParam("methodsOfPayment") String methodsOfPayment,
			HttpSession session
			)
	{
		Map<String, Object>result = new HashMap<>();
		Integer memberId = (Integer)session.getAttribute("memberId");
		
		int sort= 2;
		
		
		// point 
		pointBo.addPointByMemberId(memberId, point, methodsOfPayment, sort);
		
		result.put("code", 1);
		result.put("result", "충전신청을 완료하였습니다");
		
		return result;
	}
	
	@PutMapping("/withdraw")
	public Map<String, Object> withdrawPoint(
			@RequestParam("bank") String bank,
			@RequestParam("withdrawal") int withdrawal,
			@RequestParam("depositor") String depositor,
			@RequestParam("accountNumber") String accountNumber,
			HttpSession session
			) {
			Map<String, Object> result = new HashMap<>();
			Integer memberId = (Integer)session.getAttribute("memberId");
			pointBo.withdrawPointByMemberId(memberId, withdrawal, bank, depositor, accountNumber);
			
			result.put("code", 1);
			result.put("result", "출금신청을 완료하였습니다");
			return result;
			
	}
}
