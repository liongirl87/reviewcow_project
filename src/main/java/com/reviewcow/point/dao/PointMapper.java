package com.reviewcow.point.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.reviewcow.point.model.Point;

@Repository
public interface PointMapper {

	// 비활성
	public List<Point> selectPointListByMemberId(Integer memberId);
	
	public int selectNowPointByMemberId(Integer memberId);
	
	public int countPointContentsByMemberId(Integer memberId);
	
	public List<Point> selectPointListByMemberIdForPaging(
			@Param("memberId") Integer memberId,
			@Param("skipLimit") int skipLimit,
			@Param("limit") int limit);
}
