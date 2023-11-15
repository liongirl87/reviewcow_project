package com.reviewcow.board.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.board.dao.HelpdeskMapper;
import com.reviewcow.board.dao.HelpdeskReplyMapper;
import com.reviewcow.board.model.Helpdesk;
import com.reviewcow.board.model.HelpdeskMember;
import com.reviewcow.board.model.HelpdeskReply;
import com.reviewcow.member.dao.MemberMapper;
import com.reviewcow.member.model.Member;

@Service
public class HelpdeskBo {

	@Autowired
	private HelpdeskMapper helpdeskMapper;
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private HelpdeskReplyMapper helpdeskReplyMapper;
	
	public void addHelpdeskWriting(int memberId, String category, String subject, String content) {
		helpdeskMapper.insertHelpdeskWriting(memberId, category, subject, content);
	}
	
	public List<Helpdesk> getHelpdeskWritingListByMemberId(Integer memberId) {
		return helpdeskMapper.selectHelpdeskWritingListByMemberId(memberId);
	}
	
	public int countPointContentsByMemberId(Integer memberId) {
		return helpdeskMapper.countPointContentsByMemberId(memberId);
	}
	
	public List<HelpdeskMember> getHelpdeskListByMemberId(Integer memberId, int skipLimit, int limit){
		List<HelpdeskMember> helpdeskMemberList = new ArrayList<>();
		List<Helpdesk> helpdeskList = helpdeskMapper.selectHelpdeskListByMemberId(memberId, skipLimit, limit);
		
		for(Helpdesk helpdesk : helpdeskList) {
			HelpdeskMember helpdeskMember = new HelpdeskMember();
			helpdeskMember.setHelpdesk(helpdesk);
			helpdeskMember.setNumberOfReplies(helpdeskMapper.countHelpdeskRepliesByHelpdeskId(helpdesk.getId()));
			helpdeskMemberList.add(helpdeskMember);
		}
		return helpdeskMemberList;
	}
	
	public Helpdesk gethelpdeskContentsByPostId(Integer postId) {
		return helpdeskMapper.selecthelpdeskContentsByPostId(postId);
	}
	
	public boolean deleteHelpdsekByPostId(int postId) {
		return helpdeskMapper.deleteHelpdsekByPostId(postId) > 0;
	}
	
	public boolean updateHelpdeskByPostId(String content, int postId) {
		return helpdeskMapper.updateHelpdeskByPostId(content, postId) > 0;
	}
	
	public int countHelpdesk() {
		return helpdeskMapper.countHelpdesk();
	}
	
	
	public List<HelpdeskMember> getHelpdeskList(int skipLimit, int limit) {
		List<HelpdeskMember> helpdeskMemberList = new ArrayList<>();
					
		List<Helpdesk> helpdeskList = helpdeskMapper.selectHelpdeskList(skipLimit, limit);
		for (Helpdesk helpdesk : helpdeskList) {
			HelpdeskMember helpdeskMember = new HelpdeskMember();
			
			helpdeskMember.setHelpdesk(helpdesk);
			helpdeskMember.setMember(memberMapper.selectMemberByMemberId(helpdesk.getMemberId()));
			helpdeskMember.setNumberOfReplies(helpdeskMapper.countHelpdeskRepliesByHelpdeskId(helpdesk.getId()));
			helpdeskMemberList.add(helpdeskMember);
		}
		return helpdeskMemberList;
	}
	
	public HelpdeskMember getHelpdeskMember(Integer helpdeskId) {
		HelpdeskMember helpdeskMember = new HelpdeskMember();
		
		helpdeskMember.setHelpdesk(helpdeskMapper.selecthelpdeskContentsByPostId(helpdeskId));
		helpdeskMember.setMember(memberMapper.selectMemberByMemberId(helpdeskMember.getHelpdesk().getMemberId()));
		
		List<HelpdeskReply> helpdeskReplyList = helpdeskReplyMapper.selectHelpdeskReplybyHelpdeskId(helpdeskId);
		List<HelpdeskReply> helpdeskReplyListAfter = new ArrayList<>();
		
		for (HelpdeskReply helpdeskReply : helpdeskReplyList) {
			Member member = new Member();
			member = memberMapper.selectMemberByMemberId(helpdeskReply.getMemberId());
			helpdeskReply.setMember(member);
			helpdeskReplyListAfter.add(helpdeskReply);
		}
		
		helpdeskMember.setHelpdeskReply(helpdeskReplyListAfter);
		
		return helpdeskMember;
	}
	
	
	/* helpdest_reply */
	public void addHelpdeskReply(int memberId, int helpdeskId, String content) {
		helpdeskReplyMapper.insertHelpdeskReply(memberId, helpdeskId, content);
	}
	
	public void delHelpdeskReplyByReplyId(int replyId) {
		helpdeskReplyMapper.delHelpdeskReplyByReplyId(replyId);
	}
	
	
}
