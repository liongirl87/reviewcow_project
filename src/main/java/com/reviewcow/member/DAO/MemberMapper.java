package com.reviewcow.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reviewcow.member.model.Business_Member;
import com.reviewcow.member.model.Business_Member_List;
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
	
	// 사업자회원 리스트
	public List<Business_Member_List> selectBusinessMemberList(
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	// 사업자회원 카운트
	public int countBusinessMember();
	// 회원 카운트
	public int countMember();
	public int countMemberByMemberType(String memberType);
	
	// 회원정보 불러오기(포인트 조회)
	public Member selectMemberByMemberId(Integer memberId);
	
	// 회원 리스트 불러오기
	public List<Member> selectMemberList(
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public List<Member> selectMemberListByMemberType(
			@Param("memberType") String memberType,
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public String selectMemberLoginIdForHelpdesk(int memberId);
	
	// 회원 정보 수정
	public void updateMemberByLoginId(MemberJoinForm member);
	
	public void updateInfluencerByLoginId(MemberJoinForm member);
	
	public void updateBusinessMemberByLoginId(MemberJoinForm member);
	
	// 사업자 승인
	public void updateBusinessMemberById(
			@Param("id") int id,
			@Param("approvalCondition") int approvalCondition);
}
