package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatServer02")
public class ChatServer02 {

	/*
	-해당 set 컬렉션은 클라이언트가 접속할때마다 세션ID를 저장하므로
		static으로 선언된다.
	- 접속한 웹브라우저가 웹소켓을 지원해야하며, 웹브라우저를 닫으면 
		onClose가 호출된다.
	- Collections클래스의 sychronizedSet()메소드는 공유객체에 
		동시 접근을 막도록 동기화하는 역할을 담당한다.
	*/
	
	private static Set<Session> clients = 
			Collections.synchronizedSet(new HashSet<Session>());
			//Collections.synchronizedMap(map)
			//Collections.synchronizedList(list)
			//Vector화 같이 기본적으로 add()에서 동기화처리하지 않는 컬렉션들은
			//직접 동기화처리해줄수있다.
	
	
	//클라이언트가 접속했을때 세션아이디를 추가한다.
	@OnOpen
	public void onOpen(Session session) {
		
		/*
		궁굼증:세션을 인자로 호출되는 함수는 어디인가?
		몇몇 예제에서도 onopen이벤트시 호출되는 함수에 세션을 매개변수로 받아 바로사용했다.
		
		@해당 어노테이션과 함께
		method() 형태로 또는  method(Session session) 형태로 사용했다.
		 */
		clients.add(session);
		System.out.println(session);
		System.out.println("연결되었습니다.");
		System.out.println("Open session id: "+ session.getId());
		System.out.println("session.getBasicRemote(): "+session.getBasicRemote());
		
	}
	
	//클라이언트가 접속을끊었을때
	@OnClose
	public void onClose(Session session) {
		//Set컬렉션에서 사용자세션을 제거한다.
		clients.remove(session);
		System.out.println("종료되었습니다.");
	}
	
	//클라이언트가 보낸 메세지가 도착했을때
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		//session.getId()는 0부터 시작했다.
		System.out.println(session.getId()+" :: "+ message);
		
		//동기화블럭 으로 공유객체에 대한 동시 접근을 막는다.
		synchronized (clients) {
			//Set컬렉션에 저장된 모든 클라이언트에게 메세지를 전송한다.
			for(Session client : clients) {
				//단, 메세지를 보낸 나를 제외한 나머지에게만 전송한다.
				if( !client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	//채팅중 에러가 발생했을때
	@OnError
	public void onError(Throwable e) {
		e.printStackTrace();
	}
}

























