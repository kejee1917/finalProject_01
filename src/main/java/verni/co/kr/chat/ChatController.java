package verni.co.kr.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import verni.co.kr.admin.ChartDto;

@Controller
public class ChatController {
	
	@Autowired
	ChatService service;
	
	
	@RequestMapping(value="chat.do", method = RequestMethod.GET)
		public String chat() {
			return "chat.tiles";
		}
	
	
	// chart
	@RequestMapping(value="chart.do", method = RequestMethod.GET)
	public String chart(Model model) {
		
		List<ChartDto> mtlist = service.getMonthTotal();
		model.addAttribute("mtlist", mtlist);
		
		List<ChartDto> glist = service.getGenderRat();
		model.addAttribute("glist", glist);
		
		List<ChartDto> toplist = service.getTopProduct();
		model.addAttribute("toplist", toplist);
		
		
		
		System.out.println(mtlist.toString());
		
		
		return "adminchart.tiles";
	}

	
	
	
	@RequestMapping(value="adminlist.do", method = RequestMethod.GET)
		public String adminlist(Model model) {
		
			List<ChatRoomDto> list = service.getChatRoomList();
			List<ChatDto> roomList = new ArrayList<>();
			
			for(int i=0; i<list.size(); i++) {
				ChatDto dto = service.getChatList(list.get(i).getR_no());
				roomList.add(dto);
			}
			System.out.println(roomList.toString());
			model.addAttribute("roomList", roomList);
		
			return "adminlist.tiles";
		}
	
	@ResponseBody
	@RequestMapping(value="adminchatlist.do", method = RequestMethod.GET)
		public List<ChatDto> adminchatlist(Model model) {
			System.out.println("확인용");
			List<ChatRoomDto> list = service.getChatRoomList();
			List<ChatDto> roomList = new ArrayList<>();
			
			for(int i=0; i<list.size(); i++) {
				ChatDto dto = service.getChatList(list.get(i).getR_no());
				roomList.add(dto);
			}
			
			model.addAttribute("roomList", roomList);
			System.out.println(roomList.toString());
		
			return roomList;
		}
	
	@RequestMapping(value="adminchat.do", method = RequestMethod.GET)
	public String adminchat(String r_no, String key, Model model) {
		
		System.out.println("adminchat controller : " + r_no);
		List<ChatDto> list = service.getChatData(r_no);
		System.out.println("chat :" + list.toString());
		
		// 입장이벤트
		boolean check = service.readUpdate(r_no);
		System.out.println("chat check :" + check);

		
		model.addAttribute("chatList", list);
		model.addAttribute("key", key);
		
		return "adminchat.tiles";
	}
	

	
	


}



