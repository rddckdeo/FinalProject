package kr.co.coco.colabo.chat.RedisChat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

@Configuration
public class RedisConfig {

	@Autowired
	private ObjectMapper objectMapper;
	
	@Bean
    public ObjectMapper objectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        return objectMapper;
    }
	
 /**
  * redis pub/sub 메시지를 처리하는 listener 설정
  */
	@Bean
	public RedisMessageListenerContainer redisMessageListener(RedisConnectionFactory connectionFactory) {
	    // RedisMessageListenerContainer 인스턴스 생성
	    RedisMessageListenerContainer container = new RedisMessageListenerContainer();
	    
	    // Redis 연결 팩토리 설정
	    container.setConnectionFactory(connectionFactory);
	    
	    // 구성이 완료된 RedisMessageListenerContainer 인스턴스 반환
	    return container;
	}

	
 /**
  * 어플리케이션에서 사용할 redisTemplate 설정
  */
	@Bean
	public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory connectionFactory) {
	    // RedisTemplate 인스턴스 생성
	    RedisTemplate<String, Object> redisTemplate = new RedisTemplate<>();
	    
	    // Redis 연결 팩토리 설정
	    redisTemplate.setConnectionFactory(connectionFactory);
	    
	    // Redis에서 String 타입의 Key를 사용하도록 설정
	    redisTemplate.setKeySerializer(new StringRedisSerializer());
	    
	    // Redis에서 값은 Jackson2JsonRedisSerializer를 사용하여 JSON 형식으로 직렬화
	    // Redis에 데이터를 저장하거나 불러올 때 사용하는 값(Value) 직렬화 방식을 설정
	    // Jackson JSON 처리 라이브러리를 사용하여 String 클래스 객체를 JSON 형태로 직렬화함
//	    redisTemplate.setValueSerializer(new Jackson2JsonRedisSerializer<>(String.class));
	    
	 // Redis에서 값은 Jackson2JsonRedisSerializer를 사용하여 JSON 형식으로 직렬화
	    // Redis에 데이터를 저장하거나 불러올 때 사용하는 값(Value) 직렬화 방식을 설정
	    Jackson2JsonRedisSerializer<Object> serializer = new Jackson2JsonRedisSerializer<>(Object.class);
	    
	    // 직렬화를 할때  날짜,시간을 저장할수있게 셋팅한 objectMapper 를 가져와서 세팅후 사용
	    serializer.setObjectMapper(objectMapper);
	    
	    redisTemplate.setValueSerializer(serializer);
	    
	    // 구성이 완료된 RedisTemplate 인스턴스 반환
	    return redisTemplate;
	}
	
	
	
	
	
	
	
}