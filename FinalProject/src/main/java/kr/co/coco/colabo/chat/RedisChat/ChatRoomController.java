package kr.co.coco.colabo.chat.RedisChat;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatRoomController {
//    private final ChatService chatService;
    private final ChatRoomRepository chatService;

    // 채팅 리스트 화면
    @GetMapping("/room")
    public String rooms(Model model) {
        return "/colabo/ChatDetail";
    }
    // 모든 채팅방 목록 반환
    @GetMapping("/rooms")
    @ResponseBody
    public List<ChatRoom> room() {
        return chatService.findAllRoom();
    }
    // 채팅방 생성
    @PostMapping("/room")
    @ResponseBody
    public ChatRoom createRoom(@RequestParam String name) {
    	System.out.println(" 채팅방 생성  컨트롤러 옴 이름은  :" + name);
        return chatService.createChatRoom(name);
    }
    // 채팅방 입장 화면
    @GetMapping("/room/enter")
    public String roomDetail(Model model, @RequestParam(value="roomId") String roomId, @RequestParam(value="roomName")String roomName) {
    	
    	System.out.println("roomId 조회 : "+ roomId);
        model.addAttribute("roomId", roomId);
        model.addAttribute("roomName", roomName);
        System.out.println("가져온 roomName 은 : : : : : : : :: : "+roomName);
        return "/colabo/ChatDetail";
    }
    // 특정 채팅방 조회
    @GetMapping("/room/{roomId}")
    @ResponseBody
    public ChatRoom roomInfo(@PathVariable String roomId) {
    	System.out.println("room선택시 정보 가져오는곳 들어옴  : "+ roomId);
        return chatService.findRoomById(roomId);
    }
}