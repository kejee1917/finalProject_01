package verni.co.kr.wish;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishService {

	@Autowired
	WishDao dao;
	
	public boolean addWish(WishDto ws) {
		dao.addWishCount(ws);
		return dao.addWish(ws);
	}
	
	public boolean delWish(WishDto ws) {
		dao.delWishCount(ws);
		return dao.delWish(ws);
	}
	
	public int getWishList(WishDto ws){
		return dao.getWishList(ws);
	}
	
	public List<WishDto> getWishMember(String m_id){
		return dao.getWishMember(m_id);
	}
	public int getWishDetail(WishDto ws) {
		return dao.getWishDetail(ws);
	}

	// 엄지추가 /////////////////////////////////
	public List<WishDto> wishList(String m_id){
		return dao.wishList(m_id);
	}
	public boolean deleteWish(int w_no) {
		return dao.deleteWish(w_no);
	}
	/////////////////////////////////////////	
	
	
}
