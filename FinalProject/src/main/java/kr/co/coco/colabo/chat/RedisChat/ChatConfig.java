package kr.co.coco.colabo.chat.RedisChat;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
@EnableWebSocketMessageBroker
public class ChatConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
    	
    	//sub 로 보내면 이곳을 한번 거쳐서 프론트에 데이터를 전달해준다.
    	registry.enableSimpleBroker("/sub");    //해당 주소를 구독하고 있는 클라이언트들에게 메세지 전달
    	
    	//pub 로 데이터를 받으면 이곳을 한번 거쳐서 URI 만 MessageMapping 에 매핑이 된다.
        //ex pub/chat/message 라면 pub 를 제외하고 /chat/message 를 @MessageMapping 에 매핑한다.
        registry.setApplicationDestinationPrefixes("/pub");       //클라이언트에서 보낸 메세지를 받을 prefix
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/stomp/chat")   //SockJS 연결 주소
                .setAllowedOriginPatterns("*").withSockJS(); //버전 낮은 브라우저에서도 적용 가능
        // 주소 : ws://localhost:80/ws-stomp
    }
}