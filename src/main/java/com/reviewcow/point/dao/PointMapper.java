package com.reviewcow.point.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reviewcow.point.model.Point;

@Repository
public interface PointMapper {

	// 비활성
	public List<Point> selectPointListByMemberId(Integer memberId);
	
	public int selectNowPointByMemberId(Integer memberId);
	
	public int countPointContentsByMemberId(
			@Param("memberId") Integer memberId,
			@Param("status") Integer status);
	
	public List<Point> selectPointListByMemberIdForPaging(
			@Param("memberId") Integer memberId,
			@Param("status") Integer status,
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
	
	public void addPointByMemberIdAndSellPostId(
			@Param("memberId") Integer memberId,
			@Param("sellPostId") Integer sellPostId,
			@Param("point") Integer point,
			@Param("sort") Integer sort
			);
	public void insertPointByMemberId(Map<String, Object> params);
	
	public void insertPointDepositByPointId(
			@Param("pointId")int pointId,
			@Param("methodsOfPayment")String methodsOfPayment);
	
	public void withdrawPointByPointId(
			@Param("pointId") int pointId,
			@Param("bank") String bank,
			@Param("depositor") String depositor,
			@Param("accountNumber") String accountNumber);
	
	public int countChargePointBeforeApproval(
			@Param("sort") Integer sort,
			@Param("status") Integer status);
	
	public List<Point> selectChargePointBeforeApproval(
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit,
			@Param("sort") Integer sort,
			@Param("status") Integer status);
	
	public void approvalChargePoint(
			@Param("id") int id, 
			@Param("approvalCondition") int approvalCondition);
}
