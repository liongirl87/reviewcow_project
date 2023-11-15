package com.reviewcow.member.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.member.dao.MemberMapper;
import com.reviewcow.member.model.Business_Member;
import com.reviewcow.member.model.Business_Member_List;
import com.reviewcow.member.model.Influencer_Member;
import com.reviewcow.member.model.Member;
import com.reviewcow.member.model.MemberJoinForm;
import com.reviewcow.member.model.MemberPoint;
import com.reviewcow.point.dao.PointMapper;

@Service
public class MemberBo {
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private PointMapper pointMapper;
	
	// 회원가입(기본정보)
	public int addMember(MemberJoinForm meberJoinForm) {
		/* 회원가입시 일반회원, 인플루언서경우 바로 승인(1) */
		if(meberJoinForm.getMemberType().equals("influencerMember") || meberJoinForm.getMemberType().equals("member")) {
			meberJoinForm.setApprovalCondition(1);
		}
		return memberMapper.insertMember(meberJoinForm);
	}
	
	// 멤버타입별 추가 정보(influencer, business)
	public int addMemberType(MemberJoinForm meberJoinForm) {
		if(meberJoinForm.getMemberType().equals("influencerMember")) {
			memberMapper.insertinfluencerMember(meberJoinForm);
			return 2;
		} else if (meberJoinForm.getMemberType().equals("businessMember")) {
			memberMapper.insertbusinessMember(meberJoinForm);
			return 3;
		}
		return 1;	
	}
	
	// 아이디 중복체크
	public Member getMemberByLoginId(String loginId) {
		return memberMapper.selectMemberByLoginId(loginId);
	}
	
	// memeberType: influencer 가져오기
	public Influencer_Member getInfluencerMemberByLoginId(String loginId) {
		return memberMapper.selectInfluencerMemberByLoginId(loginId);
	}
	
	// memberType: business 가져오기
	public Business_Member getBusinessMemberByLoginId(String loginId) {
		return memberMapper.selectBusinessMemberByLoginId(loginId);
	}
	// 회원정보 수정
	public void updateMemberByLoginId(MemberJoinForm member) {
		memberMapper.updateMemberByLoginId(member);
	}
	// 인플루언서 정보 수정
	public void updateInfluencerByLoginId(MemberJoinForm member) {
		memberMapper.updateInfluencerByLoginId(member);
	}
	public void updateBusinessMemberByLoginId(MemberJoinForm member) {
		memberMapper.updateBusinessMemberByLoginId(member);
	}
	
	// 사업자 회원 승인
	public void updateBusinessMemberById(int id, int approvalCondition) {
		memberMapper.updateBusinessMemberById(id, approvalCondition);
	}
	
	// 회원정보 불러오기 (포인트 조회)
	public Member getMemberByMemberId(Integer memberId) {
		return memberMapper.selectMemberByMemberId(memberId);
	}
	// 전체 회원 불러오기
	public List<Member> getMemberList(int skipLimit, int limit) {
		return memberMapper.selectMemberList(skipLimit, limit); }
	
	// 회원타입별 회원 불러오기
	public List<Member> getMemberListByMemberType(String memberType, int skipLimit, int limit) {
		return memberMapper.selectMemberListByMemberType(memberType, skipLimit, limit);
	}
	
	// 사업자 회원 불러오기
	public List<Business_Member_List> getBusinessMemberList(int skipLimit, int limit) {
		return memberMapper.selectBusinessMemberList(skipLimit, limit);
	}
	// 사업자 회원 카운트
	public int countBusinessMember() {
		return memberMapper.countBusinessMember();
	}
	// 일반회원 카운트
	public int countMember() {
		return memberMapper.countMember();
	}
	public int countMemberByMemberType(String memberType) {
		return memberMapper.countMemberByMemberType(memberType);
	}
	
	// 1:1 문의글 memberId로 memberLoginId 가져오기
	public String getMemberLoginIdForHelpdesk(int memberId) {
		return memberMapper.selectMemberLoginIdForHelpdesk(memberId);
	}
	
	// 전체 멤버 조회 + 포인트
	public List<MemberPoint> getMemberListWithPoint(int skipLimit, int limit) {
		List<MemberPoint> MemberPointList = new ArrayList<>();
		List<Member> memberList = memberMapper.selectMemberList(skipLimit, limit);
		
		for(Member member : memberList) {
			MemberPoint memberPoint = new MemberPoint();
			
			memberPoint.setMember(member);
			// memberid로 포인트 가져오기
			memberPoint.setPoint(pointMapper.selectNowPointByMemberId(member.getId()));
			
			MemberPointList.add(memberPoint);
		}
		return MemberPointList;
	}
}
