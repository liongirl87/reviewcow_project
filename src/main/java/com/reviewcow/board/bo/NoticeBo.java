package com.reviewcow.board.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.board.model.Notice;
import com.reviewcow.board.dao.NoticeMapper;
import com.reviewcow.board.model.NoticeMember;
import com.reviewcow.member.dao.MemberMapper;

@Service
public class NoticeBo {
	@Autowired
	private NoticeMapper noticeMapper;
	@Autowired
	private MemberMapper memberMapper;
	
	public void addNoticeByMemberId(int memberId,String category,String postTitle,String content) {
		noticeMapper.insertNoticeByMemberId(memberId, category, postTitle, content);
	}
	
	public List<NoticeMember> getNoticeList(int skipLimit, int limit){
		List<NoticeMember> noticeMemberList = new ArrayList<>();
		
		List<Notice> noticeList = noticeMapper.selectNoticeList(skipLimit,limit);
		
		for (Notice notice : noticeList) {
			NoticeMember noticeMember = new NoticeMember();
			
			noticeMember.setNotice(notice);
			noticeMember.setMember(memberMapper.selectMemberByMemberId(notice.getMemberId()));
			noticeMemberList.add(noticeMember);
		}
		
		return noticeMemberList;
	}
	
	public int countNotice() {
		return noticeMapper.countNotice();
	}
	
	public Notice getNoticeByNoticeId(int noticeId) {
		return noticeMapper.selectNoticeByNoticeId(noticeId);
	}
	
	public void updateNoticeByNoticeId(int id, int memberId,String category,String postTitle,String content) {
		noticeMapper.updateNoticeByNoticeId(id, memberId,category,postTitle,content);
	}
	
	public void deleteNoticeByNoticeId(int id) {
		noticeMapper.deleteNoticeByNoticeId(id);
	}
}
