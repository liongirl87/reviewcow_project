package com.reviewcow.sellpost;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.member.model.Member;
import com.reviewcow.sellpost.bo.SellPostBo;
import com.reviewcow.sellpost.model.SellPostUploadForm;

import javax.servlet.http.HttpSession;


@RequestMapping("/sellpost")
@RestController
public class SellPostRestController {
	@Autowired
	private SellPostBo sellPostBo;
	
	@GetMapping("/caldate")
	public Map<String,Object> calDate(
			@RequestParam("startDate") String start,
			@RequestParam("endDate") String end,
			Model model
			) throws ParseException{
		Map<String,Object> result = new HashMap<>();
		String strStartDate = start;
		String strEndDate = end;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = format.parse(strStartDate);
		Date endDate = format.parse(strEndDate);
		
	    long sec = (startDate.getTime() - endDate.getTime()) / 1000; // 초
		long days = Math.abs(sec / (24*60*60) -1); // 일자수
		
		
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		
		
		result.put("code", days);
		result.put("result", "success");
		return result;
	}
	
	/**
	 * 체험단 모집
	 * @param sellPostForm
	 * @return
	 */
	@PostMapping("/upload_product")
	public Map<String, Object> uploadProduct(
			@ModelAttribute SellPostUploadForm sellPostForm,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();

		// 세션에서 loginId를 꺼내서 sellPostForm에 넣어준다
		Member sessionMember = (Member)session.getAttribute("member");
	
		sellPostForm.setMemberId(sessionMember.getId());
		sellPostForm.setMemberLoginId(sessionMember.getLoginId());
	
		if (sellPostBo.addSellPost(sellPostForm) > 0) {
			result.put("code", 1);
		}
		return result;
	}
}
