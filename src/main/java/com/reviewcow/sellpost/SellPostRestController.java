package com.reviewcow.sellpost;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;


@RequestMapping("/sellpost")
@RestController
public class SellPostRestController {

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
}
