package kr.co.coco.colabo.chat.RedisChat;

import java.io.Serializable;
import java.util.UUID;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//ChatRoom은  오픈채팅방의 이름과 고유값 그리고 연결될 사용자의 세션Set이 필요합니다.
@Getter
@Setter
@NoArgsConstructor
public class ChatRoom implements Serializable {

    private String roomId;
    private String roomName;


    public static ChatRoom create(String name) {
        ChatRoom room = new ChatRoom();
        room.roomId = UUID.randomUUID().toString();
        room.roomName = name;
        System.out.println(" UUID 사용 랜덤 문자열 : "+room.roomId);
        System.out.println("room 이름 : "+room.roomName);
        return room;
        
    }
}