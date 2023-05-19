package com.reviewcow.member.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.member.DAO.MemberMapper;
import com.reviewcow.member.model.Business_Member;
import com.reviewcow.member.model.Influencer_Member;
import com.reviewcow.member.model.Member;
import com.reviewcow.member.model.MemberJoinForm;

@Service
public class MemberBo {
	@Autowired
	private MemberMapper memberMapper;
	
	// 회원가입(기본정보)
	public int addMember(MemberJoinForm meberJoinForm) {
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
	
}
