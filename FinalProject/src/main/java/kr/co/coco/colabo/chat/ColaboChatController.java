//package kr.co.coco.colabo.chat;
//
//import java.io.IOException;
//import java.util.Collections;
//import java.util.HashSet;
//import java.util.Set;
//
//import javax.websocket.OnClose;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.RemoteEndpoint.Basic;
//import javax.websocket.Session;
//import javax.websocket.server.ServerEndpoint;
//
//@ServerEndpoint 	// js에서 접속할 주소 맨뒤에 붙임
//(value = "/websocket")
//public class ColaboChatController {
//	private static final long serialVersionUID = 1L;
//    private static String rtnMsg = "";
//	private static final Set<Session> sessions = Collections.synchronizedSet(new HashSet<Session>());
//	
//	
//    public ColaboChatController() {
//        super();
//    }
//    
//    @OnOpen
//	public void onOpen(Session session) throws Exception {
//    	System.out.println("컨트롤러 ws 오픈 --");
////		WebSocket websocket;
////		websocket.
//    	
//    	Basic basic = session.getBasicRemote();
//    	basic.sendText("채팅서버연결");
//    	sessions.add(session);
////		Session session = null;
////		session.getBasicRemote();
//		
//	}
//
//    @OnMessage
//    public void onMessage(String message, Session session) {
////    	Basic basic = session.getBasicRemote();
//    	System.out.println("메세지 컨트롤러 들어옴 메세지는 : "+message);
//    	System.out.println("메세지 컨트롤러 들어옴 세션은 : "+session);
////    	rtnMsg = rtnMsg + message;
//    	
//    	System.out.println(sessions);
//    	for(Session ss : sessions) {
//    		if(!ss.equals(session)) {
//    			try {
//    				System.out.println("메세지 if문 들어옴");
//					ss.getBasicRemote().sendText(session+ "님의 메시지  :" +message);
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//    		}else if(ss.equals(session)){
//    			try {
//					ss.getBasicRemote().sendText("나의 메시지  :" +message);
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//    			System.out.println("else 문 들어옴");
//    		}
//    	}
//    	message = "";
//    }
//    
//    
//    @OnClose
//    public void onClose(Session session) {
//    	System.out.println("close 메소드 실행 ");
//    	
//    	Basic basic = session.getBasicRemote();
//    	try {
//			basic.sendText(session +" 님이 연결을 종료하였습니다.");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//    	sessions.remove(session);
//    	
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//}
