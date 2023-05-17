package com.reviewcow.member.DAO;

import org.springframework.stereotype.Repository;

import com.reviewcow.member.model.MemberJoinForm;

@Repository
public interface MemberMapper {
	public int insertMember(MemberJoinForm meberJoinForm);
}
