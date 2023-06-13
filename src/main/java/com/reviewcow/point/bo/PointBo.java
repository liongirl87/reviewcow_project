package com.reviewcow.point.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reviewcow.point.dao.PointMapper;
import com.reviewcow.point.model.Point;

@Service
public class PointBo {
	@Autowired
	private PointMapper pointMapper;
	
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
}
