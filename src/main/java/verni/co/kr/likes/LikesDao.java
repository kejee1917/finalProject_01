package verni.co.kr.likes;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import verni.co.kr.review.ReviewDto;


@Repository
public class LikesDao {

	@Autowired
	SqlSession session;
	
	String ns ="Likes.";
	
	public boolean likesAdd(LikesDto li) {
		int count = session.insert(ns+"likesAdd", li);
		return count>0;
	}
	
	public boolean likesDelete(LikesDto li) {
		int count = session.delete(ns+"likesDelete", li);
		return count>0;
	}
	
	public void likesCount(LikesDto li) {
		session.update(ns+"likesCount", li);
	}
	
	public void likesDelCount(LikesDto li) {
		session.update(ns+"likesDelCount", li);
	}
	
	public int likesList(LikesDto li) {
		return session.selectOne(ns+"likesList", li);
	}
	
}
