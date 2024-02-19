//package kr.co.coco.colabo.chat;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Collections;
//import java.util.LinkedHashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.PostConstruct;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.stereotype.Service;
//import org.springframework.web.socket.TextMessage;
//import org.springframework.web.socket.WebSocketSession;
//
//import com.fasterxml.jackson.databind.ObjectMapper;
//
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//
//@Slf4j
//@RequiredArgsConstructor
//@Service
//// 채팅방과 관련된 비즈니스 로직을 담은 Service
//public class ChatService {
//	
//	@Bean        //  Json - java객체 변환하기 쉼게사용하는 직렬화,역직렬화 라이브러리
//	private final ObjectMapper objectMapper() {
//		return new ObjectMapper();
//	}
//	
//    private Map<String, ChatRoom> chatRooms;
//    
// // 생성자와 빈 초기화를 동시에 하게해줌 ??    한번만??
//    @PostConstruct
//    private void init() {
//        chatRooms = new LinkedHashMap<>();
//    }
//
//    //활성화된 모든 채팅방을 조회
//    public  List<ChatRoom> findAllRoom() {
//        List<ChatRoom> result  = new ArrayList<>(chatRooms.values());
//        Collections.reverse(result);
//        return result;
//    }
//    //채팅방 하나를 조회
//    public ChatRoom findRoomById(String roomId) {
//        return chatRooms.get(roomId);
//    }
//
//    //새로운 방 생성
//    public ChatRoom createRoom(String name) {
//        ChatRoom chatRoom = ChatRoom.create(name);
//        chatRooms.put(chatRoom.getRoomId(), chatRoom);
//        return chatRoom;
//    }
//    //방 삭제
//    public void deleteRoom(String roomId) {
//        ChatRoom chatRoom = findRoomById(roomId);
//        //해당방에 아무도 없다면 자동 삭제
//        if(chatRoom != null) chatRooms.remove(roomId);
//    }
//
//    public <T> void sendMessage(WebSocketSession session, T message) {
//        try{
//            session.sendMessage(new TextMessage(objectMapper().writeValueAsString(message)));
//        } catch (IOException e) {
//            log.error(e.getMessage(), e);
//        }
//    }
//}