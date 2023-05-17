package com.reviewcow.member.BO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.member.DAO.MemberMapper;
import com.reviewcow.member.model.MemberJoinForm;

@Service
public class MemberBo {
	@Autowired
	private MemberMapper memberMapper;
	
	public int addMember(MemberJoinForm meberJoinForm) {
		return memberMapper.insertMember(meberJoinForm);
	}
}
