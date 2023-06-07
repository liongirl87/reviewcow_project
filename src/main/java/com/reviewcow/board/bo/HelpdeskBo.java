package com.reviewcow.board.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.board.dao.HelpdeskMapper;
import com.reviewcow.board.model.Helpdesk;

@Service
public class HelpdeskBo {

	@Autowired
	private HelpdeskMapper helpdeskMapper;
	
	public void addHelpdeskWriting(int memberId, String category, String subject, String content) {
		helpdeskMapper.insertHelpdeskWriting(memberId, category, subject, content);
	}
	
	public List<Helpdesk> getHelpdeskWritingListByMemberId(Integer memberId) {
		return helpdeskMapper.selectHelpdeskWritingListByMemberId(memberId);
	}
}
