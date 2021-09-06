package verni.co.kr.wish;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishDao {

	@Autowired
	SqlSession session;
	
	String ns ="Wish.";
	
	public boolean addWish(WishDto ws) {
		int count = session.insert(ns+"addWish", ws);
		return count>0;
	}
	
	public void addWishCount(WishDto ws) {
		session.update(ns+"addWishCount", ws);
	}
	
	public boolean delWish(WishDto ws) {
		int count = session.delete(ns+"delWish", ws);
		return count>0;
	}
	
	public void delWishCount(WishDto ws) {
		session.update(ns+"delWishCount", ws);
	}
	
	public int getWishList(WishDto ws) {
		return session.selectOne(ns+"getWishList", ws);
	}
	
	public List<WishDto> getWishMember(String m_id) {
		return session.selectList(ns+"getWishMember", m_id);
	}
	
	public int getWishDetail(WishDto ws) {
		return session.selectOne(ns+"getWishDetail", ws);
	}
	
	// 엄지추가////////////////////////////////////
		public List<WishDto> wishList(String m_id) {
			return session.selectList(ns + "wishList", m_id);
		}
		
		public boolean deleteWish(int w_no) {
			int w = session.delete(ns + "deleteWish", w_no);
			return w>0;
			
		}
		////////////////////////////////////////
	
}
