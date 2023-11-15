package com.reviewcow.point.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.member.dao.MemberMapper;
import com.reviewcow.point.dao.PointMapper;
import com.reviewcow.point.model.Point;
import com.reviewcow.point.model.PointMember;

@Service
public class PointBo {
	@Autowired
	private PointMapper pointMapper;
	@Autowired
	private MemberMapper memberMapper;
	
	// 비활성
	public List<Point> getPointListByMemberId(Integer memberId){
		return pointMapper.selectPointListByMemberId(memberId);
	}
	
	public int getNowPointByMemberId(Integer memberId) {
		return pointMapper.selectNowPointByMemberId(memberId);
	}
	
	public int countPointContentsByMemberId(Integer memberId, Integer status) {
		return pointMapper.countPointContentsByMemberId(memberId, status);
	}
	
	// 수동으로 누른 페이징 버튼에 따라서 포스트 가져오기
	public List<Point> getPointListByMemberIdForPaging(Integer memberId, Integer status, int skipLimit, int limit){
		return pointMapper.selectPointListByMemberIdForPaging(memberId, status, skipLimit, limit);
	}
	
	// 체험단 적립
	public void addPointByMemberIdAndSellPostId(Integer memberId,  Integer sellPostId, Integer point) {
		Integer sort = 0; 
		pointMapper.addPointByMemberIdAndSellPostId(memberId, sellPostId, point, sort);
	}
	
	// 포인트 충전 (sort =2)
	public void addPointByMemberId(Integer memberId, int point, String methodsOfPayment, int sort) {
		// sort=2 충전하기

		Map<String, Object> params = new HashMap<>();
		params.put("memberId", memberId);
		params.put("point", point);
		params.put("sort", sort);
		pointMapper.insertPointByMemberId(params);
		
		
		if (sort == 2) {
			// pointId 받아오기 useGeneratedKeys="true" int pointId =
			int pointId = Integer.parseInt((String.valueOf(params.get("pointId"))));
			
			// point_deposit 테이블 생성 by pointId
			pointMapper.insertPointDepositByPointId(pointId, methodsOfPayment);
		}
	}
	
	
	public void withdrawPointByMemberId(Integer memberId, int withdrawal, String bank, String depositor, String accountNumber) {
		Map<String, Object> params = new HashMap<>();
		// sort = 3 포인트 인출
		int sort = 3;
		params.put("memberId", memberId);
		params.put("point", withdrawal);
		params.put("sort", sort);
		pointMapper.insertPointByMemberId(params);
		
		// pointId 받아오기 useGeneratedKeys="true"
		int pointId = Integer.parseInt((String.valueOf(params.get("pointId"))));
		
		// point_withdraw 테이블 생성 by pointId
		pointMapper.withdrawPointByPointId(pointId, bank, depositor, accountNumber);
	}
	
	// 포인트 충전 대기 count
	public int countChargePointBeforeApproval(Integer sort, Integer status) {
		return pointMapper.countChargePointBeforeApproval(sort,status);
	}
	
	public List<PointMember> getChargePointBeforeApproval(int skipLimit, int limit, Integer sort, Integer status) {
		List<PointMember> pointMemberList = new ArrayList<>();
		
		List<Point> pointList = pointMapper.selectChargePointBeforeApproval(skipLimit, limit, sort, status);
		for(Point point : pointList) {
			PointMember pointMember = new PointMember();
			
			// point 통으로 넣기
			pointMember.setPoint(point);
			pointMember.setMember(memberMapper.selectMemberByMemberId(point.getMemberId()));
			
			pointMemberList.add(pointMember);
		}
		return pointMemberList;
	}
	
	public void approvalChargePoint(int id, int approvalCondition) {
		pointMapper.approvalChargePoint(id, approvalCondition);
	}
	
	
}
