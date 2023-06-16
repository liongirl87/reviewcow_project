package com.reviewcow.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reviewcow.board.bo.HelpdeskBo;

@RequestMapping("/board")
@RestController
public class BoardRestController {

	@Autowired
	private HelpdeskBo helpdeskBo;
	
	@GetMapping("/helpdesk_write")
	public Map<String, Object> writeHelpdesk(
			@RequestParam("category")String category,
			@RequestParam("subject")String subject,
			@RequestParam("content")String content,
			HttpSession session){
		Map<String, Object> result = new HashMap<>();
		
		Integer memberId = (Integer)session.getAttribute("memberId");
		helpdeskBo.addHelpdeskWriting(memberId, category, subject, content);
		
		result.put("code", "1");
		return result;
	}
	
	@DeleteMapping("/helpdesk_delete")
	public Map<String, Object> deleteHelpdesk(
			@RequestParam("postId") int postId){
		Map<String, Object> result = new HashMap<>();
		
		boolean deleteCheck = helpdeskBo.deleteHelpdsekByPostId(postId);
		
		if(deleteCheck == true) {
			result.put("code", 1);
			result.put("result","문의글 삭제 성공하였습니다.");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "문의글 삭제 실패하였습니다.");
		}
		return result;
	}
	
	@PutMapping("/helpdesk_update")
	public Map<String, Object> updateHelpdesk(
			@RequestParam("content") String content,
			@RequestParam("postId") int postId
			){
		Map<String, Object> result = new HashMap<>();
		
		if(helpdeskBo.updateHelpdeskByPostId(content, postId)) {
			result.put("code", 1);
			result.put("result", "success");
		} else {
			result.put("code", 400);
			result.put("errorMessage", "문의글 수정에 실패하였습니다.");
		}
		
		return result;
	}
}
