package com.reviewcow.member.DAO;

import org.springframework.stereotype.Repository;

import com.reviewcow.member.model.Business_Member;
import com.reviewcow.member.model.Influencer_Member;
import com.reviewcow.member.model.Member;
import com.reviewcow.member.model.MemberJoinForm;

@Repository
public interface MemberMapper {
	// 회원가입 DB INSERT
	public int insertMember(MemberJoinForm meberJoinForm);
	
	// membertype = influencerMember
	public void insertinfluencerMember(MemberJoinForm meberJoinForm);
	
	// membertype = businessMember
	public void insertbusinessMember(MemberJoinForm meberJoinForm);
	
	// 아이디 중복 체크
	public Member selectMemberByLoginId(String loginId);
	
	// 인플루언서 정보 가져오기
	public Influencer_Member selectInfluencerMemberByLoginId(String loginId);
	
	// 사업자회원 정보 가져오기
	public Business_Member selectBusinessMemberByLoginId(String loginId);
	
	// 회원 정보 수정
	public void updateMemberByLoginId(MemberJoinForm member);
	
	public void updateInfluencerByLoginId(MemberJoinForm member);
	
	public void updateBusinessMemberByLoginId(MemberJoinForm member);
}
