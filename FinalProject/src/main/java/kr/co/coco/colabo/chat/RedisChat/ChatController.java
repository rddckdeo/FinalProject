package kr.co.coco.colabo.chat.RedisChat;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@EnableScheduling
public class ChatController {

 private final RedisPublisher redisPublisher;
 private final ChatRoomRepository chatRoomRepository;
 
 @Autowired
 private ObjectMapper objectMapper;
 
 // 메세지를 redis 서버에 저장할때 사용하려고 레디스템플릿 가져옴
 // 메세지를 저장할때는 key : chatMessage  
 //               value : ChatMessage 클래스를 Json 형식으로 바꾼데이터를 스트링으로 바꿔서 넣음
 @Autowired
 private RedisTemplate<String, Object> redisTemplate;
 
 private final SimpMessageSendingOperations messagingTemplate;

 
 //Redis
 private static final String CHAT_MESSAGE = "CHAT_MESSAGE";

 
 /**
  * websocket "/pub/chat/message"로 들어오는 메시징을 처리한다.
 * @throws JsonProcessingException 
 * @throws JsonMappingException 
  */
 @MessageMapping("/chat/message")
 public void message(ChatMessage message) throws JsonMappingException, JsonProcessingException {
     if (ChatMessage.MessageType.ENTER.equals(message.getType())) {
         chatRoomRepository.enterChatRoom(message.getRoomId());
         message.setMessage(message.getSender() + "님이 입장하셨습니다.");
         
         // 기존 레디스 저장되어있던 채팅기록 가져오기 
         List<Object> objects = redisTemplate.opsForList().range(CHAT_MESSAGE, 0, -1);
         
         if(objects != null) {
        	 
        	 System.out.println("레디스 저장메시지 전체 조회 들어왔습니다 ㅁㄴㅇㅁㅇㅁㄴ");
        	 for(Object object : objects) {
        		 ChatMessage chat = objectMapper.readValue((String)object, ChatMessage.class);
        		 messagingTemplate.convertAndSend("/sub/chat/room/" + chat.getRoomId(), chat);
        	 }
         }
     }else {
    	 // MessageType 이   Enter 가 아닐때   여기로 들어옴   지금은 talk, enter 밖에없음
    	 // redis 에 메세지를 저장할 Json 객체로 변환할  chatMessage
    	 ChatMessage chatMessage = new ChatMessage();
    	 chatMessage.setRoomId(message.getRoomId());
    	 chatMessage.setSender(message.getSender());
    	 chatMessage.setMessage(message.getMessage());
    	 chatMessage.setCreatedAt(LocalDateTime.now());
    	 
    	 try {
			String messageJson = objectMapper.writeValueAsString(chatMessage);
			
			redisTemplate.opsForList().rightPush(CHAT_MESSAGE, messageJson);
			System.out.println("메세지 레디스에 넣는중 입니다  ㅁ  ㅁㄴㅇㅁㄴㅇㅁㄴㅇ :ㅁ : :ㅁㅇ");
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
    	 
     }
     // Websocket에 발행된 메시지를 redis로 발행한다(publish)
     redisPublisher.publish(chatRoomRepository.getTopic(message.getRoomId()), message);
 }
 
 
 
//@Scheduled 어노테이션은 이 메서드를 정해진 주기마다 자동으로 실행하도록 설정합니다.
//fixedDelay = 60000은 이 메서드를 60,000밀리초(=1분)마다 실행하도록 설정합니다.
@Scheduled(fixedDelay = 60000) 
public void deleteOldMessages() throws JsonMappingException, JsonProcessingException {
	
//	System.out.println("1분단위 메세지 자동삭제 진행중 입니다 ㅂㄴㅇㅂㄴ");
  // 현재 시간에서 1시간 전의 시간을 구합니다.
  LocalDateTime oneHourAgo = LocalDateTime.now().minusHours(1);
  // 분 단위로 삭제    
//  LocalDateTime oneHourAgo = LocalDateTime.now().minusMinutes(1);

  // "chatMessages" 리스트의 모든 메시지를 조회합니다. 
  //  range 메서드의 두 번째와 세 번째 매개변수는 조회할 범위를 지정하며, 0과 -1은 전체 범위를 의미합니다.
  //  List<ChatMessage> messages = objectMapper.readValues(redisTemplate.opsForList().range(CHAT_MESSAGE, 0, -1), ChatMessage.class);
  List<Object> objects = redisTemplate.opsForList().range(CHAT_MESSAGE, 0, -1);
  
  // 처음에 redis서버에있는  모든데이터를가져올때    역직렬화를해서  Object 타입으로 가져오게된다
  // 그 이유때문에 object타입으로 가져온 리스트를 ChatMessage 객체로 변환해서  반복문을 실행해 삭제해야하기때문에
  // messages 리스트를 만들어주고  반복문을 돌려  objectMapper 를 사용해 ChatMessage 객체로 바꿔준다.
  List<ChatMessage> messages = new ArrayList<>();
  for (Object object : objects) {
      String json = (String) object;
      ChatMessage message = objectMapper.readValue(json, ChatMessage.class);
      messages.add(message);
  }
  // 조회한 모든 메시지에 대해 반복을 수행합니다.
  for (ChatMessage message : messages) {
	  // redisTemplate.opsForList().remove(key, count, value) 
	  // 이부분의 value 에 들어가는값은 redis서버에 저장된 값이랑 동일해야하니까 
	  // Json 문자열로 변경해주어야한다 기존에 삭제가 안되었던이유는 객체 그자체로 넘겨주기때문에
	  // 동일한 값이 없어서 삭제가 안되었던것이고 Json 문자열로 변경해서 넘겨주면 될듯하다 확인완료 *******
	  String messageJson = objectMapper.writeValueAsString(message);
      // 메시지의 생성 시간이 1시간 전보다 이전인지 확인합니다.
      if (message.getCreatedAt().isBefore(oneHourAgo)) {
          // 만약 1시간 전보다 이전이라면, 이 메시지는 오래된 것으로 판단하고 삭제합니다.
          // 여기서 필요하다면 메시지를 백업하는 코드를 추가할 수 있습니다.
    	  // redisTemplate.opsForList().remove(key, count, value);
    	  //  여기서 count 값이 0초과이면   리스트왼쪽부터 삭제   0미만이면 오른쪽부터삭제  0 이면 value와 동일한것 모두삭제 
    	  // 와 같이 사용하면, key로 지정된 리스트에서 value 값을 가진 요소를 count 개수만큼 삭제합니다
          redisTemplate.opsForList().remove(CHAT_MESSAGE, 1, messageJson);
      } else {
          // 만약 1시간 전보다 이후라면, 이 메시지는 아직 유효한 것으로 판단합니다.
          // 그리고 이후의 메시지들도 모두 유효하다고 가정하고 반복을 즉시 종료합니다.
          // 이는 메시지가 생성된 순서대로 리스트에 저장되었다는 가정하에 동작하는 코드입니다.
          break;
      }
  }
}
 
 
 
 
 
}