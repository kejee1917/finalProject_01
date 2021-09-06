package verni.co.kr.likes;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import verni.co.kr.review.ReviewDto;

@Service
public class LikesService {

	@Autowired
	LikesDao dao;
	
	public boolean likesAdd(LikesDto li) {
		dao.likesCount(li);
		return dao.likesAdd(li);
	}
	
	public boolean likesDelete(LikesDto li) {
		dao.likesDelCount(li);
		return dao.likesDelete(li);
	}
	
	public int likesList(LikesDto li){
		return dao.likesList(li);
	}
	
}
