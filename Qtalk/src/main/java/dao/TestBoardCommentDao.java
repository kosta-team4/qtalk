package dao;

import java.util.List;

import dto.TestBoardComment;

public interface TestBoardCommentDao {
	void insertBoardComment(TestBoardComment testBoardComment) throws Exception;
	List<TestBoardComment> selectBoardCommentList(Integer postnum) throws Exception;
	void updateBoardComment(Integer comment_num) throws Exception;
	void deleteBoardComment(Integer comment_num) throws Exception;
	TestBoardComment selectBoardComment(Integer comment_num)throws Exception;

	// post_num이 num인 댓글 모두 삭제
	void deleteCommentAll(String num) throws Exception;

}