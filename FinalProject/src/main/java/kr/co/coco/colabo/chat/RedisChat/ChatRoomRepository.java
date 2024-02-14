package kr.co.coco.colabo.chat.RedisChat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@Primary
public class ChatRoomRepository {
	
	
	
    // 채팅방(topic)에 발행되는 메시지를 처리할 Listner
	@Autowired
    private RedisMessageListenerContainer redisMessageListener;
    
    // 구독 처리 서비스
	@Autowired
    private RedisSubscriber redisSubscriber;
    
    // Redis
    private static final String CHAT_ROOMS = "CHAT_ROOM";
    
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    
    //      HashOperations<key값, 필드값, value값> redis 에 데이터를 
    //      저장하고 가져올때  사용할 형식 
    private HashOperations<String, String, ChatRoom> opsHashChatRoom;
    
    // 채팅방의 대화 메시지를 발행하기 위한 redis topic 정보. 서버별로 채팅방에 매치되는 topic정보를 Map에 넣어 roomId로 찾을수 있도록 한다.
    private Map<String, ChannelTopic> topics;
    

//    public ChatRoomRepository() {
//	    this.redisTemplate = null; // 또는 실제로 사용할 RedisTemplate 객체를 초기화
//	    this.redisMessageListener = null; // 또는 실제로 사용할 RedisMessageListenerContainer 객체를 초기화
//	    this.redisSubscriber = null; // 또는 실제로 사용할 RedisSubscriber 객체를 초기화
//	}
    
    public ChatRoomRepository(RedisMessageListenerContainer redisMessageListener, RedisSubscriber redisSubscriber, RedisTemplate<String, Object> redisTemplate) {
        this.redisMessageListener = redisMessageListener;
        this.redisSubscriber = redisSubscriber;
        this.redisTemplate = redisTemplate;
    }
    
    public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
    
    @PostConstruct
    private void init() {
        opsHashChatRoom = redisTemplate.opsForHash();
//        redisTemplate.opsForValue().set("123123", "123123");
        topics = new HashMap<>();
        log.info("opsHashChatRoom 스트링 변환 : "+opsHashChatRoom.toString());
        log.info("JedisConnectionFactory:{}", JedisConnectionFactory.class);
        log.info("redisTemplate:{}", redisTemplate);
    }

    public List<ChatRoom> findAllRoom() {
        return opsHashChatRoom.values(CHAT_ROOMS);
    }

    public ChatRoom findRoomById(String id) {
    	System.out.println("룸아이디 찾기 조회 : "+ opsHashChatRoom.get(CHAT_ROOMS, id));
        return opsHashChatRoom.get(CHAT_ROOMS, id);
    }

    /**
     * 채팅방 생성 : 서버간 채팅방 공유를 위해 redis hash에 저장한다.
     */
    public ChatRoom createChatRoom(String name) {
        ChatRoom chatRoom = ChatRoom.create(name);
        opsHashChatRoom.put(CHAT_ROOMS, chatRoom.getRoomId(), chatRoom);
        log.info("opsHashChatRoom redis 저장되는값 입니다  : {}", opsHashChatRoom);
        System.out.println("들어가는 hash 값내용 : " +opsHashChatRoom);
        return chatRoom;
    }

    /**
     * 채팅방 입장 : redis에 topic을 만들고 pub/sub 통신을 하기 위해 리스너를 설정한다.
     */
    public void enterChatRoom(String roomId) {
        ChannelTopic topic = topics.get(roomId);
        if (topic == null) {
            topic = new ChannelTopic(roomId);
            System.out.println("topic 은 : " + topic);
            
            // Redis의 topic 채널에서 메시지가 발행되면, 
            // redisSubscriber의 onMessage 메소드를 호출하도록 설정
            redisMessageListener.addMessageListener(redisSubscriber, topic);
            topics.put(roomId, topic);
            //채팅방의 정보를 저장하고 검색하는 데는 Redis의 Hash를,
            // 채팅방의 메시지를 publish하고 subscribe하는 데는 Redis의 Pub/Sub 시스템을 사용하고 있습니다.
            // 이 두 기능은 서로 독립적으로 동작하며, roomId는 이 두 기능에서 공통적으로 사용되는 값입니다
            // 결과적으로   저장은 redis 의 Hash 를 사용해서 서버에 저장하고  
            // 구독,전송서비스는 따로  실행된다.
        }
    }

    public ChannelTopic getTopic(String roomId) {
        return topics.get(roomId);
    }
}