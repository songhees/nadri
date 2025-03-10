package com.nadri.attr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.nadri.attr.vo.AttrReview;
import com.nadri.attr.vo.AttrReviewPic;

@Mapper
public interface AttrReviewDao {

	// 후기 리스트 출력
	List<AttrReview> getListByNo(@Param("no") int attNo, 
			@Param("beginIndex") int beginIndex, 
			@Param("endIndex") int endIndex);
	
	// 후기 등록
	void insertReview(AttrReview attrReview);
	void insertReviewPic(AttrReviewPic attrReviewPic); 
	List<AttrReviewPic> ReviewPicsByNo(int reviewNo);
	
	// 후기 수정
	void updateReview(@Param("no")int reviewNo, @Param("content")String content);
	
	// 후기 삭제
	void deleteReview(int reviewNo);
}
