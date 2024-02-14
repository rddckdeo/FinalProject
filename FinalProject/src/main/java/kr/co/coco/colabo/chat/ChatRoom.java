//package kr.co.coco.colabo.chat;
//
//import java.util.HashSet;
//import java.util.Set;
//import java.util.UUID;
//
//import org.springframework.web.socket.WebSocketSession;
//
//import lombok.Builder;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
////ChatRoom은  오픈채팅방의 이름과 고유값 그리고 연결될 사용자의 세션Set이 필요합니다.
//@Getter
//@Setter
//@NoArgsConstructor
//public class ChatRoom {
//
//    private String roomId;
//    private String roomName;
//
//
//    public static ChatRoom create(String name) {
//        ChatRoom room = new ChatRoom();
//        room.roomId = UUID.randomUUID().toString();
//        room.roomName = name;
//        System.out.println(" UUID 사용 랜덤 문자열 : "+room.roomId);
//        return room;
//        
//    }
//}